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
//  CardGridView.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 25/08/2022.
//

import SwiftUI

struct CardGridView: View {
    // (Redux) store to use Redux mechanism
    @EnvironmentObject var store: ShinkeiSuijakuStore
    
    // array of cards
    var cards: [CardModel]
    
    // four columns card grid
    private let columns = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
    ]
    
    // use LazyGrid since there will be more card if the game is more difficult
    var body: some View {
        LazyVGrid(columns: columns,
                  alignment: .center,
                  spacing: 0,
                  pinnedViews: []
        ) {
            ForEach(cards) { card in
                CardView(card: card)
                    .frame(width: 200, height: 150)
                    .onTapGesture {
                        withAnimation {
                            store.dispatchToQueueActions(.flipCard(card.id))
                        }
                        playSound("flip")
                    }
            }
        }
    }
    
    struct CardGridView_Previews: PreviewProvider {
        static var previews: some View {
            let cards = [
                CardModel(content: .two_of_clubs),
                CardModel(content: .two_of_clubs),
                CardModel(content: .three_of_hearts),
                CardModel(content: .three_of_hearts),
                
                CardModel(content: .four_of_spades),
                CardModel(content: .four_of_spades),
                CardModel(content: .five_of_diamonds),
                CardModel(content: .five_of_diamonds),
                
                CardModel(content: .six_of_clubs),
                CardModel(content: .six_of_clubs),
                CardModel(content: .ace_of_hearts),
                CardModel(content: .ace_of_hearts),
            ].shuffled()
            
            CardGridView(cards: cards)
        }
    }
}
