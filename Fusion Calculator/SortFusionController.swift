//
//  SortFusionController.swift
//  Fusion Calculator
//
//  Created by Andrew Ratz on 5/2/18.
//  Copyright © 2018 Andrew Ratz. All rights reserved.
//

import Foundation

import UIKit

class SortFusionController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    var pageNumber: Int!
    var persona: Persona?
    var name: String?
    
    var opened = false
    
    var allGestureRecognizers: [UIGestureRecognizer]? = [UIGestureRecognizer.init()]
    var tapContainerView: UITapGestureRecognizer = UITapGestureRecognizer.init()
    
    @IBAction func levelSort(_ sender: Any) {
        let table = self.childViewControllers[0] as! PersonaFusionViewController
        table.sortByLevel()
    }
    @IBAction func nameSort(_ sender: Any) {
        let table = self.childViewControllers[0] as! PersonaFusionViewController
        table.sortByName()
    }
    @IBAction func arcanaSort(_ sender: Any) {
        let table = self.childViewControllers[0] as! PersonaFusionViewController
        table.sortByArcana()
    }
    @IBAction func costSort(_ sender: Any) {
        let table = self.childViewControllers[0] as! PersonaFusionViewController
        table.sortByCost()
    }
    
    @objc func openMenu() {
        UIView.animate(withDuration: 0.2, animations: {
            self.containerView.layer.anchorPoint.x = 0.85
        }, completion: nil)
        let table = self.childViewControllers[0] as! PersonaFusionViewController
        table.tableView.isUserInteractionEnabled = false
        tapContainerView = UITapGestureRecognizer.init(target: self, action: #selector(closeMenu))
        self.containerView.addGestureRecognizer(tapContainerView)
        opened = true
    }
    
    @objc func closeMenu() {
        UIView.animate(withDuration: 0.2, animations: {
            self.containerView.layer.anchorPoint.x = 0.5
        }, completion: nil)
        self.containerView.removeGestureRecognizer(tapContainerView)
        let table = self.childViewControllers[0] as! PersonaFusionViewController
        table.tableView.isUserInteractionEnabled = true
        opened = false
    }
}

