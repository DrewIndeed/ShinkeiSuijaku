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
//  Encoder.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 26/08/2022.
//

import Foundation

// Function to encode struct to json string
func encodeToJsonString (gameStateObject: ShinkeiSuijakuState) -> String {
    do {
        let jsonData = try JSONEncoder().encode(gameStateObject)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        return jsonString;
    } catch {
        print(error.localizedDescription)
    }
    
    // return an init / empty json string
    return ""
}

// Function to decode struct to json string
func decodeFromJsonString (gameStateJsonString: String) -> ShinkeiSuijakuState {
    do {
        let decodedData = try JSONDecoder()
            .decode(
                ShinkeiSuijakuState.self,
                from: Data(gameStateJsonString.utf8)
            )
        return decodedData;
    } catch {
        print(error.localizedDescription)
    }
    
    // return an init / empty state
    return ShinkeiSuijakuState()
}
