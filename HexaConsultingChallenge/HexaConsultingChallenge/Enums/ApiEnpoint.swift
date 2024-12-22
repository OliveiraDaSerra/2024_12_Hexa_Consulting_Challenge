//
//  ApiEnpoint.swift
//  HexaConsultingChallenge
//
//  Created by Nuno Oliveira on 22/12/2024.
//

import Foundation

enum ApiEndpoint {
    case products
    
    var url: URL? {
        switch self {
        case .products:
            return URL(string: "https://dummyjson.com/products")
        }
    }
    
    var httpMethod: HttpMethod {
        switch self {
        case .products:
            return .GET
        }
    }
}
