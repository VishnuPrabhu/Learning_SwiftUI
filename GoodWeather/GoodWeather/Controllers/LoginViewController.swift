//
//  LoginViewController.swift
//  GoodWeather
//
//  Created by Vishnu Prabhu Rama Chandran on 5/11/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    private var loginVM = LoginViewModel()
    
    private lazy var usernameTextField: UITextField = {
        let userNameTextField = BindingTextField()
        userNameTextField.placeholder = "Enter Username"
        userNameTextField.backgroundColor = .lightGray
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.bind { [weak self] text in
            //// self?.viewModel.userName = text  or
            //self?.loginVM[keyPath: \.username] = text or
            ///self?.loginVM[keyPath: \.username.value] = text // or
            self?[keyPath: \.loginVM.username.value] = text
        }
        return userNameTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = BindingTextField()
        passwordTextField.placeholder = "Enter Password"
        passwordTextField.backgroundColor = .lightGray
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.bind { [weak self] text in
            //// self?.viewModel.password = text or
            //self?[keyPath: \.loginVM.password] = text  or
            ///self?.loginVM[keyPath: \.password.value] = text // or
            self?[keyPath: \.loginVM.password.value] = text
        }
        return passwordTextField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
    }
    
    func addSubViews() {
        loginVM.username.bind {
            self.usernameTextField.text = $0
        }
        loginVM.password.bind {
            self.passwordTextField.text = $0
        }
        
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .lightGray
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        let fetchLoginInfoButton = UIButton()
        fetchLoginInfoButton.setTitle("Fetch Login Info", for: .normal)
        fetchLoginInfoButton.backgroundColor = .blue
        fetchLoginInfoButton.addTarget(loginVM, action: #selector(loginVM.fetchLoginInfo), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [usernameTextField, passwordTextField, loginButton, fetchLoginInfoButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        self.view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    @objc func login() {
        print(loginVM.username.value)
        print(loginVM.password.value)
    }

}
