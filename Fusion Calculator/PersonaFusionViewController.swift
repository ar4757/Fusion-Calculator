//
//  PersonaFusionViewController.swift
//  Fusion Calculator
//
//  Created by Andrew Ratz on 3/29/18.
//  Copyright © 2018 Andrew Ratz. All rights reserved.
//

import UIKit

class PersonaFusionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var pageNumber: Int!
    var firstPersona: Persona?
    var firstName: String?
    var secondPersona: Persona?
    var secondName: String?
    var combos: [TwoPersonas: Int] = [:]
    
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var sortedTable: [(key: TwoPersonas, value: Int)] = []

    func sortByLevel() {
        sortedTable = Array(combos).sorted { (aDic, bDic) -> Bool in
            return aDic.key.personas.first!.value.level == bDic.key.personas.first!.value.level ? (aDic.key.personas.first!.key < bDic.key.personas.first!.key) : (aDic.key.personas.first!.value.level < bDic.key.personas.first!.value.level)}
        tableView.reloadData()
    }
    
    func sortByName() {
        sortedTable = Array(combos).sorted { (aDic, bDic) -> Bool in
            return aDic.key.personas.first!.key < bDic.key.personas.first!.key}
        tableView.reloadData()
    }
    
    func sortByArcana() {
        sortedTable = Array(combos).sorted { (aDic, bDic) -> Bool in
            return aDic.key.personas.first!.value.arcana == bDic.key.personas.first!.value.arcana ? (aDic.key.personas.reversed().first!.value.arcana == bDic.key.personas.reversed().first!.value.arcana) : (aDic.key.personas.first!.value.arcana < bDic.key.personas.first!.value.arcana)}
        tableView.reloadData()
    }
    
    func sortByCost() {
        sortedTable = Array(combos).sorted { (aDic, bDic) -> Bool in
            return aDic.value == bDic.value ? (aDic.key.personas.first!.key < bDic.key.personas.first!.key) : (aDic.value < bDic.value)}
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return combos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "comboCell") as! ComboCell
        let current = sortedTable[indexPath.row]
            cell.firstArcanaLabel.text = current.key.personas.first!.value.arcana
            cell.secondArcanaLabel.text = current.key.personas.reversed().first!.value.arcana
            cell.firstLevelLabel.text = "\(current.key.personas.first!.value.level)"
            cell.secondLevelLabel.text = "\(current.key.personas.reversed().first!.value.level)"
            cell.firstNameLabel.text = current.key.personas.first!.key
            cell.secondNameLabel.text = current.key.personas.reversed().first!.key
            cell.costLabel.text = "\(current.value)"
            //Should eventually have separate personas for first and second
            cell.firstPersona = current.key.personas.first!.value
            cell.firstName = current.key.personas.first!.key
            cell.secondPersona = current.key.personas.reversed().first!.value
            cell.secondName = current.key.personas.reversed().first!.key
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath as IndexPath)
        //tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "fusionPersonaSelection", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! ComboCell
        let sendingFirstPersona = cell.firstPersona
        let sendingFirstName = cell.firstName
        if segue.identifier == "fusionPersonaSelection" {
            if let myPageViewController = segue.destination as? MyPageViewController {
                myPageViewController.receivedPersona = sendingFirstPersona
                myPageViewController.receivedName = sendingFirstName
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("Since \(name!) is of arcana \(persona!.arcana), the following combos will work:\n")
        //let combos = (arcanaResult as NSDictionary).allKeys(for: persona!.arcana)
        //arcanaCombo(first: persona!.arcana, second: "Devil")
        //print(combos)
        
        loadingView.isHidden = false
        activityIndicatorView.startAnimating()
        
        sortedTable = Array(combos)
                
    }
    
    /*func populateCombos() {
        
        loadingView.isHidden = false
        activityIndicatorView.startAnimating()
        
        DispatchQueue.global().async {
            self.combos = getRecipes(name: self.name!, persona: self.persona!)
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicatorView.stopAnimating()
                self.loadingView.isHidden = true
            }
        }
        
    }*/
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
        
}

