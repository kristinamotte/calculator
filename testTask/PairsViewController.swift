//
//  PairsViewController.swift
//  testTask
//
//  Created by Kristina Motte on 9/17/19.
//  Copyright © 2019 Kristina Motte. All rights reserved.
//

import UIKit

class PairsViewController: UIViewController, Storyboarded {
    @IBOutlet weak private var firstNumberTextField: UITextField!
    @IBOutlet weak private var secondNumberTextField: UITextField!
    @IBOutlet weak private var addPairButton: UIButton!
    @IBOutlet weak private var pairsLabel: UILabel!
    @IBOutlet weak private var calculateButton: UIButton!
    @IBOutlet weak private var resultLabel: UILabel!
    private var pairs = [(Int, Int)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textFields: [UITextField] = [firstNumberTextField, secondNumberTextField]
        textFields.forEach({ $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged)})
        addPairButton.isEnabled = false
        calculateButton.isEnabled = false
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
            let firstNumber = firstNumberTextField.text, !firstNumber.isEmpty,
            let secondNumber = secondNumberTextField.text, !secondNumber.isEmpty
            else {
                self.addPairButton?.isEnabled = false
                return
        }
        addPairButton?.isEnabled = true
    }
    
    private func checkPairs() {
        if pairs.count >= 4 {
            calculateButton.isEnabled = true
        } else {
            calculateButton.isEnabled = false
        }
    }
    
    @IBAction private func didTapAddPairButton(_ sender: UIButton) {
        let firstNumber = Int(firstNumberTextField.text ?? "0")
        let secondNumber = Int(secondNumberTextField.text ?? "0")
        pairs.append((firstNumber ?? 0, secondNumber ?? 0))
        pairsLabel.text = "\(pairs)"
        
        checkPairs()
    }
    
    private func findPairs(_ pairs: [(Int, Int)]) -> [(Int, Int)] {
        var newPairs = [(Int, Int)]()
        for i in 0..<pairs.count - 1 {
            if (pairs[i].0 < pairs[i].1) && (pairs[i + 1].0 > pairs[i + 1].1) {
                newPairs.append(pairs[i])
                newPairs.append(pairs[i + 1])
            }
        }
        return newPairs
    }
    
    @IBAction private func didTapCalculateButton(_ sender: UIButton) {
        let definedPairs = findPairs(pairs)
        if definedPairs.count >= 1 {
        resultLabel.text = "\(definedPairs)"
        } else {
            resultLabel.text = "No pairs"
        }
    }
    
    @IBAction private func didTapClearAllButton(_ sender: UIButton) {
        pairsLabel.text = "Your pairs will be here"
        firstNumberTextField.text = ""
        secondNumberTextField.text = ""
        pairs = [(Int, Int)]()
        resultLabel.text = "Result"
        checkPairs()
        addPairButton.isEnabled = false
    }
}
