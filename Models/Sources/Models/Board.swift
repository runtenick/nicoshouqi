//
//  Board.swift
//  
//
//  Created by étudiant on 09/01/2024.
//

import Foundation

public struct Board {
    let nbRows: Int
    let nbColumns: Int
    private(set) var grid: [[Cell]]
    
    public init?(grid: [[Cell]]) {
        let rowSize = grid.first?.count ?? 0
        
        for row in grid {
            if row.count != rowSize {
                return nil
            }
        }
        
        self.nbRows = grid.count
        self.nbColumns = rowSize
        self.grid = grid
    }
}
