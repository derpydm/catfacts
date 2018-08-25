//
//  struct.swift
//  catfacts
//
//  Created by Sean on 25/8/18.
//  Copyright © 2018 Sean. All rights reserved.
//

import Foundation

struct catFact {
    
    var text: String
    var id: String
    
    enum CodingKeys: String, CodingKey {
        case text
        case id = "_id"
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try valueContainer.decode(String.self, forKey: CodingKeys.text)
        self.id = try valueContainer.decode(String.self, forKey: CodingKeys.self)
    }
}
