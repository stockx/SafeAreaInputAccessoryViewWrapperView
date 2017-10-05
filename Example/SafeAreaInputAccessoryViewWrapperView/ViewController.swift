//
//  ViewController.swift
//  SafeAreaInputAccessoryViewWrapperView
//
//  Created by Jeff Burt on 10/05/2017.
//  Copyright (c) 2017 StockX. All rights reserved.
//

import UIKit
import SafeAreaInputAccessoryViewWrapperView

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet private var continueButton: UIButton!
    
    private lazy var wrappedContinueButton: SafeAreaInputAccessoryViewWrapperView = {
        return SafeAreaInputAccessoryViewWrapperView(for: continueButton)
    }()
    
    // MARK: Input Accessory View
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var inputAccessoryView: UIView? {
        return wrappedContinueButton
    }
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SafeAreaInputAccessoryViewWrapperView also allows us to dynamically
        // size the inputAccessoryView using autolayout, removing the need
        // for us to set the frame manually here.
        continueButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        // Always show the continue button, even when the keyboard is closed
        becomeFirstResponder()
    }
}

private extension ViewController {
    @IBAction func didTapContinueButton(_ sender: Any) {
        textField.resignFirstResponder()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
