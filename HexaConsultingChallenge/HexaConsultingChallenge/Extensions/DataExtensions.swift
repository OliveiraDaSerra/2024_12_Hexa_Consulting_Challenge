//
//  DataExtensions.swift
//  HexaConsultingChallenge
//
//  Created by Nuno Oliveira on 22/12/2024.
//

import Foundation

extension Data {
    func printFormatedJSON() {
        if let json = try? JSONSerialization.jsonObject(with: self, options: .mutableContainers),
           let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        {
            self.pringJSONData(jsonData)
        } else {
            assertionFailure("Malformed JSON")
        }
    }
    
    private func pringJSONData(_ data: Data) {
        print(String(decoding: data, as: UTF8.self))
    }
}
