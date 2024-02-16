//
//  MyFileManager.swift
//  
//
//  Created by étudiant on 12/02/2024.
//

import Foundation
import Models

struct MyFileManager {
    static func getSaveDirectoryUrl() throws -> URL {
        // build base URL to save data to
        let documentsUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let baseUrl = documentsUrl.appendingPathComponent("Game")
        
        // check if the file at the url already exists
        if !FileManager.default.fileExists(atPath: baseUrl.absoluteString) {
            // if not create
            try FileManager.default.createDirectory(at: baseUrl, withIntermediateDirectories: true)
        }
        return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Game")
    }
    
    // Write function
    public static func saveGame() async throws {
        
    }
    
    // Read function
    public static func readGame() async throws {
        
    }
}

