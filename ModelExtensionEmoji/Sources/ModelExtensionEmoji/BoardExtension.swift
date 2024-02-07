//
//  File.swift
//  
//
//  Created by étudiant on 13/01/2024.
//

import Foundation
import Models

extension Board: CustomStringConvertible {
     public var description: String {
        var board = ""
        for row in self.grid {
            for cell in row {
                if let piece = cell.piece {
                    // if there is a piece display animal + owner too
                    board += "\(cell.cellType.symbol)\(piece.animal.symbol)\(piece.owner.symbol)"
                } else {
                    // otherwise just the cell type
                    board += "\(cell.cellType.symbol)    "
                }
            }
            // prints one line, then resets board
            // print(board)
            board += "\n"
        }
        return board
    }
}
