//
//  HeaderView.swift
//  BraveMap
//
//  Created by 飯島 伶斗 on 2023/06/21.
//

import SwiftUI

// 現状使ってない
struct HeaderView: View {
    @Binding var isMenuVisible: Bool
    var body: some View {
        HStack(){
            Image(systemName: "line.horizontal.3")
                .font(.title)
                .onTapGesture {
                    isMenuVisible.toggle()
                }
            Spacer()
            Text("BraveMap")
                .font(.title)
                .padding(.trailing, 30)
            Spacer()
        }
        .padding()
    }
}
