//
//  FactorialViewController.swift
//  testTask
//
//  Created by Kristina Motte on 9/17/19.
//  Copyright © 2019 Kristina Motte. All rights reserved.
//

import UIKit
import BigInt

class FactorialViewController: UIViewController, Storyboarded {
    @IBOutlet weak private var numberTextField: UITextField!
    @IBOutlet weak private var calculateButton: UIButton!
    @IBOutlet weak private var resultLabel: UILabel!
    
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
    
    private func defineFactorial(_ factorial: Int) -> BigUInt {
        var factorial: BigUInt = BigUInt(factorial)
        var result: BigUInt = 1
        while factorial != 0 {
            result *= factorial
            factorial -= 1
        }
        return result
    }
    
    private func findSumOfDigits(_ factorial: Int) -> BigUInt {
        var newFactorial = defineFactorial(factorial)
        var sum: BigUInt = 0
        
        while newFactorial > 0 {
            sum += newFactorial % 10
            newFactorial /= 10
        }
        return sum
    }

    @IBAction private func didTapCalculateButton(_ sender: UIButton) {
        let num = Int(numberTextField.text ?? "0")
        let sum = findSumOfDigits(num ?? 0)
        resultLabel.text = String(sum)
    }
}
