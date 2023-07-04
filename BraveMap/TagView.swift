//
//  TagView.swift
//  BraveMap
//
//  Created by 松岡栄志 on 2023/04/18.
//

import Foundation
import SwiftUI

struct TagView: View {
    @Binding var employeeId : String
    @State private var tagNname = ""
    @FocusState private var tagNnameFieldIsFocused: Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {

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
    }
}
