//
//  ProductListModel.swift
//  HexaConsultingChallenge
//
//  Created by Nuno Oliveira on 22/12/2024.
//

import Foundation

struct ProductListModel: Codable, Identifiable, Equatable, Hashable {
    let id: UUID = UUID()
    let products: [ProductModel]
    
    enum CodingKeys: CodingKey {
        case products
    }
}
