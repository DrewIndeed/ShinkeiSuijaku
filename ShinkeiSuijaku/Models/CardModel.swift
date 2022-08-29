/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Le Nguyen Truong An
  ID: s3820098
  Last modified: 29/08/2022
  Acknowledgement:
    + https://stackoverflow.com/
    + https://www.hackingwithswift.com/
    + https://www.raywenderlich.com/
    + https://github.com/
    + https://www.swiftbysundell.com/
    + https://www.chosic.com/
    + https://mixkit.co/
    + https://www.donnywals.com/
    + https://thisdevbrain.com/
*/

//
//  CardModel.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 25/08/2022.
//

import Foundation

struct CardModel: Identifiable, Codable {
    // id to identify each card
    let id: UUID
    
    // card content value
    let content: CardContentModel
    
    // if the card has been flipped / clicked
    let isFlipped: Bool
    
    init(id: UUID = UUID(), content: CardContentModel, isFlipped: Bool = false) {
        self.id = id
        self.content = content
        self.isFlipped = isFlipped
    }
}
