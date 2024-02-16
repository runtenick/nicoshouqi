//
//  RulesExtension.swift
//  
//
//  Created by étudiant on 16/02/2024.
//

import Foundation
import Models

extension Rules {
    public func toRules(rulesData: RulesDataMapper) -> Rules{
        return rulesData.getRules()
    }
    
    public func toRulesDataMapper() -> RulesDataMapper {
        let mirror = Mirror(reflecting: self)
        let rulesDataMapper = RulesDataMapper(ocurrences: self.ocurrences, historic: self.historic, rulesTtype: "\(mirror.subjectType)")
        return rulesDataMapper
    }
}
