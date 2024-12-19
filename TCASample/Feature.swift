//
//  Feature.swift
//  TCASample
//
//  Created by 上條蓮太朗 on 2024/12/18.
//

import Foundation
import ComposableArchitecture

@Reducer
struct Feature {
    @ObservableState
    struct State: Equatable {
        var count = 0
        var numberFactString: String?
    }
    
    enum Action: Equatable {
        case factAlertDismissed
        case decrementButtonTapped
        case incrementButtonTapped
        case numberFactButtonTapped
        case numberFactResponse(String)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .factAlertDismissed:
                state.numberFactString = nil
                return .none
                
            case .decrementButtonTapped:
                state.count -= 1
                return .none
                
            case .incrementButtonTapped:
                state.count += 1
                return .none
                
            case .numberFactButtonTapped:
                return .run { [count = state.count] send in
                    let (data, _) = try await URLSession.shared.data(
                        from: URL(string: "http://numbersapi.com/\(count)/trivia")!
                    )
                    await send(
                        .numberFactResponse(String(decoding: data, as: UTF8.self))
                    )
                }
                
            case let .numberFactResponse(fact):
                state.numberFactString = fact
                return .none
            }
        }
    }
}
