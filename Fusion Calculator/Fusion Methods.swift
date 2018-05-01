//
//  fusionrules.swift
//  Fusion Calculator
//
//  Created by Andrew Ratz on 4/29/18.
//  Copyright © 2018 Andrew Ratz. All rights reserved.
//

import Foundation

struct TwoArcanas: Hashable {
    let arcanas: [String]

    var hashValue: Int {
        let both = arcanas[0] + arcanas[1]
        return strlen(both)
    }
    
    static func ==(lhs: TwoArcanas, rhs: TwoArcanas) -> Bool {
        if (lhs.arcanas[0] == rhs.arcanas[0] && lhs.arcanas[1] == rhs.arcanas[1]) {
            return true
            
        }
        else if (lhs.arcanas[0] == rhs.arcanas[1] && lhs.arcanas[1] == rhs.arcanas[0]) {
            return true
        }
        else {
            return false
        }
    }
}

var arcanaResult: [TwoArcanas: String] = [
    TwoArcanas.init(arcanas:["Fool", "Fool"]): "Fool",
    TwoArcanas.init(arcanas:["Fool", "Magician"]): "Death",
    TwoArcanas.init(arcanas:["Fool", "Priestess"]): "Moon",
    TwoArcanas.init(arcanas:["Fool", "Empress"]): "Hanged Man",
    TwoArcanas.init(arcanas:["Fool", "Emperor"]): "Temperance",
    TwoArcanas.init(arcanas:["Fool", "Hierophant"]): "Hermit",
    TwoArcanas.init(arcanas:["Fool", "Lovers"]): "Chariot",
    TwoArcanas.init(arcanas:["Fool", "Chariot"]): "Moon",
    TwoArcanas.init(arcanas:["Fool", "Justice"]): "Star",
    TwoArcanas.init(arcanas:["Fool", "Hermit"]): "Priestess",
    TwoArcanas.init(arcanas:["Fool", "Fortune"]): "Lovers",
    TwoArcanas.init(arcanas:["Fool", "Strength"]): "Death",
    TwoArcanas.init(arcanas:["Fool", "Hanged Man"]): "Tower",
    TwoArcanas.init(arcanas:["Fool", "Death"]): "Strength",
    TwoArcanas.init(arcanas:["Fool", "Temperance"]): "Hierophant",
    TwoArcanas.init(arcanas:["Fool", "Devil"]): "Temperance",
    TwoArcanas.init(arcanas:["Fool", "Tower"]): "Empress",
    TwoArcanas.init(arcanas:["Fool", "Star"]): "Magician",
    TwoArcanas.init(arcanas:["Fool", "Moon"]): "Justice",
    TwoArcanas.init(arcanas:["Fool", "Sun"]): "Justice",
    TwoArcanas.init(arcanas:["Fool", "Judgement"]): "Sun",
    TwoArcanas.init(arcanas:["Magician", "Magician"]): "Magician",
    TwoArcanas.init(arcanas:["Magician", "Priestess"]): "Temperance",
    TwoArcanas.init(arcanas:["Magician", "Empress"]): "Justice",
    TwoArcanas.init(arcanas:["Magician", "Emperor"]): "Hanged Man",
    TwoArcanas.init(arcanas:["Magician", "Hierophant"]): "Death",
    TwoArcanas.init(arcanas:["Magician", "Lovers"]): "Devil",
    TwoArcanas.init(arcanas:["Magician", "Chariot"]): "Priestess",
    TwoArcanas.init(arcanas:["Magician", "Justice"]): "Emperor",
    TwoArcanas.init(arcanas:["Magician", "Hermit"]): "Lovers",
    TwoArcanas.init(arcanas:["Magician", "Fortune"]): "Justice",
    TwoArcanas.init(arcanas:["Magician", "Strength"]): "Fool",
    TwoArcanas.init(arcanas:["Magician", "Hanged Man"]): "Empress",
    TwoArcanas.init(arcanas:["Magician", "Death"]): "Hermit",
    TwoArcanas.init(arcanas:["Magician", "Temperance"]): "Chariot",
    TwoArcanas.init(arcanas:["Magician", "Devil"]): "Hierophant",
    TwoArcanas.init(arcanas:["Magician", "Tower"]): "Temperance",
    TwoArcanas.init(arcanas:["Magician", "Star"]): "Priestess",
    TwoArcanas.init(arcanas:["Magician", "Moon"]): "Lovers",
    TwoArcanas.init(arcanas:["Magician", "Sun"]): "Hierophant",
    TwoArcanas.init(arcanas:["Magician", "Judgement"]): "Strength",
    TwoArcanas.init(arcanas:["Priestess", "Priestess"]): "Priestess",
    TwoArcanas.init(arcanas:["Priestess", "Empress"]): "Emperor",
    TwoArcanas.init(arcanas:["Priestess", "Emperor"]): "Empress",
    TwoArcanas.init(arcanas:["Priestess", "Hierophant"]): "Magician",
    TwoArcanas.init(arcanas:["Priestess", "Lovers"]): "Fortune",
    TwoArcanas.init(arcanas:["Priestess", "Chariot"]): "Hierophant",
    TwoArcanas.init(arcanas:["Priestess", "Justice"]): "Death",
    TwoArcanas.init(arcanas:["Priestess", "Hermit"]): "Temperance",
    TwoArcanas.init(arcanas:["Priestess", "Fortune"]): "Magician",
    TwoArcanas.init(arcanas:["Priestess", "Strength"]): "Devil",
    TwoArcanas.init(arcanas:["Priestess", "Hanged Man"]): "Death",
    TwoArcanas.init(arcanas:["Priestess", "Death"]): "Magician",
    TwoArcanas.init(arcanas:["Priestess", "Temperance"]): "Devil",
    TwoArcanas.init(arcanas:["Priestess", "Devil"]): "Moon",
    TwoArcanas.init(arcanas:["Priestess", "Tower"]): "Hanged Man",
    TwoArcanas.init(arcanas:["Priestess", "Star"]): "Hermit",
    TwoArcanas.init(arcanas:["Priestess", "Moon"]): "Hierophant",
    TwoArcanas.init(arcanas:["Priestess", "Sun"]): "Chariot",
    TwoArcanas.init(arcanas:["Priestess", "Judgement"]): "Justice",
    TwoArcanas.init(arcanas:["Empress", "Empress"]): "Empress",
    TwoArcanas.init(arcanas:["Empress", "Emperor"]): "Justice",
    TwoArcanas.init(arcanas:["Empress", "Hierophant"]): "Fool",
    TwoArcanas.init(arcanas:["Empress", "Lovers"]): "Judgement",
    TwoArcanas.init(arcanas:["Empress", "Chariot"]): "Star",
    TwoArcanas.init(arcanas:["Empress", "Justice"]): "Lovers",
    TwoArcanas.init(arcanas:["Empress", "Hermit"]): "Strength",
    TwoArcanas.init(arcanas:["Empress", "Fortune"]): "Hermit",
    TwoArcanas.init(arcanas:["Empress", "Strength"]): "Chariot",
    TwoArcanas.init(arcanas:["Empress", "Hanged Man"]): "Priestess",
    TwoArcanas.init(arcanas:["Empress", "Death"]): "Fool",
    TwoArcanas.init(arcanas:["Empress", "Temperance"]): "Priestess",
    TwoArcanas.init(arcanas:["Empress", "Devil"]): "Sun",
    TwoArcanas.init(arcanas:["Empress", "Tower"]): "Emperor",
    TwoArcanas.init(arcanas:["Empress", "Star"]): "Lovers",
    TwoArcanas.init(arcanas:["Empress", "Moon"]): "Fortune",
    TwoArcanas.init(arcanas:["Empress", "Sun"]): "Tower",
    TwoArcanas.init(arcanas:["Empress", "Judgement"]): "Emperor",
    TwoArcanas.init(arcanas:["Emperor", "Emperor"]): "Emperor",
    TwoArcanas.init(arcanas:["Emperor", "Hierophant"]): "Fortune",
    TwoArcanas.init(arcanas:["Emperor", "Lovers"]): "Fool",
    TwoArcanas.init(arcanas:["Emperor", "Chariot"]): "Strength",
    TwoArcanas.init(arcanas:["Emperor", "Justice"]): "Chariot",
    TwoArcanas.init(arcanas:["Emperor", "Hermit"]): "Hierophant",
    TwoArcanas.init(arcanas:["Emperor", "Fortune"]): "Sun",
    TwoArcanas.init(arcanas:["Emperor", "Strength"]): "Tower",
    TwoArcanas.init(arcanas:["Emperor", "Hanged Man"]): "Devil",
    TwoArcanas.init(arcanas:["Emperor", "Death"]): "Hermit",
    TwoArcanas.init(arcanas:["Emperor", "Temperance"]): "Devil",
    TwoArcanas.init(arcanas:["Emperor", "Devil"]): "Justice",
    TwoArcanas.init(arcanas:["Emperor", "Tower"]): "Star",
    TwoArcanas.init(arcanas:["Emperor", "Star"]): "Lovers",
    TwoArcanas.init(arcanas:["Emperor", "Moon"]): "Tower",
    TwoArcanas.init(arcanas:["Emperor", "Sun"]): "Judgement",
    TwoArcanas.init(arcanas:["Emperor", "Judgement"]): "Priestess",
    TwoArcanas.init(arcanas:["Hierophant", "Hierophant"]): "Hierophant",
    TwoArcanas.init(arcanas:["Hierophant", "Lovers"]): "Strength",
    TwoArcanas.init(arcanas:["Hierophant", "Chariot"]): "Star",
    TwoArcanas.init(arcanas:["Hierophant", "Justice"]): "Hanged Man",
    TwoArcanas.init(arcanas:["Hierophant", "Hermit"]): "Fortune",
    TwoArcanas.init(arcanas:["Hierophant", "Fortune"]): "Justice",
    TwoArcanas.init(arcanas:["Hierophant", "Strength"]): "Fool",
    TwoArcanas.init(arcanas:["Hierophant", "Hanged Man"]): "Sun",
    TwoArcanas.init(arcanas:["Hierophant", "Death"]): "Chariot",
    TwoArcanas.init(arcanas:["Hierophant", "Temperance"]): "Death",
    TwoArcanas.init(arcanas:["Hierophant", "Devil"]): "Hanged Man",
    TwoArcanas.init(arcanas:["Hierophant", "Tower"]): "Judgement",
    TwoArcanas.init(arcanas:["Hierophant", "Star"]): "Tower",
    TwoArcanas.init(arcanas:["Hierophant", "Moon"]): "Priestess",
    TwoArcanas.init(arcanas:["Hierophant", "Sun"]): "Lovers",
    TwoArcanas.init(arcanas:["Hierophant", "Judgement"]): "Empress",
    TwoArcanas.init(arcanas:["Lovers", "Lovers"]): "Lovers",
    TwoArcanas.init(arcanas:["Lovers", "Chariot"]): "Temperance",
    TwoArcanas.init(arcanas:["Lovers", "Justice"]): "Judgement",
    TwoArcanas.init(arcanas:["Lovers", "Hermit"]): "Chariot",
    TwoArcanas.init(arcanas:["Lovers", "Fortune"]): "Strength",
    TwoArcanas.init(arcanas:["Lovers", "Strength"]): "Death",
    TwoArcanas.init(arcanas:["Lovers", "Hanged Man"]): "Sun",
    TwoArcanas.init(arcanas:["Lovers", "Death"]): "Temperance",
    TwoArcanas.init(arcanas:["Lovers", "Temperance"]): "Strength",
    TwoArcanas.init(arcanas:["Lovers", "Devil"]): "Moon",
    TwoArcanas.init(arcanas:["Lovers", "Tower"]): "Empress",
    TwoArcanas.init(arcanas:["Lovers", "Star"]): "Chariot",
    TwoArcanas.init(arcanas:["Lovers", "Moon"]): "Magician",
    TwoArcanas.init(arcanas:["Lovers", "Sun"]): "Empress",
    TwoArcanas.init(arcanas:["Lovers", "Judgement"]): "Hanged Man",
    TwoArcanas.init(arcanas:["Chariot", "Chariot"]): "Chariot",
    TwoArcanas.init(arcanas:["Chariot", "Justice"]): "Moon",
    TwoArcanas.init(arcanas:["Chariot", "Hermit"]): "Devil",
    TwoArcanas.init(arcanas:["Chariot", "Fortune"]): "Priestess",
    TwoArcanas.init(arcanas:["Chariot", "Strength"]): "Hermit",
    TwoArcanas.init(arcanas:["Chariot", "Hanged Man"]): "Fool",
    TwoArcanas.init(arcanas:["Chariot", "Death"]): "Devil",
    TwoArcanas.init(arcanas:["Chariot", "Temperance"]): "Strength",
    TwoArcanas.init(arcanas:["Chariot", "Devil"]): "Temperance",
    TwoArcanas.init(arcanas:["Chariot", "Tower"]): "Fortune",
    TwoArcanas.init(arcanas:["Chariot", "Star"]): "Moon",
    TwoArcanas.init(arcanas:["Chariot", "Moon"]): "Lovers",
    TwoArcanas.init(arcanas:["Chariot", "Sun"]): "Priestess",
    TwoArcanas.init(arcanas:["Justice", "Justice"]): "Justice",
    TwoArcanas.init(arcanas:["Justice", "Hermit"]): "Magician",
    TwoArcanas.init(arcanas:["Justice", "Fortune"]): "Emperor",
    TwoArcanas.init(arcanas:["Justice", "Strength"]): "Hierophant",
    TwoArcanas.init(arcanas:["Justice", "Hanged Man"]): "Lovers",
    TwoArcanas.init(arcanas:["Justice", "Death"]): "Fool",
    TwoArcanas.init(arcanas:["Justice", "Temperance"]): "Emperor",
    TwoArcanas.init(arcanas:["Justice", "Devil"]): "Fool",
    TwoArcanas.init(arcanas:["Justice", "Tower"]): "Sun",
    TwoArcanas.init(arcanas:["Justice", "Star"]): "Empress",
    TwoArcanas.init(arcanas:["Justice", "Moon"]): "Devil",
    TwoArcanas.init(arcanas:["Justice", "Sun"]): "Hanged Man",
    TwoArcanas.init(arcanas:["Hermit", "Hermit"]): "Hermit",
    TwoArcanas.init(arcanas:["Hermit", "Fortune"]): "Star",
    TwoArcanas.init(arcanas:["Hermit", "Strength"]): "Hierophant",
    TwoArcanas.init(arcanas:["Hermit", "Hanged Man"]): "Star",
    TwoArcanas.init(arcanas:["Hermit", "Death"]): "Strength",
    TwoArcanas.init(arcanas:["Hermit", "Temperance"]): "Strength",
    TwoArcanas.init(arcanas:["Hermit", "Devil"]): "Priestess",
    TwoArcanas.init(arcanas:["Hermit", "Tower"]): "Judgement",
    TwoArcanas.init(arcanas:["Hermit", "Star"]): "Strength",
    TwoArcanas.init(arcanas:["Hermit", "Moon"]): "Priestess",
    TwoArcanas.init(arcanas:["Hermit", "Sun"]): "Devil",
    TwoArcanas.init(arcanas:["Hermit", "Judgement"]): "Emperor",
    TwoArcanas.init(arcanas:["Fortune", "Fortune"]): "Fortune",
    TwoArcanas.init(arcanas:["Fortune", "Strength"]): "Temperance",
    TwoArcanas.init(arcanas:["Fortune", "Hanged Man"]): "Emperor",
    TwoArcanas.init(arcanas:["Fortune", "Death"]): "Star",
    TwoArcanas.init(arcanas:["Fortune", "Temperance"]): "Empress",
    TwoArcanas.init(arcanas:["Fortune", "Devil"]): "Hierophant",
    TwoArcanas.init(arcanas:["Fortune", "Tower"]): "Hanged Man",
    TwoArcanas.init(arcanas:["Fortune", "Star"]): "Devil",
    TwoArcanas.init(arcanas:["Fortune", "Moon"]): "Sun",
    TwoArcanas.init(arcanas:["Fortune", "Sun"]): "Star",
    TwoArcanas.init(arcanas:["Fortune", "Judgement"]): "Tower",
    TwoArcanas.init(arcanas:["Strength", "Strength"]): "Strength",
    TwoArcanas.init(arcanas:["Strength", "Hanged Man"]): "Temperance",
    TwoArcanas.init(arcanas:["Strength", "Death"]): "Hierophant",
    TwoArcanas.init(arcanas:["Strength", "Temperance"]): "Chariot",
    TwoArcanas.init(arcanas:["Strength", "Devil"]): "Death",
    TwoArcanas.init(arcanas:["Strength", "Tower"]): "Chariot",
    TwoArcanas.init(arcanas:["Strength", "Star"]): "Moon",
    TwoArcanas.init(arcanas:["Strength", "Moon"]): "Magician",
    TwoArcanas.init(arcanas:["Strength", "Sun"]): "Moon",
    TwoArcanas.init(arcanas:["Hanged Man", "Hanged Man"]): "Hanged Man",
    TwoArcanas.init(arcanas:["Hanged Man", "Death"]): "Moon",
    TwoArcanas.init(arcanas:["Hanged Man", "Temperance"]): "Death",
    TwoArcanas.init(arcanas:["Hanged Man", "Devil"]): "Fortune",
    TwoArcanas.init(arcanas:["Hanged Man", "Tower"]): "Hermit",
    TwoArcanas.init(arcanas:["Hanged Man", "Star"]): "Justice",
    TwoArcanas.init(arcanas:["Hanged Man", "Moon"]): "Strength",
    TwoArcanas.init(arcanas:["Hanged Man", "Sun"]): "Hierophant",
    TwoArcanas.init(arcanas:["Hanged Man", "Judgement"]): "Star",
    TwoArcanas.init(arcanas:["Death", "Death"]): "Death",
    TwoArcanas.init(arcanas:["Death", "Temperance"]): "Hanged Man",
    TwoArcanas.init(arcanas:["Death", "Devil"]): "Chariot",
    TwoArcanas.init(arcanas:["Death", "Tower"]): "Sun",
    TwoArcanas.init(arcanas:["Death", "Star"]): "Devil",
    TwoArcanas.init(arcanas:["Death", "Moon"]): "Hierophant",
    TwoArcanas.init(arcanas:["Death", "Sun"]): "Priestess",
    TwoArcanas.init(arcanas:["Temperance", "Temperance"]): "Temperance",
    TwoArcanas.init(arcanas:["Temperance", "Devil"]): "Fool",
    TwoArcanas.init(arcanas:["Temperance", "Tower"]): "Fortune",
    TwoArcanas.init(arcanas:["Temperance", "Star"]): "Sun",
    TwoArcanas.init(arcanas:["Temperance", "Moon"]): "Fortune",
    TwoArcanas.init(arcanas:["Temperance", "Sun"]): "Magician",
    TwoArcanas.init(arcanas:["Temperance", "Judgement"]): "Hermit",
    TwoArcanas.init(arcanas:["Devil", "Devil"]): "Devil",
    TwoArcanas.init(arcanas:["Devil", "Tower"]): "Magician",
    TwoArcanas.init(arcanas:["Devil", "Star"]): "Strength",
    TwoArcanas.init(arcanas:["Devil", "Moon"]): "Chariot",
    TwoArcanas.init(arcanas:["Devil", "Sun"]): "Hermit",
    TwoArcanas.init(arcanas:["Devil", "Judgement"]): "Lovers",
    TwoArcanas.init(arcanas:["Tower", "Tower"]): "Tower",
    TwoArcanas.init(arcanas:["Tower", "Star"]): "Death",
    TwoArcanas.init(arcanas:["Tower", "Moon"]): "Hermit",
    TwoArcanas.init(arcanas:["Tower", "Sun"]): "Emperor",
    TwoArcanas.init(arcanas:["Tower", "Judgement"]): "Moon",
    TwoArcanas.init(arcanas:["Star", "Star"]): "Star",
    TwoArcanas.init(arcanas:["Star", "Moon"]): "Temperance",
    TwoArcanas.init(arcanas:["Star", "Sun"]): "Judgement",
    TwoArcanas.init(arcanas:["Star", "Judgement"]): "Fortune",
    TwoArcanas.init(arcanas:["Moon", "Moon"]): "Moon",
    TwoArcanas.init(arcanas:["Moon", "Sun"]): "Empress",
    TwoArcanas.init(arcanas:["Moon", "Judgement"]): "Fool",
    TwoArcanas.init(arcanas:["Sun", "Sun"]): "Sun",
    TwoArcanas.init(arcanas:["Sun", "Judgement"]): "Death",
    TwoArcanas.init(arcanas:["Judgement", "Judgement"]): "Judgement"
]

