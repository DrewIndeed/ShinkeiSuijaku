//
//  CardView.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 25/08/2022.
//

import SwiftUI

struct CardView: View {
    var card: CardModel
    
    var body: some View {
        ZStack(
            alignment: Alignment(horizontal: .center, vertical: .center)
        ) {
            // card background
            RoundedRectangle(cornerRadius: 16, style: .continuous).opacity(0)
            
            // show card back if card is flipped
            if card.isFlipped {
                CardFrontContentView(content: card.content)
                    .padding()
            } else {
                CardBackContentView()
                    .padding()
            }
        }
        // animation
        .rotation3DEffect(
            card.isFlipped ?
            Angle(degrees: 180)
            : Angle(degrees: 0), axis: (x: 0, y: 10, z: 0))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: CardModel(content: .ace_of_hearts, isFlipped: false))
        CardView(card: CardModel(content: .ace_of_hearts, isFlipped: true))
        CardView(card: CardModel(content: .black_joker, isFlipped: true))
    }
}
