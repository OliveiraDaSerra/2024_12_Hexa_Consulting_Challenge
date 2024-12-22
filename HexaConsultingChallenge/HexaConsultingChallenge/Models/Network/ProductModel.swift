//
//  ProductModel.swift
//  HexaConsultingChallenge
//
//  Created by Nuno Oliveira on 22/12/2024.
//

import Foundation

struct ProductModel: Codable, Identifiable, Equatable {
    let id: Int
    let title, thumbnail: String?
    let rating, price, discountPercentage, stock: Double?
    
    enum CodingKeys: CodingKey {
        case id
        case title, thumbnail
        case rating, price, discountPercentage, stock
    }
}
