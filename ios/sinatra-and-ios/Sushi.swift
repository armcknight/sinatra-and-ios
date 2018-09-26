//
//  Sushi.swift
//  sinatra-and-ios
//
//  Created by Andrew McKnight on 9/25/18.
//  Copyright © 2018 Two Ring Software. All rights reserved.
//

import Foundation

struct Sushi: Codable {
    var types: Array<String>
    
    enum CodingKeys: String, CodingKey {
        case types = "sushi"
    }
}
