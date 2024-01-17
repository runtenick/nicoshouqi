//
//  File.swift
//  
//
//  Created by étudiant on 16/01/2024.
//

import Foundation

public enum BoardResult : Equatable {
    case unknown
    case ok
    case failed(reason: BoardFailingReason)
}
