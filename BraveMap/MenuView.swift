//
//  MenuView.swift
//  BraveMap
//
//  Created by 飯島 伶斗 on 2023/06/21.
//

import SwiftUI

struct MenuView: View {
        @Binding var employeeId : String
    var body: some View {
        VStack(alignment: .leading) {
            Image("TopImage1")
                .resizable()
                .overlay(
                    Circle().stroke(Color.gray, lineWidth: 1))
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            Text("飯島 伶斗")
            Text("ryouto@brave-heart.co.jp")
                .font(.caption)
            Divider()
            ScrollView (.vertical, showsIndicators: true) {
                NavigationLink(destination: TopView(employeeId: $employeeId)) {
                    HStack {
                        Image(systemName: "tram")
                        Text("交通費精算")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.black)
                }
                Divider()
                NavigationLink(destination: TopView(employeeId: $employeeId)) {
                    HStack {
                        Image(systemName: "fork.knife")
                        Text("グルメマップ")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.black)
                }
                Divider()
                NavigationLink(destination: TopView(employeeId: $employeeId)) {
                    HStack {
                        Image(systemName: "book")
                        Text("図書管理")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.black)
                }
                Divider()
            }
            Divider()
            NavigationLink(destination: TopView(employeeId: $employeeId)) {
                HStack {
                    Image(systemName: "gearshape")
                    Text("設定")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.black)
            }
        }
        .padding(.horizontal, 20).padding(.top, 20)
    }
}
