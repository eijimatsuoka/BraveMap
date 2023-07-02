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
    @State private var offset = CGFloat.zero
    @State private var closeOffset = CGFloat.zero
    @State private var openOffset = CGFloat.zero
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                VStack() {
                    // ヘッダー
                    HStack() {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .onTapGesture {
                                self.offset = self.openOffset
                            }
                        Spacer()
                        Text("BraveMap")
                            .font(.title)
                            .padding(.trailing, 30)
                        Spacer()
                    }
                    .padding()
                    .frame(height: 50)
                    
                    // メインコンテンツ
                    TopMyProfile()
                        .frame(maxWidth: .infinity, maxHeight: 100)
                    Divider()
                    TopProfile(employeeId: $employeeId)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    //フッター
                    Spacer()
                    FooterView(employeeId: $employeeId)
                        .frame(height: 50, alignment: .bottom)
                }
                .navigationBarHidden(true)
                .background(Color.white)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .disabled(offset != closeOffset) // メニューが表示されている時のみ非活性にする
                
                if offset != closeOffset {
                    // メニューが表示されている時のみグレーアウトさせる
                    Color.gray.opacity(
                        Double((closeOffset - offset) / closeOffset) - 0.4
                    )
                    .onTapGesture {
                        self.offset = self.closeOffset
                    }
                }
                
                MenuView(employeeId: $employeeId)
                    .background(Color.white)
                    .frame(width: geometry.size.width * 0.7)
                    .onAppear(perform: {
                        self.offset = geometry.size.width * -1
                        self.closeOffset = self.offset
                        self.openOffset = .zero
                    })
                    .offset(x: self.offset)
                    .animation(.default)
            }
            .gesture(DragGesture(minimumDistance: 50)
                .onChanged { value in
                    if self.offset < self.openOffset {
                        self.offset = self.closeOffset + value.translation.width
                    }
                }
                .onEnded { value in
                    if value.location.x > value.startLocation.x {
                        self.offset = self.openOffset
                    } else {
                        self.offset = self.closeOffset
                    }
                }
            )
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
                        NavigationLink(destination: DetailView(employeeId: $employeeId)) {
                            HStack(alignment: .top, spacing: 20) {
                                
                                Image("TopImage5")
                                    .resizable()
                                    .frame(width: 100, height: 100, alignment: .leading)
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
                        NavigationLink(destination: DetailView(employeeId: $employeeId)) {
                            HStack(alignment: .top, spacing: 20) {
                                Image("TopImage4")
                                    .resizable()
                                    .frame(width: 100, height: 100, alignment: .leading)
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
                        NavigationLink(destination: DetailView(employeeId: $employeeId)) {
                            HStack(alignment: .top, spacing: 20) {
                                Image("TopImage2")
                                    .resizable()
                                    .frame(width: 100, height: 100, alignment: .leading)
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
                        NavigationLink(destination: DetailView(employeeId: $employeeId)) {
                            HStack(alignment: .top, spacing: 20) {
                                Image("TopImage3")
                                    .resizable()
                                    .frame(width: 100, height: 100, alignment: .leading)
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

