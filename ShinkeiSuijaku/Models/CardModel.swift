//
//  CardModel.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 25/08/2022.
//

import Foundation

struct CardModel: Identifiable {
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