func getResultArcana(first: String, second: String) -> String {
    //print(first, second)
    let resultantArcana = arcanaResult[TwoArcanas.init(arcanas:[first, second])]
    //Damn Judgement
    if (resultantArcana == nil) {
        return ""
    }
    return resultantArcana!
}



struct TwoPersonas: Hashable {
    let personas: [String: Persona]
    
    var hashValue: Int {
        return 47 //idk, does it matter?
    }
    
    static func ==(lhs: TwoPersonas, rhs: TwoPersonas) -> Bool {
        if (lhs.personas.first!.key == rhs.personas.first!.key && lhs.personas.reversed().first!.key == rhs.personas.reversed().first!.key) {
            return true
        }
        else if (lhs.personas.first!.key == rhs.personas.reversed().first!.key && lhs.personas.reversed().first!.key == rhs.personas.first!.key) {
            return true
        }
        else {
            return false
        }
    }
}

//Gets all valid fusion combos
func getRecipes(name: String, persona: Persona) -> [TwoPersonas: Int]{
    var results: [TwoPersonas: Int] = [:]
    myStructDictionary.forEach {
        let key1 = $0.key
        let value1 = $0.value
        myStructDictionary.forEach {
            let key2 = $0.key
            let value2 = $0.value
            
            //Start of timesaving(?)
            let resultArcana = getResultArcana(first: value1.arcana, second: value2.arcana)
            if (resultArcana != persona.arcana) {
                return
            }
            //End of timesaving(?)
            
            var result: [String: Persona] = [:]
            if (key1 != key2) {
                result = fuse(persona1: value1, persona2: value2)
            }
            //Valid fusion
            if (result.first?.key == name) {
                let twoPersonas = TwoPersonas.init(personas: [key1: value1, key2: value2])
                let cost = getApproxCost(twoPersonas: twoPersonas)
                results[twoPersonas] = cost
            }
        }
    }
    //print("The results are: ", results)
    return results
}

