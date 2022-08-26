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
