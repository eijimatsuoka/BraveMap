//
//  TopView.swift
//  BraveMap
//
//  Created by 松岡栄志 on 2023/04/17.
//

import Foundation
import SwiftUI

struct TopView: View {
    @Binding var employeeId: String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack{
            TopMyProfile()
                .frame(maxWidth: .infinity, maxHeight: 100)
            Divider()
            TopProfile(employeeId: $employeeId)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct TopMyProfile: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 20) {
                Image("TopImage1")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .leading)
                VStack(alignment: .leading) {
                    HStack{
                        Text("飯島 伶斗")
                            .font(.title2)
                        Text("システム第2グループ")
                            .font(.callout)
                    }
                    HStack{
                        Image(systemName: "tag")
                        Text("サッカー・野球・バスケ")
                    }
                    .font(.subheadline)
                    HStack{
                        Image(systemName: "pc")
                        Text("Java・Swift")
                    }
                    .font(.subheadline)
                    HStack{
                        Image(systemName: "square.and.pencil")
                        Text("よろしくお願いします")
                    }
                    .font(.subheadline)
                }
                Spacer()
            }
        }
    }
}

struct TopProfile: View {
    @Binding var employeeId: String
    let sort = ["グループ", "名前", "更新"]
    @State private var selection = 0
    var body: some View {
        VStack() {
            // ソート
            HStack {
                Spacer()
                Picker(selection: $selection, label: Text("ソート")) {
                    ForEach(0 ..< sort.count) { num in
                        Text(self.sort[num])
                    }
                }
            }
            // プロフィール一覧
            ScrollView (.vertical, showsIndicators: true) {
                VStack {
                    ForEach(0..<5){_ in
                        HStack(alignment: .top, spacing: 20) {
                            Image("TopImage5")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .leading)
                            NavigationLink(destination: DetailView(employeeId: $employeeId)) {
                                VStack(alignment: .leading) {
                                    HStack{
                                        Text("今井 啓之")
                                            .font(.title2)
                                        Text("人事部")
                                            .font(.callout)
                                    }
                                    HStack{
                                        Image(systemName: "tag")
                                        Text("サッカー・野球・バスケ")
                                    }
                                    .font(.subheadline)
                                    HStack{
                                        Image(systemName: "pc")
                                        Text("Java・Swift")
                                    }
                                    .font(.subheadline)
                                    HStack{
                                        Image(systemName: "square.and.pencil")
                                        Text("よろしくお願いします")
                                    }
                                    .font(.subheadline)
                                }
                                Spacer()
                            }
                            .foregroundColor(.black)
                        }
                        HStack(alignment: .top, spacing: 20) {
                            Image("TopImage4")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .leading)
                            NavigationLink(destination: DetailView(employeeId: $employeeId)) {
                                VStack(alignment: .leading) {
                                    HStack{
                                        Text("松岡 栄志")
                                            .font(.title2)
                                        Text("システム第2グループ")
                                            .font(.callout)
                                    }
                                    HStack{
                                        Image(systemName: "tag")
                                        Text("サッカー・野球・バスケ")
                                    }
                                    .font(.subheadline)
                                    HStack{
                                        Image(systemName: "pc")
                                        Text("Java・Swift")
                                    }
                                    .font(.subheadline)
                                    HStack{
                                        Image(systemName: "square.and.pencil")
                                        Text("よろしくお願いします")
                                    }
                                    .font(.subheadline)
                                }
                                Spacer()
                            }
                            .foregroundColor(.black)
                        }
                        HStack(alignment: .top, spacing: 20) {
                            Image("TopImage2")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .leading)
                            NavigationLink(destination: DetailView(employeeId: $employeeId)) {
                                VStack(alignment: .leading) {
                                    HStack{
                                        Text("奥田 聡")
                                            .font(.title2)
                                        Text("システム第5グループ")
                                            .font(.callout)
                                    }
                                    HStack{
                                        Image(systemName: "tag")
                                        Text("サッカー・野球・バスケ")
                                    }
                                    .font(.subheadline)
                                    HStack{
                                        Image(systemName: "pc")
                                        Text("Java・Swift")
                                    }
                                    .font(.subheadline)
                                    HStack{
                                        Image(systemName: "square.and.pencil")
                                        Text("よろしくお願いします")
                                    }
                                    .font(.subheadline)
                                }
                                Spacer()
                            }
                            .foregroundColor(.black)
                        }
                        HStack(alignment: .top, spacing: 20) {
                            Image("TopImage3")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .leading)
                            NavigationLink(destination: DetailView(employeeId: $employeeId)) {
                                VStack(alignment: .leading) {
                                    HStack{
                                        Text("小鹿 里奈")
                                            .font(.title2)
                                        Text("営業部")
                                            .font(.callout)
                                    }
                                    HStack{
                                        Image(systemName: "tag")
                                        Text("サッカー・野球・バスケ")
                                    }
                                    .font(.subheadline)
                                    HStack{
                                        Image(systemName: "pc")
                                        Text("Java・Swift")
                                    }
                                    .font(.subheadline)
                                    HStack{
                                        Image(systemName: "square.and.pencil")
                                        Text("よろしくお願いします")
                                    }
                                    .font(.subheadline)
                                }
                                Spacer()
                            }
                            .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}