/*func getArcanaRecipes(arcana: String) -> [String: Persona] {
    //Get only combos resulting in desired arcana
    let filteredCombos = arcanaResult.filter { $0.value == arcana}
    
}*/

func getApproxCost(twoPersonas: TwoPersonas) -> Int {
    var cost = 0;
    twoPersonas.personas.forEach {
        let level = $0.value.level
        cost += (27 * level * level) + (126 * level) + 2147;
    }
    return cost
};

//Returns the name of the resultant Persona
func fuse(persona1: Persona, persona2: Persona) -> [String: Persona] {
    let level = 1 + Int(floor(Double((persona1.level + persona2.level) / 2)))
    let arcana = getResultArcana(first: persona1.arcana, second: persona2.arcana)
    let personasInArcana: [String: Persona] = getPersonasInArcana(arcana: arcana)
    var result: [String: Persona] = [:]
    //Now that we have all personas of the needed arcana, find the right one based on level
    personasInArcana.sorted { (aDic, bDic) -> Bool in
        return aDic.value.level > bDic.value.level
        }.forEach {
        if ($0.value.level >= level) {
            result = [$0.key: $0.value]
            return
        }
    }
    if (result.first != nil) {
        //print("The result is: " + result.first!.key)
    }
    return result
}

func getPersonasInArcana(arcana: String) -> [String: Persona] {
    var results: [String: Persona] = [:]
    myStructDictionary.forEach {
        if ($0.value.arcana == arcana) {
            results[$0.key] = $0.value
        }
    }
    return results
}
