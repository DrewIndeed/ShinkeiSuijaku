//
//  Extensions.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 27/08/2022.
//

import Foundation

extension String {
    func trimmingAllSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        return components(separatedBy: characterSet).joined()
    }
}
