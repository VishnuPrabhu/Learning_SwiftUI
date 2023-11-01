//
//  Bundle+CodableExtension.swift
//  Africa
//
//  Created by Vishnu Prabhu Rama Chandran on 27/10/23.
//

import Foundation

extension Bundle {
func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("failed to decode \(file) from bundle")
        }
        return loaded
    }
}
