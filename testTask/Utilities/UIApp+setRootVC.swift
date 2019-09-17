//
//  UIApp+setRootVC.swift
//  testTask
//
//  Created by Kristina Motte on 9/17/19.
//  Copyright © 2019 Kristina Motte. All rights reserved.
//

import UIKit

extension UIApplication {
    public static func setRootView(_ viewController: UIViewController) {
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
}
