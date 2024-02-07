//
//  File.swift
//  
//
//  Created by étudiant on 06/02/2024.
//

import Foundation
import Models

extension WinningReason : CustomStringConvertible {
    public var description: String {
        switch self {
            case .denReached:
                return "the opponent's den has been reached."
            case .noMorePieces:
                return "the opponent has no more pieces left."
            case .noMovesLeft:
                return "the opponent has no more moves left."
            case .tooManyOcurrences:
                return "there were too many occurrences of the save move."
        }
    }
}
