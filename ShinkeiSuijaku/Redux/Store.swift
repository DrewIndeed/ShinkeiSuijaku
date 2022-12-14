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
//  Store.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 23/08/2022.
//

import Foundation

// To call the middleware closure when dispatching an action
// STEP 1
import Combine

// alias for clearer context when using this class
typealias ShinkeiSuijakuStore = Store<ShinkeiSuijakuState, ShinkeiSuijakuAction>

class Store<State, Action>: ObservableObject {
    // private(set) = setter is private, because only allow to update this through Redux
    @Published private(set) var state: State
    private let reducer: Reducer<State, Action>
    
    private let middlewares: [Middleware<State, Action>]
    // To call the middleware closure when dispatching an action
    // STEP 2: to save publisher subscriptions
    private var subscriptions: Set<AnyCancellable> = []
    
    // internal work of the store for dispatching actions
    private func dispatchToUpdateState(_ currentState: State, _ action: Action) {
        // generate a new state using the reducer
        let newState = reducer(currentState, action)
        
        // 1. loop through all of the store's middlewares.
        middlewares.forEach { middleware in
            // 2. call the middleware closure to obtain the returned publisher
            let publisher = middleware(newState, action)
            
            // 3. Make sure to receive the output on the main queue and send the actions to dispatch func
            publisher
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: dispatchToQueueActions)
                .store(in: &subscriptions)
        }
        
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
        initialReducer: @escaping Reducer<State, Action>,
        initialMiddlewares: [Middleware<State, Action>] = []
    ) {
        self.state = initialState
        self.reducer = initialReducer
        self.middlewares = initialMiddlewares
    }
}
