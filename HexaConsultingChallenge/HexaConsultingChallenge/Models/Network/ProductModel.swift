//
//  ProductModel.swift
//  HexaConsultingChallenge
//
//  Created by Nuno Oliveira on 22/12/2024.
//

import Foundation

struct ProductModel: Codable, Identifiable, Equatable, Hashable {
    let id: UUID = UUID()
    let idApi: Int
    let title, thumbnail: String?
    let rating, price, discountPercentage, stock: Double?
    
    enum CodingKeys: String, CodingKey {
        case idApi = "id"
        case title, thumbnail
        case rating, price, discountPercentage, stock
    }
}
