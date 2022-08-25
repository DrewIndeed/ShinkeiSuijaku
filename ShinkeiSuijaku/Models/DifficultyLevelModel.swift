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
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    
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
