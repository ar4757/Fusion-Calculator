//
//  ViewController.swift
//  Fusion Calculator
//
//  Created by Andrew Ratz on 3/23/18.
//  Copyright © 2018 Andrew Ratz. All rights reserved.
//

import UIKit
import ChameleonFramework

import Foundation

struct Persona: Decodable {
    let arcana: String
    let level: Int
    let stats: [Int]
    let elems: [String]
    let skills: [String: Int]
    let personality: String?
    let special: Bool?
    let max: Bool?
    let dlc: Bool?
    let rare: Bool?
    let note: String?
}

var myStructDictionary: [String: Persona] = [:]

class TableViewController: UITableViewController {
    
    var sortedTable: [(key: String, value: Persona)] = []
    
    func sortByLevel() {
        sortedTable = Array(myStructDictionary).sorted { (aDic, bDic) -> Bool in
            return aDic.value.level == bDic.value.level ? (aDic.key < bDic.key) : (aDic.value.level < bDic.value.level)}
        tableView.reloadData()
    }
    
    func sortByName() {
        sortedTable = Array(myStructDictionary).sorted { (aDic, bDic) -> Bool in
            return aDic.key < bDic.key}
        tableView.reloadData()
    }
    
    func sortByArcana() {
        sortedTable = Array(myStructDictionary).sorted { (aDic, bDic) -> Bool in
            return aDic.value.arcana == bDic.value.arcana ? (aDic.value.level < bDic.value.level) : (aDic.value.arcana < bDic.value.arcana)}
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myStructDictionary.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "myProtoCell") as! MyTableCell
        let current = sortedTable[indexPath.row]
        if (current.value.arcana == "Hierophant") {
            cell.arcanaLabel.text = "Hiero."
        }
        else if (current.value.arcana == "Hanged Man") {
            cell.arcanaLabel.text = "Hanged"
        }
        else if (current.value.arcana == "Temperance") {
            cell.arcanaLabel.text = "Temper."
        }
        else if (current.value.arcana == "Judgement") {
            cell.arcanaLabel.text = "Judge."
        }
        else {
            cell.arcanaLabel.text = current.value.arcana
        }
        cell.nameLabel.text = current.key
        cell.levelLabel.text = "\(current.value.level)"
        cell.persona = current.value
        cell.name = current.key
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath as IndexPath)
        self.performSegue(withIdentifier: "personaSelection", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! MyTableCell
        let sendingPersona = cell.persona
        let sendingName = cell.name
        if segue.identifier == "personaSelection" {
            if let myPageViewController = segue.destination as? MyPageViewController {
                myPageViewController.receivedPersona = sendingPersona
                myPageViewController.receivedName = sendingName
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let path = Bundle.main.path(forResource: "personas", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            
            myStructDictionary = try JSONDecoder().decode([String: Persona].self, from: data)
            
            myStructDictionary.forEach {
                //$0.key is the Persona's name
                //$0.value is the Persona's data
                print("\($0.key): \($0.value)")
                
            }
    
        }
        catch {
            print("Error loading json, rip")
            print(error)
        }
        
        sortedTable = Array(myStructDictionary)
        
    }
    
}





