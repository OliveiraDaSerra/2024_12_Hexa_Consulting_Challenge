//
//  ProductsDataService.swift
//  HexaConsultingChallenge
//
//  Created by Nuno Oliveira on 22/12/2024.
//

import Foundation
import Combine

class ProductsDataService {
    @Published var products: [ProductModel] = []
    private let disposeBag = CancellableBag()
    
    func fetchProducts(completion: @escaping () -> Void) throws {
        let urlRequest: URLRequest = try NetworkManager.shared.urlRequest(to: .products)
        NetworkManager.shared.makeRequest(for: urlRequest)
            .decode(type: ProductListModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] productList in
                guard let self else { return }
                self.products = productList.products
                completion()
            })
            .store(in: disposeBag)
    }
}
