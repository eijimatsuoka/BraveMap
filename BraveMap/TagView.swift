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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {

            VStack(spacing: 10) {
                Divider()
                  Text("追加ボタン")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    
                Spacer().frame(height: 10)
                  Text("タグ作成ボタン")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                Divider()
                Spacer()
                Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("ログアウト")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.red)
                            .padding(.bottom)
                        }
            }
//        . navigationBarHidden(true)
    }
}
