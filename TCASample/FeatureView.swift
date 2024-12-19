//
//  FeatureView.swift
//  TCASample
//
//  Created by 上條蓮太朗 on 2024/12/18.
//

import SwiftUI
import ComposableArchitecture

struct FeatureView: View {
    let store: StoreOf<Feature>
    
    var body: some View {
        Form {
            Section {
                Text("\(store.count)")
                Button("Decrement") { store.send(.decrementButtonTapped) }
                Button("Increment") { store.send(.incrementButtonTapped) }
            }
            
            Section {
                Button("Number fact") { store.send(.numberFactButtonTapped) }
                Button("Number fact dismiss") { store.send(.factAlertDismissed) }
            }
            
            if let fact = store.numberFactString {
                Text(fact)
            }
        }
    }
}

#Preview {
    FeatureView(store: Store(initialState: Feature.State()) {
        Feature()
    })
}
