//
//  HowToPlayScreenView.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 24/08/2022.
//

import SwiftUI

struct HowToPlayScreenView: View {
    // (Redux) store to use Redux mechanism
    @EnvironmentObject var store: ShinkeiSuijakuStore
    
    var body: some View {
        ZStack {
            // blue gradient background
            LinearGradient(
                colors: [.green, .yellow],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // circles in background
            GeometryReader { proxy in
                let size = proxy.size
                
                // make the background slightly darker
                Color.gray
                    .opacity(0.7)
                    .blur(radius: 200)
                    .ignoresSafeArea()
                
                // first blurred cicle in background
                Circle()
                    .fill(Color.pink)
                    .padding(50)
                    .blur(radius: 120)
                    .offset(x: -size.width / 1.8, y: -size.height / 5)
                
                // second blurred cicle in background
                Circle()
                    .fill(Color.blue)
                    .padding(50)
                    .blur(radius: 120)
                    .offset(x: size.width / 1.8, y: -size.height / 2)
                
                // third blurred cicle in background
                Circle()
                    .fill(Color.white)
                    .padding(50)
                    .blur(radius: 120)
                    .offset(x: size.width / 1.8, y: size.height / 2)
                
                // forth blurred cicle in background
                Circle()
                    .fill(Color.purple)
                    .padding(60)
                    .blur(radius: 120)
                    .offset(x: -size.width / 1.8, y: size.height / 2)
            }
            
            // How To Play screen content
            GeometryReader { proxy in
                let size = proxy.size
                
                ScrollView {
                    VStack(alignment: .center, spacing: 0) {
                        Text("How To Play")
                            .foregroundColor(.white)
                            .font(.system(size: 50))
                            .bold()
                            .multilineTextAlignment(.leading)
                        
                        Text("Know the rules before playing any game!")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .multilineTextAlignment(.leading)
                            .padding(.top, 10)
                            .padding(.bottom, 20)
                        
                        Divider()
                            .frame(width: 300, height: 2)
                            .overlay(.yellow)
                            .padding(.bottom, 15)
                        
                        // rules text content
                        Text("Players take turns, turning any two cards picture-side-up. Each card flip counts as one move.\n\nA Match: Players make a match if the two cards turned picture-side-up are identical. Those two cards then remains faced-up.\n\nA Miss: Player miss if the two cards turned over are not identical. When player miss, the two cards are turned picture-side-down again, in the same place.\n\nThe game continues until all cards have been matched. Until then, players can choose to give up anytime and receive no points counted.\n\nPoints calculation: number of moves in one game times the number of card for each level. Easy, Medium and Hard have 12, 15, 18 cards, respectively. Giving up receives 0 points.")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .multilineTextAlignment(.center)
                            .padding(.top, 10)
                            .padding(.bottom, 20)
                            .frame(maxWidth: .infinity)
                        
                        Divider()
                            .frame(width: 200, height: 2)
                            .overlay(.yellow)
                            .padding(.top, 10)
                            .padding(.bottom, 20)
                        
                        // Back To Menu button
                        Button(action: {
                            // button tapped action
                            // dispatch action for Back to Menu -> to Menu
                            withAnimation(.easeOut(duration: 0.4).delay(0.2)) {
                                store.dispatchToQueueActions(.startGame)
                            }
                        }, label:  {
                            Text("Back To Menu")
                                .bold()
                                .frame(width: 300)
                        })
                        .buttonStyle(RoundedRectangleSecondaryButtonStyle())
                    }
                    .padding(.vertical, size.height * 0.08)
                    .padding(.horizontal, size.width * 0.05)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

struct HowToPlayScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayScreenView()
            .previewInterfaceOrientation(.portrait)
    }
}
