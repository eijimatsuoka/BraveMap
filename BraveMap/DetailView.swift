//
//  DetailView.swift
//  BraveMap
//
//  Created by 松岡栄志 on 2023/04/17.
//

import Foundation
import SwiftUI

struct DetailView: View {
    @Binding var employeeId : String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {

            VStack() {
                HStack(alignment: .center) { DetailProfile(employeeId: $employeeId) }
                HStack(alignment: .center) { DetailTag(employeeId: $employeeId) }
                HStack(alignment: .center) { Jiko(employeeId: $employeeId) }
                Spacer()
                NavigationLink(destination: EditView(employeeId: $employeeId)) {
                  Text("編集ボタン")
                    .font(.title)
                    .fontWeight(.bold)
//                        .foregroundColor(Color.blue)
                }
                .navigationBarTitle("詳細画面", displayMode: .inline)
            }
//       . navigationBarHidden(true)
    }
}
struct DetailProfile: View {
    @Binding var employeeId : String
    var body: some View {
        //画像配置
        Image("DemoImage")
            .resizable()
            .frame(width: 100, height: 100)
        VStack(alignment: .leading) {

            Text("所属 S1G")
                .font(.body)
                .background(Color.yellow)
            Text("嗚呼島 涼斗")
                .font(.title)
                .padding(.vertical, 10)
                .background(Color.white)

        }

    }
}
struct DetailTag: View {
    @Binding var employeeId : String
    var body: some View {
        Text("保存済みのタグ:〇〇,〇〇,〇〇,〇〇,〇〇,〇〇〇〇,〇〇,〇〇,〇〇,〇〇,〇〇,〇〇,〇〇,〇〇,〇〇,〇〇")
            .font(.body)
            .padding(.vertical, 10)
            .background(Color.yellow)
    }
}

struct Jiko: View {
    @Binding var employeeId : String
    var body: some View {
        Text("自己紹介")
            .font(.body)
            .padding(.vertical, 10)
            .background(Color.yellow)
    }
}
