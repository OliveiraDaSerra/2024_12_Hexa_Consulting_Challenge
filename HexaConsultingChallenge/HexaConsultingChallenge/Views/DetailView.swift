//
//  DetailView.swift
//  HexaConsultingChallenge
//
//  Created by Nuno Oliveira on 22/12/2024.
//

import SwiftUI

struct DetailView: View {
    var productDetails: ProductModel
    
    var body: some View {
        HStack(spacing: 20.0) {
            VStack(alignment: .center) {
                ThumbnailView(
                    product: productDetails,
                    thumbnailSize: .init(
                        width: 88.0,
                        height: 88.0
                    )
                )
                
                Spacer()
            }
            
            VStack(
                alignment: .leading,
                spacing: 8.0
            ) {
                TitleValue(
                    title: "Title:",
                    value: productDetails.title ?? ""
                )
                
                TitleValue(
                    title: "Rating:",
                    value: "\(productDetails.rating ?? 0.0)"
                )
                
                TitleValue(
                    title: "Price:",
                    value: "\(productDetails.price ?? 0.0) €"
                )
                
                TitleValue(
                    title: "Discount:",
                    value: "\(productDetails.discountPercentage ?? 0.0) %"
                )
                
                TitleValue(
                    title: "Stock:",
                    value: "\(productDetails.stock ?? 0.0)"
                )
                
                Spacer()
            }
        }
    }
}

#Preview {
    DetailView(
        productDetails: ProductModel(
            idApi: 1,
            title: "ABC",
            thumbnail: nil,
            rating: 0.0,
            price: 0.0,
            discountPercentage: 0.0,
            stock: 0.0
        )
    )
}
