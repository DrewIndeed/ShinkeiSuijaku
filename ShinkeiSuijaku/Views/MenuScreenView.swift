//
//  MenuScreenView.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 24/08/2022.
//

import SwiftUI

struct MenuScreenView: View {
    // (Redux) store to use Redux mechanism
    @EnvironmentObject var store: ShinkeiSuijakuStore
    
    @SwiftUI.State var playerNickname = "moscow elite thunderbolt"
    
    var body: some View {
        ZStack {
            // blue gradient background
            LinearGradient(
                colors: [Color("MenuBg1"), Color("MenuBg2")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // circles in background
            GeometryReader { proxy in
                let size = proxy.size
                
                // make the background slightly darker
                Color.black
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
                    .fill(Color.green)
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
            
            // menu screen content
            GeometryReader { proxy in
                let size = proxy.size
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center, spacing: 20) {
                        // game icon image
                        Image("MenuGameIcon")
                        
                        // player nickname
                        Text("\(playerNickname.capitalized)")
                            .font(.system(size: 28))
                            .foregroundColor(.white)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 10)
                            .padding(.top, 20)
                            .frame(width: size.width)
                        
                        // "is locked in" text
                        Text("🔥 is locked in 🔥")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .bold()
                            .multilineTextAlignment(.center)
                            .frame(width: size.width)
                        
                        // buttons
                        VStack (spacing: 20) {
                            // New Game button
                            Button(action: {
                                // button tapped action
                                // dispatch action for New Game -> to Game
                                withAnimation(.easeOut(duration: 0.4).delay(0.2)) {
                                    store.dispatchToQueueActions(.newGame)
                                }
                                playSound("tap")
                            }, label:  {
                                Text("New Game")
                                    .bold()
                                    .frame(width: 180)
                            })
                            .buttonStyle(RoundedRectangleButtonStyle())
                            .transition(.move(edge: .leading))
                            
                            // Leaderboard button
                            Button(action: {
                                // button tapped action
                                // dispatch action for Leaderboard -> to leaderboard
                                store.dispatchToQueueActions(.leaderboard)
                                playSound("tap")
                            }, label:  {
                                Text("Leaderboard")
                                    .bold()
                                    .frame(width: 180)
                            })
                            .buttonStyle(RoundedRectangleButtonStyle())
                            .transition(.move(edge: .leading))
                            
                            
                            // How To Play button
                            Button(action: {
                                // button tapped action
                                // dispatch action for How To Play -> to how to play
                                withAnimation(.easeOut(duration: 0.4).delay(0.2)) {
                                    store.dispatchToQueueActions(.howToPlay)
                                }
                                playSound("tap")
                            }, label:  {
                                Text("How To Play")
                                    .bold()
                                    .frame(width: 180)
                            })
                            .buttonStyle(RoundedRectangleButtonStyle())
                            .transition(.move(edge: .leading))
                            
                            // Log Out button
                            Button(action: {
                                // button tapped action
                                // dispatch action for log out -> to title
                                withAnimation(.easeOut(duration: 0.4).delay(0.2)) {
                                    store.dispatchToQueueActions(.logOut)
                                }
                                playSound("tap")
                            }, label:  {
                                Text("Log Out")
                                    .bold()
                                    .frame(width: 180)
                            })
                            .buttonStyle(RoundedRectangleSecondaryButtonStyle())
                            .transition(.move(edge: .leading))
                        }
                        .padding(.top, 30)
                    }
                    .padding(.vertical, size.height * 0.1)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .onAppear {
            if audioPlayer.currentTime == 0 {
                playMusic("opening")
            }
        }
    }
}

struct MenuScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreenView()
    }
}