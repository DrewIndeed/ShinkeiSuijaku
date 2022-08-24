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
    
    @SwiftUI.State private var nameInput: String = ""
    
    var body: some View {
        VStack {
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
                        VStack(alignment: .center, spacing: 30) {
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
                                .frame(width: 340)
                            
                            Spacer()
                            
                            // text field to input name
                            VStack(alignment: .leading) {
                                HStack {
                                    TextField("Your lovely nickname", text: $nameInput)
                                        .font(.system(size: 20))
                                        .frame(width: 340)
                                }
                                .textFieldStyle(OvalTextFieldStyle())
                            }
                            
                            // Start Game button
                            Button(action: {
                                // button tapped action
                                // dispatch action for Start Game -> to Menu
                                withAnimation(.easeOut(duration: 0.4).delay(0.2)) {
                                    store.dispatchToQueueActions(.startGame)
                                }
                            }, label:  {
                                Text("Start Game")
                                    .bold()
                                    .frame(width: 180)
                            })
                            .buttonStyle(RoundedRectangleButtonStyle())
                        }
                        .padding(.vertical, size.height * 0.15)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        }
    }
}

struct TitleScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreenView()
            .previewInterfaceOrientation(.portrait)
    }
}
