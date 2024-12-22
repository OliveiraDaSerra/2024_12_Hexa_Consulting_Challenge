//
//  TitleValue.swift
//  HexaConsultingChallenge
//
//  Created by Nuno Oliveira on 22/12/2024.
//

import SwiftUI

struct TitleValue: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 8.0) {
            Text(title)
                .font(.caption2)
            
            Text(value)
                .font(.headline)
        }
    }
}

#Preview {
    TitleValue(
        title: "Title",
        value: "Value"
    )
}
