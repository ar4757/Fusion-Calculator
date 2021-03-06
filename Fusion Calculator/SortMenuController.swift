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
    
    @IBOutlet weak var sortView: UIStackView!
    
    var sortOpened = false
    var menuOpened = false
    
    var table: TableViewController = TableViewController.init()
    
    @IBOutlet weak var constraintSortRight: NSLayoutConstraint!
    
    @IBOutlet weak var constraintViewRight: NSLayoutConstraint!
    func openMenu() {
        
        // when menu is opened, it's left constraint should be 0
        constraintViewRight.constant = -120
        
        // view for dimming effect should also be shown
        //viewBlack.isHidden = false
        
        // animate opening of the menu - including opacity value
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
            //self.viewBlack.alpha = self.maxBlackViewAlpha
        }, completion: { (complete) in
            
            //self.containerView.isUserInteractionEnabled = false
                self.sortOpened = true
            //self.containerView.isUserInteractionEnabled = false
            self.containerView.gestureRecognizers?.forEach {
                if ($0.isKind(of: UITapGestureRecognizer.self)) {
                    $0.isEnabled = true
                }
            }
            self.table.tableView.isUserInteractionEnabled = false
        })
    }
    
    func hideMenu() {
        
        // when menu is closed, it's left constraint should be of value that allows it to be completely hidden to the left of the screen - which is negative value of it's width
        constraintViewRight.constant = 0
        
        // animate closing of the menu - including opacity value
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
            //self.viewBlack.alpha = 0
        }, completion: { (complete) in
            
            //self.containerView.isUserInteractionEnabled = true
            self.sortOpened = false
            
            // hide the view for dimming effect so it wont interrupt touches for views underneath it
            //self.viewBlack.isHidden = true
            //self.containerView.isUserInteractionEnabled = true
            self.containerView.gestureRecognizers?.forEach {
                if ($0.isKind(of: UITapGestureRecognizer.self)) {
                    $0.isEnabled = false
                }
            }
            self.table.tableView.isUserInteractionEnabled = true
        })
    }
    
    @objc func gesturePan(_ sender: UIPanGestureRecognizer) {
        
        // retrieve the current state of the gesture
        if sender.state == UIGestureRecognizerState.began {
            print("Gesture began")
            // no need to do anything
        } else if sender.state == UIGestureRecognizerState.changed {
            
            // retrieve the amount viewMenu has been dragged
            let translationX = sender.translation(in: sender.view).x
            print(translationX)
            if translationX < -120 {
                
                // viewMenu fully dragged out
                constraintViewRight.constant = -120
                sortOpened = true
                //viewBlack.alpha = maxBlackViewAlpha
            } else if translationX > 0 {
                
                // viewMenu fully dragged in
                if (constraintViewRight.constant < 0) {
                    constraintViewRight.constant = -120 + translationX
                }
                if (sortOpened == false) {
                    constraintViewRight.constant = 0
                }
                //viewBlack.alpha = 0
            } else {
                
                // it's being dragged somewhere between min and max amount
                if (sortOpened == false) {
                constraintViewRight.constant = translationX
                }
                
                //let ratio = (constraintMenuWidth.constant + translationX) / constraintMenuWidth.constant
                //let alphaValue = ratio * maxBlackViewAlpha
                //viewBlack.alpha = alphaValue
            }
        } else {
            
            // if the drag was less than half of it's width, close it. Otherwise, open it.
            if constraintViewRight.constant < -110 {
                self.openMenu()
            } else {
                self.hideMenu()
            }
        }
    }
    
    @objc func gestureTap(_ sender: UITapGestureRecognizer) {
        self.hideMenu()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table = self.childViewControllers[0] as! TableViewController
        
        self.containerView.isUserInteractionEnabled = true
        self.containerView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(SortMenuController.gesturePan(_:))))
        self.containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SortMenuController.gestureTap(_:))))
        
        self.containerView.gestureRecognizers?.forEach {
            if ($0.isKind(of: UITapGestureRecognizer.self)) {
                $0.isEnabled = false
            }
        }
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
            hideMenu()
        }
        else {
            openMenu()
        }
    }

}
