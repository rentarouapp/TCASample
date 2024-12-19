//
//  TCASampleApp.swift
//  TCASample
//
//  Created by 上條蓮太朗 on 2024/12/08.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCASampleApp: App {
    var body: some Scene {
        WindowGroup {
            FeatureView(
                store: Store(initialState: Feature.State()) {
                Feature()
            })
        }
    }
}
