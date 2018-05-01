//
//  ViewController.swift
//  Fusion Calculator
//
//  Created by Andrew Ratz on 3/23/18.
//  Copyright © 2018 Andrew Ratz. All rights reserved.
//

import UIKit

//
//  ViewController.swift
//  parseLocalJSON
//
//  Created by Yash Patel on 11/11/17.
//  Copyright © 2017 Yash Patel. All rights reserved.
//

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
    
    
    @IBOutlet weak var sortButton: UIBarButtonItem!
    
    var sorted = false
    
    @objc func toggleSort() {
        if (sorted == false) {
            sorted = true
        }
        else {
            sorted = false
        }
        tableView.reloadData()
        return
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myStructDictionary.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "myProtoCell") as! MyTableCell
        if (sorted == false) {
            cell.lblFirstRow.text = Array(myStructDictionary)[indexPath.row].value.arcana + " " + Array(myStructDictionary)[indexPath.row].key
            cell.persona = Array(myStructDictionary)[indexPath.row].value
            cell.name = Array(myStructDictionary)[indexPath.row].key
        }
        else {
            cell.lblFirstRow.text = Array(myStructDictionary).sorted { (aDic, bDic) -> Bool in
                return aDic.key < bDic.key
                }[indexPath.row].value.arcana + " " + Array(myStructDictionary).sorted { (aDic, bDic) -> Bool in
                    return aDic.key < bDic.key
                    }[indexPath.row].key
            cell.persona = Array(myStructDictionary).sorted { (aDic, bDic) -> Bool in
                return aDic.key < bDic.key
                }[indexPath.row].value
            cell.name = Array(myStructDictionary).sorted { (aDic, bDic) -> Bool in
                return aDic.key < bDic.key
                }[indexPath.row].key
        }
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
        
        sortButton.action = #selector(toggleSort)
        sortButton.target = self;
        
    }
    
}





