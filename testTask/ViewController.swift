//
//  ViewController.swift
//  testTask
//
//  Created by Kristina Motte on 9/16/19.
//  Copyright © 2019 Kristina Motte. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

    @IBOutlet weak private var userNameTextField: UITextField! {
        didSet {
            userNameTextField.tintColor = UIColor.lightGray
            if let usernameImage = UIImage(named: "username") {
                userNameTextField.setIcon(usernameImage)
            }
        }
    }
    
    @IBOutlet weak private var passwordTextField: UITextField! {
        didSet {
            passwordTextField.tintColor = UIColor.lightGray
            if let usernameImage = UIImage(named: "safe-lock") {
                passwordTextField.setIcon(usernameImage)
            }
        }
    }
    @IBOutlet weak private var loginWithFacebookView: UIView!
    @IBOutlet weak private var loginWithGmailView: UIView!
    @IBOutlet weak private var loginWithTwitterView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        let facebookGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(loginwithFb(gesture:)))
        let twitterGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(loginwithTwitter(gesture:)))
        let gmailGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(loginwithGmail(gesture:)))
        loginWithGmailView.addGestureRecognizer(gmailGesture)
        loginWithTwitterView.addGestureRecognizer(twitterGesture)
        loginWithFacebookView.addGestureRecognizer(facebookGesture)
    }
    
    @objc private func loginwithFb(gesture: UITapGestureRecognizer) {
        print("Login with Fb")
        UIApplication.setRootView(TabBarRouter())
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func loginwithTwitter(gesture: UITapGestureRecognizer) {
        print("Login with Twitter")
        UIApplication.setRootView(TabBarRouter())
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func loginwithGmail(gesture: UITapGestureRecognizer) {
        print("Login with Gmail")
        UIApplication.setRootView(TabBarRouter())
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction private func didTapLoginButton(_ sender: UIButton) {
        UIApplication.setRootView(TabBarRouter())
        self.dismiss(animated: true, completion: nil)
    }
}

