//
//  BoardExtension.swift
//  
//
//  Created by étudiant on 16/02/2024.
//

import Foundation
import Models

extension Board: Codable {
    private enum CodingKeys: String, CodingKey {
            case grid
        }

    public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let grid = try container.decode([[Cell]].self, forKey: .grid)

            // Initialize the struct using self.init
            self.init(grid: grid)!
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(grid, forKey: .grid)
        }
}
