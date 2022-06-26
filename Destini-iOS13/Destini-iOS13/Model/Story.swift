//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    var storyTitle: String
    var choiceOne: String
    var choiceTwo: String
    
    init (storyTitle: String, choiceOne: String, choiceTwo: String) {
        self.storyTitle = storyTitle
        self.choiceOne = choiceOne
        self.choiceTwo = choiceTwo
    }
}
