//
//  Store.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 23/08/2022.
//

import Foundation

// alias for clearer context when using this class
typealias ShinkeiSuijakuStore = Store<ShinkeiSuijakuState, ShinkeiSuijakuAction>

class Store<State, Action>: ObservableObject {
    // private(set) = setter is private, because only allow to update this through Redux
    @Published private(set) var state: State
    private let reducer: Reducer<State, Action>
    
    // internal work of the store for dispatching actions
    private func dispatchToUpdateState(_ currentState: State, _ action: Action) {
        // generate a new state using the reducer
        let newState = reducer(currentState, action)
        
        // update the store's state to the new state
        state = newState
    }
    
    // using DispatchQueue to make sure that the DISPATCHING tasks are done synchronously
    // aka a serial Queue
    private let queue = DispatchQueue(
        // just a label to unique define this queue
        label: "com.DrewIndeed.ShinkeiSuijaku.store",
        // Quality of Service as userInitiated: for tasks that provide immediate results
        // for something user is doing. Read more from Apple Dev Doc
        qos: .userInitiated
    )
    
    // queue up the actions that are dispatched to update the state
    func dispatchToQueueActions(_ action: Action) {
        queue.sync {
            self.dispatchToUpdateState(self.state, action)
        }
    }
    
    init(
        initialState: State,
        // @escaping because Reducer will go out of scope when called
        initialReducer: @escaping Reducer<State, Action>
    ) {
        self.state = initialState
        self.reducer = initialReducer
    }
}
