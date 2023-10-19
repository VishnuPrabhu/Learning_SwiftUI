//
//  Page.swift
//  Pinch
//
//  Created by Vishnu Prabhu Rama Chandran on 19/10/23.
//

import Foundation

struct Page : Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        "thumb-" + imageName
    }
}
