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
        ScrollView {
            VStack {
                VStack() {
                    HStack(alignment: .center) { DetailProfile(employeeId: $employeeId) }
                    HStack(alignment: .center) { DetailTag(employeeId: $employeeId) }
                    HStack(alignment: .center) { Jiko() }
                    HStack(alignment: .center) { DetailImage() }
                    Spacer()
                    NavigationLink(destination: EditView(employeeId: $employeeId)) {
                      Text("編集ボタン")
                        .font(.title)
                        .fontWeight(.bold)
    //                        .foregroundColor(Color.blue)
                    }
                    .navigationBarTitle("詳細画面", displayMode: .inline)
                }
            }
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
            Text("名字 名前")
                .font(.title)
                .padding(.vertical, 10)
                .background(Color.white)

        }

    }
}
struct DetailTag: View {
    @Binding var employeeId : String
    var body: some View {
        Text("保存済みのタグ\nJava,Spribgboot,Swift,iOS,\nサッカー,スノーボード,野球,小鹿の囲い")
            .font(.body)
            .padding(.vertical, 10)
    }
}

struct Jiko: View {
    var body: some View {
        Text("松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！")
            .font(.body)
            .padding(.vertical, 10)
    }
}

struct DetailImage: View {
    var body: some View {
        Image("DetailImage1")
            .resizable()
            .frame(width: 100, height: 100)
        Image("DetailImage2")
            .resizable()
            .frame(width: 100, height: 100)
        Image("DetailImage3")
            .resizable()
            .frame(width: 100, height: 100)
        Image("DetailImage1")
            .resizable()
            .frame(width: 100, height: 100)
        Image("DetailImage2")
            .resizable()
            .frame(width: 100, height: 100)
        Image("DetailImage3")
            .resizable()
            .frame(width: 100, height: 100)
    }
}
