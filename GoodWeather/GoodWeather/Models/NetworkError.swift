//
//  NetworkError.swift
//  GoodWeather
//
//  Created by Vishnu Prabhu Rama Chandran on 4/11/23.
//

import Foundation

enum NetworkError: Error {
    case urlError, decodingError, domainError
}
