//
//  ThumbnailView.swift
//  HexaConsultingChallenge
//
//  Created by Nuno Oliveira on 22/12/2024.
//

import SwiftUI

struct ThumbnailView: View {
    var product: ProductModel
    var thumbnailSize: CGSize
    
    var body: some View {
        if let thumbnail = product.thumbnail {
            AsyncImage(url: URL(string: thumbnail)) { image in
                image
                    .thumbnailStyle()
            } placeholder: {
                ProgressView()
                    .frame(
                        width: thumbnailSize.width,
                        height: thumbnailSize.height
                    )
            }
        } else {
            Image(systemName: "questionmark.app.dashed")
                .thumbnailStyle()
        }
    }
}

#Preview {
    ThumbnailView(
        product: ProductModel(
            idApi: 1,
            title: "ABC",
            thumbnail: nil,
            rating: 0.0,
            price: 0.0,
            discountPercentage: 0.0,
            stock: 0.0
        ),
        thumbnailSize: .init(
            width: 44.0,
            height: 44.0
        )
    )
}
