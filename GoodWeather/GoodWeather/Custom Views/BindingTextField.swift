//
//  BindingTextField.swift
//  GoodWeather
//
//  Created by Vishnu Prabhu Rama Chandran on 5/11/23.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
    
    private var textChanged: (String) -> Void = { _ in }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        baseInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        baseInit()
    }
    
    private func baseInit() {
        addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    @objc func textFieldChanged(_ textField: UITextField) {
        textChanged(textField.text ?? "")
    }
    
    func bind(callback: @escaping (String) -> Void) {
        textChanged = callback
    }
}
