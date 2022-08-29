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
//  GameScreenView.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 25/08/2022.
//

import SwiftUI

struct GameScreenView: View {
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
                    VStack(
                        alignment: .center,
                        spacing: (1 - (CGFloat(store.state.cards.count) / 16)) * 150
                    ) {
                        // move count
                        Text("Moves: \(store.state.moves)")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .bold()
                            .padding(.bottom, 15)
                        
                        // cards grid
                        CardGridView(cards: store.state.cards)
                        
                        // give up button
                        Button(action: {
                            // button tapped action
                            // dispatch action for Give Up -> to Give Up
                            withAnimation(.easeOut(duration: 0.4).delay(0.2)) {
                                // reset cards state
                                store.dispatchToQueueActions(.clearInitCards)
                                store.dispatchToQueueActions(.clearSelectedCards)
                                // redirect
                                store.dispatchToQueueActions(.giveUp)
                            }
                            playSound("tap")
                            playMusic("opening")
                        }, label:  {
                            HStack (alignment: .center) {
                                Image(systemName: "heart.slash.fill")
                                    .font(.system(size: 22))
                                Text("Give Up")
                                    .font(.system(size: 22))
                            }
                        })
                        .buttonStyle(RoundedRectangleButtonStyle())
                        .padding(.top, 15)
                    }
                    .padding(.vertical, size.height * 0.08)
                    .padding(.horizontal, size.width * 0.05)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .onAppear {
            playMusic("ingame")
        }
    }
}

struct GameScreenView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ContentView().environmentObject(
                ShinkeiSuijakuStore(
                    initialState: ShinkeiSuijakuState(),
                    initialReducer: shinkeiSuijakuReducer,
                    initialMiddlewares: [gameLogic]
                )
            )
        }
    }
}
