//
//  TabBarRouter.swift
//  testTask
//
//  Created by Kristina Motte on 9/17/19.
//  Copyright © 2019 Kristina Motte. All rights reserved.
//

import UIKit

class TabBarRouter: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
        UITabBar.appearance().barTintColor = UIColor.frenchBlue
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        UITabBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        UINavigationBar.appearance().barTintColor = UIColor.frenchBlue
        UINavigationBar.appearance().tintColor = UIColor.white
        
        
        let tabOne = UINavigationController(rootViewController: PalindromeViewController.instantiate())
        let tabOneItem = UITabBarItem(title: "Palindrome", image: UIImage(named: "palindrome"), selectedImage: UIImage(named: "palindrome_selected"))
        tabOne.tabBarItem = tabOneItem
        
        let tabTwo = UINavigationController(rootViewController:FactorialViewController.instantiate())
        
        let tabTwoItem = UITabBarItem(title: "Factorial", image: UIImage(named: "factorial"), selectedImage: UIImage(named: "factorial_selected"))
        tabTwo.tabBarItem = tabTwoItem
        
        
        let tabThree = UINavigationController(rootViewController: PairsViewController.instantiate())
        let tabThreeItem = UITabBarItem(title: "Pairs", image: UIImage(named: "pair"), selectedImage: UIImage(named: "pair_selected"))
        tabThree.tabBarItem = tabThreeItem
        
        let controllers = [tabOne, tabTwo, tabThree]
        self.viewControllers = controllers
    }
}

