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
//  CardFrontContentView.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 25/08/2022.
//

import SwiftUI

struct CardFrontContentView: View {
    var content: CardContentModel
    
    var body: some View {
        Image(content.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct CardFrontContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardFrontContentView(content: .ace_of_hearts)
    }
}
