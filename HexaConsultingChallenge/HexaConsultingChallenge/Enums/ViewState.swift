//
//  ViewState.swift
//  HexaConsultingChallenge
//
//  Created by Nuno Oliveira on 22/12/2024.
//

import Foundation

enum ViewState<T>: Equatable where T: Equatable {
    case idle
    case loading
    case success(T)
    case failed(Error)
    
    static func ==(lhs: ViewState, rhs: ViewState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case let (.success(lhsValue), .success(rhsValue)):
            return lhsValue == rhsValue
        case let (.failed(lhsError), .failed(rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        default:
            return false
        }
    }
}
