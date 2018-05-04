//
//  SortMenuController.swift
//  Fusion Calculator
//
//  Created by Andrew Ratz on 5/2/18.
//  Copyright © 2018 Andrew Ratz. All rights reserved.
//

import Foundation

import UIKit

class SortMenuController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    var sortOpened = false
    var menuOpened = false
    
    var table: TableViewController = TableViewController.init()
    
    var allGestureRecognizers: [UIGestureRecognizer]? = [UIGestureRecognizer.init()]
    var tapContainerView: UITapGestureRecognizer = UITapGestureRecognizer.init()
    var swipeToMenu: UISwipeGestureRecognizer = UISwipeGestureRecognizer.init()
    var swipeToSort: UISwipeGestureRecognizer = UISwipeGestureRecognizer.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table = self.childViewControllers[0] as! TableViewController
        
        tapContainerView = UITapGestureRecognizer.init(target: self, action: #selector(closeMenu))
        swipeToMenu = UISwipeGestureRecognizer.init(target: self, action: #selector(toggleMenu))
        swipeToMenu.direction = UISwipeGestureRecognizerDirection.right
        self.containerView.addGestureRecognizer(swipeToMenu)
        swipeToSort = UISwipeGestureRecognizer.init(target: self, action: #selector(toggleSortMenu))
        swipeToSort.direction = UISwipeGestureRecognizerDirection.left
        self.containerView.addGestureRecognizer(swipeToSort)
    }

    
    @IBAction func levelSort(_ sender: Any) {
        table.sortByLevel()
    }
    @IBAction func nameSort(_ sender: Any) {
        table.sortByName()
    }
    @IBAction func arcanaSort(_ sender: Any) {
        table.sortByArcana()
    }
    
    @IBAction func toggleSortMenu(_ sender: Any) {
        if (sortOpened) {
            closeSortMenu()
        }
        else {
            openSortMenu()
        }
    }
    
    @IBAction func toggleMenu(_ sender: Any) {
        if (menuOpened) {
            closeMenu()
        }
        else {
            openMenu()
        }
    }
    
    
    @objc func openSortMenu() {
        UIView.animate(withDuration: 0.2, animations: {
            self.containerView.layer.anchorPoint.x = 0.85
        }, completion: nil)
        table.tableView.isUserInteractionEnabled = false
        tapContainerView = UITapGestureRecognizer.init(target: self, action: #selector(closeSortMenu))
        self.containerView.addGestureRecognizer(tapContainerView)
        self.containerView.removeGestureRecognizer(swipeToSort)
        swipeToSort.direction = UISwipeGestureRecognizerDirection.right
        self.containerView.addGestureRecognizer(swipeToSort)
        sortOpened = true
    }
    
    @objc func closeSortMenu() {
        UIView.animate(withDuration: 0.2, animations: {
            self.containerView.layer.anchorPoint.x = 0.5
        }, completion: nil)
        self.containerView.removeGestureRecognizer(tapContainerView)
        self.containerView.removeGestureRecognizer(swipeToSort)
        swipeToSort.direction = UISwipeGestureRecognizerDirection.left
        self.containerView.addGestureRecognizer(swipeToSort)
        table.tableView.isUserInteractionEnabled = true
        sortOpened = false
    }
    
    @objc func openMenu() {
        UIView.animate(withDuration: 0.2, animations: {
            self.containerView.layer.anchorPoint.x = 0.15
        }, completion: nil)
        table.tableView.isUserInteractionEnabled = false
        self.containerView.addGestureRecognizer(tapContainerView)
        self.containerView.removeGestureRecognizer(swipeToMenu)
        swipeToMenu.direction = UISwipeGestureRecognizerDirection.left
        self.containerView.addGestureRecognizer(swipeToMenu)
        menuOpened = true
    }
    
    @objc func closeMenu() {
        UIView.animate(withDuration: 0.2, animations: {
            self.containerView.layer.anchorPoint.x = 0.5
        }, completion: nil)
        self.containerView.removeGestureRecognizer(tapContainerView)
        self.containerView.removeGestureRecognizer(swipeToMenu)
        swipeToMenu.direction = UISwipeGestureRecognizerDirection.right
        self.containerView.addGestureRecognizer(swipeToMenu)
        table.tableView.isUserInteractionEnabled = true
        menuOpened = false
    }
}
