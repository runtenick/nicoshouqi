//
//  RulesDataMapper.swift
//  
//
//  Created by étudiant on 16/02/2024.
//

import Foundation
import Models

public struct RulesDataMapper: Codable {
    public init(ocurrences: [Board:Int], historic: [Move], rulesTtype: String) {
        self.ocurrences = ocurrences
        self.historic = historic
        self.rulesType = rulesTtype
    }
    
    var ocurrences: [Board:Int]
    var historic: [Move]
    var rulesType: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ocurrences = try container.decode([Board : Int].self, forKey: .ocurrences)
        self.historic = try container.decode([Move].self, forKey: .historic)
        self.rulesType = try container.decode(String.self, forKey: .rulesType)
    }
    
    public enum CodingKeys: CodingKey {
        case ocurrences
        case historic
        case rulesType
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.ocurrences, forKey: .ocurrences)
        try container.encode(self.historic, forKey: .historic)
        try container.encode(self.rulesType, forKey: .rulesType)
    }
    
    public func getRules() -> Rules{
        switch rulesType {
            case "VerySimpleRules":
                var simpleRules = VerySimpleRules()
                simpleRules.historic = self.historic
                simpleRules.ocurrences = self.ocurrences
                return simpleRules
        default:
            fatalError("wasn't able to create new rules")
        }
    }
}
