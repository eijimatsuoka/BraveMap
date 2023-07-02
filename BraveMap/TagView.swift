//
//  TagView.swift
//  BraveMap
//
//  Created by 松岡栄志 on 2023/04/18.
//

import Foundation
import SwiftUI

//struct TagView: View {
//    @Binding var employeeId : String
//    @State private var tagNname = ""
//    @FocusState private var tagNnameFieldIsFocused: Bool
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    var body: some View {
//
//            VStack(spacing: 10) {
//                TextField("追加したいタグを入力してください", text: $tagNname)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                Text("#\(tagNname)を追加する")
//                Divider()
//                Text("追加").onTapGesture {
//                  print("タグを新規追加")
//                }
//                    .font(.title)
////                    .fontWeight(.bold)
//                    .foregroundColor(Color.blue)
//
//                Spacer().frame(height: 10)
//                Text("#\(tagNname)")
//                    .fontWeight(.bold)
//                    .padding()
//                Divider()
//                Spacer()
//
//            }
//            .onAppear {
//                /// 0.5秒の遅延発生後TextFieldに初期フォーカスをあてる
//                DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
//                    tagNnameFieldIsFocused = true
//                }
//            }
//    }
//}

struct TagView: View {
    @Binding var employeeId: String
    @State private var offset = CGFloat.zero
    @State private var closeOffset = CGFloat.zero
    @State private var openOffset = CGFloat.zero
    @State private var tagNname = ""
    @FocusState private var tagNnameFieldIsFocused: Bool
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
                    VStack(spacing: 10) {
                        TextField("追加したいタグを入力してください", text: $tagNname)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Text("#\(tagNname)を追加する")
                        Divider()
                        Text("追加").onTapGesture {
                            print("タグを新規追加")
                        }
                        .font(.title)
                        //                    .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        
                        Spacer().frame(height: 10)
                        Text("#\(tagNname)")
                            .fontWeight(.bold)
                            .padding()
                        Divider()
                        Spacer()
                        
                    }
                    .onAppear {
                        /// 0.5秒の遅延発生後TextFieldに初期フォーカスをあてる
                        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                            tagNnameFieldIsFocused = true
                        }
                    }
                    
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

