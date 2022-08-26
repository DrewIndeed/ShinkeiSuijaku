//
//  WonScreenView.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 26/08/2022.
//

import SwiftUI

struct WonScreenView: View {
    // (Redux) store as an environment object to be able to update
    @EnvironmentObject var store: ShinkeiSuijakuStore
    
    @SwiftUI.State var showMedal = false
    
    var body: some View {
        ZStack {
            // blue gradient background
            LinearGradient(
                colors: [.blue, .red],
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
                    .fill(Color.yellow)
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
                    .fill(Color.red)
                    .padding(60)
                    .blur(radius: 120)
                    .offset(x: -size.width / 1.8, y: size.height / 2)
            }
            
            // How To Play screen content
            GeometryReader { proxy in
                let size = proxy.size
                
                ScrollView {
                    
                    VStack(alignment: .center) {
                        HStack {
                            Spacer()
                            Image("won")
                                .resizable()
                                .frame(width: 330, height: 300)
                            Spacer()
                        }
                        
                        Text("YOU'RE A")
                            .foregroundColor(.white)
                            .font(
                                .system(size: 40)
                                .weight(.heavy)
                            )
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding(.top, 30)
                        
                        Text("MEMORY MASTER!")
                            .foregroundColor(.yellow)
                            .font(
                                .system(size: 70)
                                .weight(.heavy)
                            )
                            .bold()
                            .multilineTextAlignment(.center)
                        
                        // Back To Menu button
                        Button(action: {
                            // button tapped action
                            // dispatch action for Back to Menu -> to Menu
                            withAnimation(.easeOut(duration: 0.4).delay(0.2)) {
                                // reset cards state
                                store.dispatchToQueueActions(.clearInitCards)
                                store.dispatchToQueueActions(.clearSelectedCards)
                                // redirect
                                store.dispatchToQueueActions(.startGame)
                            }
                            playSound("tap")
                            playMusic("opening")
                        }, label:  {
                            Text("Back To Menu")
                                .bold()
                                .frame(width: 300)
                        })
                        .buttonStyle(RoundedRectangleSecondaryButtonStyle())
                    }
                    .padding(.vertical, size.height * 0.08)
                    .padding(.horizontal, size.width * 0.05)
                    
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .onAppear {
            playMusic("win")
        }
    }
}

struct WonScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WonScreenView()
    }
}
