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
//  MenuScreenView.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 24/08/2022.
//

import SwiftUI

struct MenuScreenView: View {
    // (Redux) store to use Redux mechanism
    @EnvironmentObject var store: ShinkeiSuijakuStore
    
    // context to interract with Core Data
    @Environment(\.managedObjectContext) var moc
    
    // current playing player
    @FetchRequest(
        entity: Player.entity(),
        sortDescriptors: [],
        predicate: NSPredicate(format: "isPlaying = true", true)
    ) var currentPlayers: FetchedResults<Player>
    
    
    // alert showing flag
    @SwiftUI.State var showLevelAlert: Bool = false
    
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
                        Text(currentPlayers.count != 0 ? currentPlayers[0].name! : "")
                            .font(.system(size: 28))
                            .foregroundColor(.white)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 10)
                            .padding(.top, 20)
                            .frame(width: size.width)
                        
                        // "is locked in" text
                        Text(currentPlayers.count != 0 ? "???? is locked in ????" : "")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .bold()
                            .multilineTextAlignment(.center)
                            .frame(width: size.width)
                        
                        // buttons
                        VStack (spacing: 20) {
                            // New Game button
                            Button(action: {
                                if (showLevelAlert == false) {
                                    showLevelAlert.toggle()
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
//                            Button(action: {
//                                // button tapped action
//                                // dispatch action for Leaderboard -> to leaderboard
//                                store.dispatchToQueueActions(.leaderboard)
//                                playSound("tap")
//                            }, label:  {
//                                Text("Leaderboard")
//                                    .bold()
//                                    .frame(width: 180)
//                            })
//                            .buttonStyle(RoundedRectangleButtonStyle())
//                            .transition(.move(edge: .leading))
                            
                            
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
                                // if there is a current player, reset isPlaying status of that player
                                if (currentPlayers.count != 0) {
                                    for player in currentPlayers {
                                        if (player.isPlaying) {
                                            player.isPlaying = false
                                        }
                                    }
                                    
                                    // button tapped action
                                    // dispatch action for log out -> to title
                                    withAnimation(.easeOut(duration: 0.4)) {
                                        store.dispatchToQueueActions(.logOut)
                                    }
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
        .alert("Difficulty", isPresented: $showLevelAlert) {
            DifficultyLevelButton(difficultyLevel: .easy, role: nil)
            DifficultyLevelButton(difficultyLevel: .medium, role: nil)
            DifficultyLevelButton(difficultyLevel: .hard, role: .destructive)
            Button("Cancel", role: .cancel, action: {
                // button debounce
                if (showLevelAlert == true) {
                    showLevelAlert.toggle()
                    if (showLevelAlert == true) {
                        showLevelAlert.toggle()
                    }
                }
            })
        } message: {
            Text("Choose your level warrior!")
        }
        .onAppear {
            if audioPlayer.currentTime == 0 {
                playMusic("opening")
            }
        }
    }
    
    @ViewBuilder
    func DifficultyLevelButton(difficultyLevel: DifficultyLevelModel, role: ButtonRole?) -> some View {
        Button(difficultyLevel.rawValue.capitalized, role: role, action: {
            // set difficulty level
            store.dispatchToQueueActions(.setDifficultyLevel(difficultyLevel))
            
            // button tapped action
            // dispatch action for New Game -> to Game
            withAnimation(.easeOut(duration: 0.4).delay(0.2)) {
                // redirect
                store.dispatchToQueueActions(.newGame)
            }
        })
    }
}

struct MenuScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreenView()
    }
}
