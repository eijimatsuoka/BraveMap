//
//  MyDetailView.swift
//  BraveMap
//
//  Created by 飯島 伶斗 on 2023/07/09.
//

import SwiftUI

struct MyDetailView: View {
    @Binding var employeeId : String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ScrollView {
            VStack {
                VStack() {
                    HStack(alignment: .center) { MyDetailProfile() }
                    HStack(alignment: .center) { MyDetailTag() }
                    HStack(alignment: .center) { MyJiko() }
                    HStack(alignment: .center) { MyDetailImage() }
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
struct MyDetailProfile: View {
    var body: some View {
        //画像配置
        Image("TopImage1")
            .resizable()
            .frame(width: 100, height: 100)
        VStack(alignment: .leading) {

            Text("所属 システム第1グループ")
                .font(.body)
            Text("飯島 伶斗")
                .font(.title)
                .padding(.vertical, 10)
                .background(Color.white)

        }

    }
}
struct MyDetailTag: View {
    var body: some View {
        Text("保存済みのタグ\nJava,Spribgboot,Swift,iOS,\nサッカー,スノーボード,野球,小鹿の囲い")
            .font(.body)
            .padding(.vertical, 10)
    }
}

struct MyJiko: View {
    var body: some View {
        Text("松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！松岡です。最近〜をよくしてます。興味ある人いたら声かけてください！")
            .font(.body)
            .padding(.vertical, 10)
    }
}

struct MyDetailImage: View {
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


