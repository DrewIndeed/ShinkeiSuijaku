//
//  Store.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 23/08/2022.
//

import Foundation

// alias for clearer context when using this class
typealias ShinkeiSuijakuStore = Store<ShinkeiSuijakuState>

class Store<State>: ObservableObject {
    // private(set) = setter is private, because only allow to update this through Redux
    @Published private(set) var state: State
    
    init(initialState: State) {
        self.state = initialState
    }
}
