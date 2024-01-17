//
//  File.swift
//  
//
//  Created by étudiant on 16/01/2024.
//

import Foundation

public enum BoardFailingReason : Equatable {
    case unknown
    case outOfBounds
    case cellNotEmpty
    case cellEmpty
}
