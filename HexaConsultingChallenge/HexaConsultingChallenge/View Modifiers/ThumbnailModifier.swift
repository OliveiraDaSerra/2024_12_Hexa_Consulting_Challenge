//
//  ThumbnailModifier.swift
//  HexaConsultingChallenge
//
//  Created by Nuno Oliveira on 22/12/2024.
//

import SwiftUI

extension Image {
    func thumbnailStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(
                width: 44.0,
                height: 44.0
            )
            .clipped(antialiased: true)
            .padding(4.0)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 8.0,
                    style: .circular
                )
            )
            .overlay(
                RoundedRectangle(
                    cornerRadius: 8.0,
                    style: .circular
                )
                .stroke(
                    .black,
                    lineWidth: 1.0
                )
            )
    }
}
