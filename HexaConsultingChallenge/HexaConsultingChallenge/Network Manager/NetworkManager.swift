//
//  NetworkManager.swift
//  HexaConsultingChallenge
//
//  Created by Nuno Oliveira on 22/12/2024.
//

import Foundation
import Combine

class NetworkManager: ObservableObject {
    static let shared = NetworkManager()
    
    func urlRequest(
        to endpoint: ApiEndpoint,
        requestBody: Data? = nil,
        headers: [String: String]? = nil,
        queryItems: [URLQueryItem]? = nil
    ) throws -> URLRequest {
        guard let url = endpoint.url else {
            debugPrint("Invalid URL: \(String(describing: endpoint.url))")
            throw URLError(.badURL)
        }
        
        debugPrint("URL: \(url)")
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let queryItems {
            request.url?.append(queryItems: queryItems)
        }
        
        if let headers {
            headers.forEach { key, value in
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        if let requestBody = requestBody {
            request.httpBody = requestBody
            debugPrint("Request Body:")
            requestBody.printFormatedJSON()
        }
        
        return request
    }
    
    func makeRequest(
        for urlRequest: URLRequest
    ) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: urlRequest) // runs on background thread
            .tryMap { try self.handleUrlResponse(output: $0, urlRequest: urlRequest) }
            .retry(3)
            .eraseToAnyPublisher()
    }
    
    private func handleUrlResponse(
        output: URLSession.DataTaskPublisher.Output,
        urlRequest: URLRequest
    ) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300
        else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
