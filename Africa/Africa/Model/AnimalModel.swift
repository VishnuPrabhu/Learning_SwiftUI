//
//  AnimalModel.swift
//  Africa
//
//  Created by Vishnu Prabhu Rama Chandran on 27/10/23.
//

import Foundation

struct Animal : Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
