//
//  LoginViewModel.swift
//  GoodWeather
//
//  Created by Vishnu Prabhu Rama Chandran on 5/11/23.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> Void
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    var listener: Listener? = nil
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(callback: @escaping (T) -> Void) {
        self.listener = callback
    }
}

class LoginViewModel {
    var username: Dynamic<String> = Dynamic("")
    var password: Dynamic<String> = Dynamic("")
}

extension LoginViewModel {
    @objc func fetchLoginInfo() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.username.value = "MaryDoe"
            self?.password.value = "BigPassword"
        }
    }
}
