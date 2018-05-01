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
    var persona: Persona?
    var name: String?
    var combos: [TwoPersonas: Int] = [:]
    
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var ascending = true
    
    
    @objc func fusionToggleSort() {
        if (ascending == false) {
            ascending = true
        }
        else {
            ascending = false
        }
        tableView.reloadData()
        return
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return combos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "comboCell") as! ComboCell
        if (ascending == false) {
            cell.firstLabel.text = /*Array(combos).sorted { (aDic, bDic) -> Bool in
                 return aDic.value > bDic.value
                 }[indexPath.row].key.personas.first!.value.arcana + " " + */Array(combos).sorted { (aDic, bDic) -> Bool in
                    return aDic.value > bDic.value
                    }[indexPath.row].key.personas.first!.key
            cell.secondLabel.text = /*Array(combos).sorted { (aDic, bDic) -> Bool in
                 return aDic.value > bDic.value
                 }[indexPath.row].key.personas.reversed().first!.value.arcana + " " + */Array(combos).sorted { (aDic, bDic) -> Bool in
                    return aDic.value > bDic.value
                    }[indexPath.row].key.personas.reversed().first!.key
            let cost: Int = Array(combos).sorted { (aDic, bDic) -> Bool in
                return aDic.value > bDic.value
                }[indexPath.row].value
            cell.costLabel.text = "\(cost)"
            //Should eventually have separate personas for first and second
            cell.persona = Array(combos).sorted { (aDic, bDic) -> Bool in
                return aDic.value < bDic.value
                }[indexPath.row].key.personas.first!.value
            cell.name = Array(combos).sorted { (aDic, bDic) -> Bool in
                return aDic.value < bDic.value
                }[indexPath.row].key.personas.first!.key
        }
        else {
            cell.firstLabel.text = /*Array(combos).sorted { (aDic, bDic) -> Bool in
                return aDic.value < bDic.value
                }[indexPath.row].key.personas.first!.value.arcana + " " + */Array(combos).sorted { (aDic, bDic) -> Bool in
                    return aDic.value < bDic.value
                    }[indexPath.row].key.personas.first!.key
            cell.secondLabel.text = /*Array(combos).sorted { (aDic, bDic) -> Bool in
                return aDic.value < bDic.value
                }[indexPath.row].key.personas.reversed().first!.value.arcana + " " + */Array(combos).sorted { (aDic, bDic) -> Bool in
                    return aDic.value < bDic.value
                    }[indexPath.row].key.personas.reversed().first!.key
            let cost: Int = Array(combos).sorted { (aDic, bDic) -> Bool in
                return aDic.value < bDic.value
                }[indexPath.row].value
            cell.costLabel.text = "\(cost)"
            //Should eventually have separate personas for first and second
            cell.persona = Array(combos).sorted { (aDic, bDic) -> Bool in
                return aDic.value < bDic.value
                }[indexPath.row].key.personas.first!.value
            cell.name = Array(combos).sorted { (aDic, bDic) -> Bool in
                return aDic.value < bDic.value
                }[indexPath.row].key.personas.first!.key
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath as IndexPath)
        //tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "fusionPersonaSelection", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! ComboCell
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

