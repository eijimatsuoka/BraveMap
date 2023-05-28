//
//  LoadingView.swift
//  BraveMap
//
//  Created by 飯島 伶斗 on 2023/05/24.
//

import SwiftUI

struct LoadingView: View {
    @State private var rotationAngle: Angle = .degrees(0)
    
    var body: some View {
            VStack {
                // TODO: 一時的にコメントアウト
//              ProgressView() // ローディングインジケーター
                Image("ME")
                    .resizable()
                    .frame(width: 350, height: 350)
                    .rotationEffect(rotationAngle)
                    .animation(.linear(duration: 1.0).repeatForever(autoreverses: false))
                    .onAppear {
                        rotationAngle = .degrees(360)
                    }
                Text("Loading...")
            }
            .padding()
    }
}

