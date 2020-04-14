//
//  Characters.swift
//  CustomCollectionViewLayout
//
//  Created by Pankaj kumar on 14/04/20.
//  Copyright © 2020 Pankaj kumar. All rights reserved.
//

import UIKit

class Characters {
    let name: String
    let description: String
    let hitPoints: Int
    let title: String
    let attack: String
    let damage: String
    
    init(name: String, description: String, hitPoints: Int, title: String, attack: String, damage: String) {
        self.name = name
        self.title = title
        self.description = description
        self.hitPoints = hitPoints
        self.attack = attack
        self.damage = damage
    }
    
    convenience init (dictionary: NSDictionary) {
        let name = dictionary["name"] as? String ?? ""
        let title = dictionary["title"] as? String ?? ""
        let description = dictionary["description"] as? String ?? ""
        let hitPoints = dictionary["hitPoints"] as? Int ?? 0
        let attack = dictionary["attack"] as? String ?? ""
        let damage = dictionary["damage"] as? String ?? ""
        
        self.init(name: name, description: description, hitPoints: hitPoints, title: title, attack: attack, damage: damage)
    }
    
    class func loadCharacters() -> [Characters] {
        var characters = [Characters]()
        if let path = Bundle.main.path(forResource: "Character_Data", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                for item in dictArray {
                    let character = Characters(dictionary: item as! NSDictionary)
                    characters.append(character)
                }
            }
        }
        return characters
    }
}
