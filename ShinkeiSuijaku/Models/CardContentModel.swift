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
//  CardContentModel.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 25/08/2022.
//

import SwiftUI

enum CardContentModel: String, CaseIterable, Codable {
    var image: String {rawValue}
    
    case two_of_clubs = "2_of_clubs"
    case two_of_diamonds = "2_of_diamonds"
    case two_of_hearts = "2_of_hearts"
    case two_of_spades = "2_of_spades"

    case three_of_clubs = "3_of_clubs"
    case three_of_diamonds = "3_of_diamonds"
    case three_of_hearts = "3_of_hearts"
    case three_of_spades = "3_of_spades"

    case four_of_clubs = "4_of_clubs"
    case four_of_diamonds = "4_of_diamonds"
    case four_of_hearts = "4_of_hearts"
    case four_of_spades = "4_of_spades"

    case five_of_clubs = "5_of_clubs"
    case five_of_diamonds = "5_of_diamonds"
    case five_of_hearts = "5_of_hearts"
    case five_of_spades = "5_of_spades"

    case six_of_clubs = "6_of_clubs"
    case six_of_diamonds = "6_of_diamonds"
    case six_of_hearts = "6_of_hearts"
    case six_of_spades = "6_of_spades"

    case seven_of_clubs = "7_of_clubs"
    case seven_of_diamonds = "7_of_diamonds"
    case seven_of_hearts = "7_of_hearts"
    case seven_of_spades = "7_of_spades"

    case eight_of_clubs = "8_of_clubs"
    case eight_of_diamonds = "8_of_diamonds"
    case eight_of_hearts = "8_of_hearts"
    case eight_of_spades = "8_of_spades"

    case nine_of_clubs = "9_of_clubs"
    case nine_of_diamonds = "9_of_diamonds"
    case nine_of_hearts = "9_of_hearts"
    case nine_of_spades = "9_of_spades"

    case ten_of_clubs = "10_of_clubs"
    case ten_of_diamonds = "10_of_diamonds"
    case ten_of_hearts = "10_of_hearts"
    case ten_of_spades = "10_of_spades"

    case ace_of_clubs = "ace_of_clubs"
    case ace_of_diamonds = "ace_of_diamonds"
    case ace_of_hearts = "ace_of_hearts"
    case ace_of_spades = "ace_of_spades"

    case jack_of_clubs = "jack_of_clubs"
    case jack_of_diamonds = "jack_of_diamonds"
    case jack_of_hearts = "jack_of_hearts"
    case jack_of_spades = "jack_of_spades"

    case king_of_clubs = "king_of_clubs"
    case king_of_diamonds = "king_of_diamonds"
    case king_of_hearts = "king_of_hearts"
    case king_of_spades = "king_of_spades"

    case queen_of_clubs = "queen_of_clubs"
    case queen_of_diamonds = "queen_of_diamonds"
    case queen_of_hearts = "queen_of_hearts"
    case queen_of_spades = "queen_of_spades"
    
    case black_joker = "black_joker"
    case red_joker = "red_joker"
    case back = "back"
}
