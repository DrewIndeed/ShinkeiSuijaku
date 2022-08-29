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
//  Created by Andrew Le Nguyen on 23/08/2022.
//

import SwiftUI

struct TitleScreenView: View {
    // (Redux) store to use Redux mechanism
    @EnvironmentObject var store: ShinkeiSuijakuStore
    
    // context to interract with Core Data
    @Environment(\.managedObjectContext) var moc
    
    // players list
    @FetchRequest(entity: Player.entity(), sortDescriptors: []) var players: FetchedResults<Player>
    
    // text field - player name input
    @SwiftUI.State private var nameInput: String = ""
    
    // alert showing flag
    @SwiftUI.State var showLevelAlert: Bool = false
    
    // duplicate checking flag
    @SwiftUI.State var hasDuplicate: Bool = false
    
    /* DEVELOPMENT ONLY */
    func removePlayers(at offsets: IndexSet) {
        for index in offsets {
            let player = players[index]
            self.moc.delete(player)
        }
        
        // save context
        try? self.moc.save()
    }
    
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
            
            // title screen content
            GeometryReader { proxy in
                let size = proxy.size
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center, spacing: 25) {
                        // game icon image
                        Image("MenuGameIcon")
                        
                        // main title
                        Text("Shinkei Suijaku")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .bold()
                        
                        // sub title
                        Text("A classic Card Matching game that has been around for decades!")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 320)
                        
                        Spacer()
                        
                        /* DEVELOPMENT ONLY */
//                        List {
//                            ForEach(players) { player in
//                                HStack {
//                                    Text(player.name ?? "Unknown")
//                                    Text("- Login status:")
//                                    Text(String(player.isPlaying))
//                                }
//                            }
//                            .onDelete(perform: removePlayers)
//                        }
//                        .frame(height: 300)
                        
                        // text field to input name
                        VStack(alignment: .leading) {
                            HStack {
                                TextField("Enter your lovely nickname", text: $nameInput)
                                    .disableAutocorrection(true)
                                    .font(.system(size: 16))
                                    .frame(width: 320)
                            }
                            .textFieldStyle(OvalTextFieldStyle())
                        }
                        
                        // Start Game button
                        Button(action: {
                            // if there is inpuy content, show alert
                            if (nameInput.trimmingAllSpaces() != "") {
                                // call duplicate checking function
                                hasDuplicate = checkForDuplicates(
                                    targetPlayerName: nameInput.trimmingAllSpaces(),
                                    players: players
                                )
                                showLevelAlert.toggle()
                            }
                            
                            playSound("tap")
                        }, label:  {
                            Text("Start Game")
                                .bold()
                                .frame(width: 180)
                        })
                        .buttonStyle(RoundedRectangleButtonStyle())
                    }
                    .padding(.top, size.height * 0.1)
                    .padding(.bottom, size.height * 0.35)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .alert("Are you ready?", isPresented: $showLevelAlert) {
            Button("It's On!", role: .destructive, action: {
                // if having duplicates, jump into game
                // if not, create new player and jump into game
                if (!hasDuplicate) {
                    let player = Player(context: moc)
                    player.name = nameInput.trimmingAllSpaces()
                    player.id = UUID()
                    player.personalGameState = encodeToJsonString(gameStateObject: ShinkeiSuijakuState())
                    // because there is no player.isPlaying is set here,
                    // when exit app, every player.isPlaying will be false
                    
                    // save context
                    try? self.moc.save()
                }
                
                // reset name input content
                updateStatus(targetPlayerName: nameInput.trimmingAllSpaces(), players: players)
                nameInput = ""
                
                // button tapped action
                // dispatch action for Start Game -> to Menu
                withAnimation(.easeOut(duration: 0.4).delay(0.2)) {
                    store.dispatchToQueueActions(.startGame)
                }
                
                // button debounce
                if (showLevelAlert == true) {
                    showLevelAlert.toggle()
                    if (showLevelAlert == true) {
                        showLevelAlert.toggle()
                    }
                }
            })
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
            if (hasDuplicate) {
                Text("Welcome back, \(nameInput)🔥")
            } else {
                Text("Welcome, \(nameInput)🔥")
            }
        }
        .onAppear {
            if audioPlayer.currentTime == 0 {
                playMusic("opening")
            }
        }
    }
}

struct TitleScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreenView()
    }
}
