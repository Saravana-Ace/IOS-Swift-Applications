//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

//if you choose option 1 then +1, option two then +2

struct storyBrain {
    let stories = [
        Story(storyTitle: "You see a fork in the road.", choiceOne: "Take a left.", choiceTwo: "Take a right."),
        Story(storyTitle: "You see a tiger.", choiceOne: "Shout for help.", choiceTwo: "Play dead."),
        Story(storyTitle: "You find a treasure chest.", choiceOne: "Open it.", choiceTwo: "Check for traps.")
    ]

    var storyNumber = 0
    
    mutating func nextStory(userChoice: String) {
        if(userChoice == stories[0].choiceOne) {
            storyNumber += 1
        } else if (userChoice == stories[0].choiceTwo) {
            storyNumber += 2
        } else {
            storyNumber = 0
        }
        
//        if(storyNumber > stories.count-1) {
//            storyNumber = 0
//        }
    }
    
    func getStoryLabelText() -> String {
        return stories[storyNumber].storyTitle
    }
    
    func getChoice1Button() -> String {
        return stories[storyNumber].choiceOne
    }
    
    func getChoice2Button() -> String {
        return stories[storyNumber].choiceTwo
    }
    
}
