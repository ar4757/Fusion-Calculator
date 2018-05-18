//
//  MyPageViewController.swift
//  Fusion Calculator
//
//  Created by Andrew Ratz on 3/28/18.
//  Copyright © 2018 Andrew Ratz. All rights reserved.
//

import UIKit

class MyPageViewController: UIPageViewController {
    
    var currentIndex = 0
    var receivedPersona: Persona?
    var receivedName: String?
    
    @IBOutlet weak var fusionSortButton: UIBarButtonItem!
    
    @IBAction func toggleSortMenu(_ sender: Any) {
        if ((self.orderedViewControllers[1] as! SortFusionController).sortOpened) {
            (self.orderedViewControllers[1] as! SortFusionController).hideMenu()
        }
        else {
            (self.orderedViewControllers[1] as! SortFusionController).openMenu()
        }
    }
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.createPersonaStatsViewController(pageNumber: 0, persona: receivedPersona!, name: receivedName!), self.createSortFusionController( pageNumber: 1, persona: receivedPersona!, name: receivedName!)]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        self.view.backgroundColor = UIColor.black
        let appearance = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
        appearance.pageIndicatorTintColor = UIColor.gray
        appearance.currentPageIndicatorTintColor = UIColor.red

        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
            self.title = "Stats"
            self.fusionSortButton.isEnabled = false
            self.fusionSortButton.tintColor = UIColor.clear
        }
        
        DispatchQueue.global().async {
            let combos = getRecipes(name: self.receivedName!, persona: self.receivedPersona!)
            while (((self.orderedViewControllers[1] as! SortFusionController).childViewControllers.isEmpty)) {
                if (((self.orderedViewControllers[1] as! SortFusionController).childViewControllers.isEmpty) == false) {
                    break
                }
            }
            ((self.orderedViewControllers[1] as! SortFusionController).childViewControllers[0] as! PersonaFusionViewController).combos = combos
            ((self.orderedViewControllers[1] as! SortFusionController).childViewControllers[0] as! PersonaFusionViewController).sortedTable = Array(combos)
            while (((self.orderedViewControllers[1] as! SortFusionController).childViewControllers[0] as! PersonaFusionViewController).isViewLoaded == false) {
                if (((self.orderedViewControllers[1] as! SortFusionController).childViewControllers[0] as! PersonaFusionViewController).isViewLoaded == true) {
                    break
                }
            }
            DispatchQueue.main.async {
                ((self.orderedViewControllers[1] as! SortFusionController).childViewControllers[0] as! PersonaFusionViewController).tableView.reloadData()
                ((self.orderedViewControllers[1] as! SortFusionController).childViewControllers[0] as! PersonaFusionViewController).activityIndicatorView.stopAnimating()
                ((self.orderedViewControllers[1] as! SortFusionController).childViewControllers[0] as! PersonaFusionViewController).loadingView.isHidden = true
            }
        }

    }
    
    override func viewDidLayoutSubviews() {
        for view in self.view.subviews {
            if view.isKind(of:UIScrollView.self) {
                view.frame = UIScreen.main.bounds
            } else if view.isKind(of:UIPageControl.self) {
                view.backgroundColor = UIColor.clear
            }
        }
        super.viewDidLayoutSubviews()
    }
    
    func createPersonaStatsViewController(pageNumber: Int, persona: Persona, name: String) -> UIViewController {
        let contentViewController =
            storyboard?.instantiateViewController(withIdentifier: "PersonaStatsViewController")
                as! PersonaStatsViewController
        contentViewController.pageNumber = pageNumber
        contentViewController.persona = persona
        contentViewController.name = name
        return contentViewController
    }
    
    func createSortFusionController(pageNumber: Int, persona: Persona, name: String) -> UIViewController {
        let contentViewController =
            storyboard?.instantiateViewController(withIdentifier: "SortFusionController")
                as! SortFusionController
        contentViewController.pageNumber = pageNumber
        contentViewController.persona = persona
        contentViewController.name = name
        return contentViewController
    }
}
    
extension MyPageViewController: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        return orderedViewControllers[nextIndex]
    }
    
}

extension MyPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if (currentIndex == 0) {
            currentIndex = 1
        }
        else if (currentIndex == 1) {
            currentIndex = 0
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if (currentIndex == 0) {
                self.title = "Stats"
                self.fusionSortButton.isEnabled = false
                self.fusionSortButton.tintColor = UIColor.clear
            }
            else if (currentIndex == 1) {
                self.title = "Fusion"
                self.fusionSortButton.isEnabled = true
                self.fusionSortButton.tintColor = nil

            }
        }
    }
    
}

extension MyPageViewController {
    func goToNextPage(animated: Bool = true) {
        guard let currentViewController = self.viewControllers?.first else {
            return
        }
        guard let nextViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) else {
            return
        }
        setViewControllers([nextViewController], direction: .forward, animated: animated, completion: nil)
    }
    
    func goToPreviousPage(animated: Bool = true) {
        guard let currentViewController = self.viewControllers?.first else {
            return
        }
        guard let previousViewController = dataSource?.pageViewController(self, viewControllerBefore: currentViewController) else {
            return
        }
        setViewControllers([previousViewController], direction: .reverse, animated: animated, completion: nil)
        
        self.title = "Stats"
        self.fusionSortButton.isEnabled = false
        self.fusionSortButton.tintColor = UIColor.clear
        
        currentIndex = 0
    }
}





