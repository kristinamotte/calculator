//
//  PalindromeViewController.swift
//  testTask
//
//  Created by Kristina Motte on 9/17/19.
//  Copyright © 2019 Kristina Motte. All rights reserved.
//

import UIKit

class PalindromeViewController: UIViewController, Storyboarded {

    @IBOutlet weak private var numberTextField: UITextField!
    @IBOutlet weak private var resultLabel: UILabel!
    @IBOutlet weak private var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateButton.isEnabled = false
        numberTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        self.hideKeyboardWhenTappedAround()
    }
    
    @objc private func editingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " "  {
                textField.text = ""
                return
            }
        }
        
        guard
            let number = numberTextField.text, !number.isEmpty
            else {
                self.calculateButton?.isEnabled = false
                return
        }
        calculateButton?.isEnabled = true
    }
    
    private func isProductOfTwoThreeDigitsNumber(_ int: Int) -> Bool {
        var arrayOfDigits: [Int] = []
        let newNum = String(int)
        arrayOfDigits = newNum.compactMap{Int(String($0))}
        
        if arrayOfDigits.count == 6 {
            return true
        } else {
            return false
        }
    }
   
    private func isPalindrom(_ int: Int) -> Bool {
        var newInt = int
        var reverseInt = 0
        
        while newInt != 0 {
            reverseInt = reverseInt * 10 + newInt % 10
            newInt /= 10
        }
        
        if reverseInt == int && isProductOfTwoThreeDigitsNumber(int) == true {
            return true
        } else {
            return false
        }
    }
    
    @IBAction private func didTapCalculate(_ sender: UIButton) {
        let userNumber = Int(numberTextField.text ?? "0")
        if isPalindrom(userNumber ?? 0) == true {
            resultLabel.text = "It is a palindrome formed by the product of two three-digit numbers"
        } else {
            resultLabel.text = "It isn't a palindrome formed by the product of two three-digit numbers"
        }
    }
}
