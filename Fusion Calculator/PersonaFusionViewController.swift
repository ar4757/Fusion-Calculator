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
        //return combos.count
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myProtoCell") as! MyTableCell
        let overallIndex = 2*indexPath.section + indexPath.row
        if (overallIndex % 2 == 0) {
            let current = sortedTable[overallIndex]
            if (current.key.personas.first!.value.arcana == "Hierophant") {
                cell.arcanaLabel.text = "Hiero."
            }
            else if (current.key.personas.first!.value.arcana == "Hanged Man") {
                cell.arcanaLabel.text = "Hanged"
            }
            else if (current.key.personas.first!.value.arcana == "Temperance") {
                cell.arcanaLabel.text = "Temper."
            }
            else if (current.key.personas.first!.value.arcana == "Judgement") {
                cell.arcanaLabel.text = "Judge."
            }
            else {
                cell.arcanaLabel.text = current.key.personas.first!.value.arcana
            }
            cell.levelLabel.text = "\(current.key.personas.first!.value.level)"
            cell.nameLabel.text = current.key.personas.first!.key
            //cell.costLabel.text = "\(current.value)"
            //Should eventually have separate personas for first and second
            cell.persona = current.key.personas.first!.value
            cell.name = current.key.personas.first!.key
        }
        else {
            let current = sortedTable[overallIndex - 1]
            if (current.key.personas.reversed().first!.value.arcana == "Hierophant") {
                cell.arcanaLabel.text = "Hiero."
            }
            else if (current.key.personas.reversed().first!.value.arcana == "Hanged Man") {
                cell.arcanaLabel.text = "Hanged"
            }
            else if (current.key.personas.reversed().first!.value.arcana == "Temperance") {
                cell.arcanaLabel.text = "Temper."
            }
            else if (current.key.personas.reversed().first!.value.arcana == "Judgement") {
                cell.arcanaLabel.text = "Judge."
            }
            else {
                cell.arcanaLabel.text = current.key.personas.reversed().first!.value.arcana
            }
            cell.levelLabel.text = "\(current.key.personas.reversed().first!.value.level)"
            cell.nameLabel.text = current.key.personas.reversed().first!.key
            //cell.costLabel.text = "\(current.value)"
            //Should eventually have separate personas for first and second
            cell.persona = current.key.personas.reversed().first!.value
            cell.name = current.key.personas.reversed().first!.key
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath as IndexPath)
        //tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "fusionPersonaSelection", sender: cell)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = tableView.dequeueReusableCell(withIdentifier: "sectionHeader") as! SectionHeaderViewController
        let sectionIndex = 2*section
        let current = sortedTable[sectionIndex]
        sectionHeader.costLabel.text = "\(current.value)"
        return sectionHeader
    }
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section"
    }*/
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return combos.count/2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! MyTableCell
        let sendingPersona = cell.persona
        let sendingName = cell.name
        if segue.identifier == "fusionPersonaSelection" {
            if let myPageViewController = segue.destination as? MyPageViewController {
                myPageViewController.receivedPersona = sendingPersona
                myPageViewController.receivedName = sendingName
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

