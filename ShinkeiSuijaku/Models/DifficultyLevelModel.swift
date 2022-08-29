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
//  DifficultyLevelModel.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 25/08/2022.
//

import Foundation
import SwiftUI

enum DifficultyLevelModel: String, Identifiable, CaseIterable, Codable {
    var id: String {rawValue}
    
    // difficulty levels
    case easy = "easy"
    case medium = "medium"
    case hard = "hard"
    
    // colors of level buttons
    var numberOfCards: Int {
        switch self {
        case .easy:
            return 8
        case .medium:
            return 12
        case .hard:
            return 16
        }
    }
}
