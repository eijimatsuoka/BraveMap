//
//  SearchView.swift
//  BraveMap
//
//  Created by 松岡栄志 on 2023/05/15.
//

import Foundation
import SwiftUI

struct SearchView: View {
    @Binding var employeeId : String
    @State private var groupSearch = ""
    @State private var tagSearch = ""
    @State private var wordSearch = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {

                    VStack(spacing: 10) {
                        Text("グループ検索")
                            .font(.title)
                            .fontWeight(.bold)
                        TextField("検索したいグループを入力してください", text: $groupSearch)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        NavigationLink(destination: TopView(employeeId: $employeeId)) {
                            Text("\(groupSearch)Gで検索")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        Text("タグ検索")
                            .font(.title)
                            .fontWeight(.bold)
                        TextField("検索したいタグを入力してください", text: $tagSearch)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        NavigationLink(destination: TopView(employeeId: $employeeId)) {
                            Text("#\(tagSearch)検索")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        Text("ワード検索")
                            .font(.title)
                            .fontWeight(.bold)
                        TextField("検索したいワードを入力してください", text: $wordSearch)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        NavigationLink(destination: TopView(employeeId: $employeeId)) {
                            Text("\(wordSearch)で検索")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                    }
                    
                
//        . navigationBarHidden(true)
    }
}
