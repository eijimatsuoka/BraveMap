//
//  FooterView.swift
//  BraveMap
//
//  Created by 飯島 伶斗 on 2023/06/21.
//

import SwiftUI

struct FooterView: View {
    @Binding var employeeId : String
    var body: some View {
        HStack(){
            Spacer()
            NavigationLink(destination: TopView(employeeId: $employeeId)) {
                Image(systemName: "house")
                    .font(.title)
                    .foregroundColor(.black)
            }
            Spacer()
            NavigationLink(destination: SearchView(employeeId: $employeeId)) {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.black)
            }
            Spacer()
            NavigationLink(destination: TagView(employeeId: $employeeId)) {
                Image(systemName: "tag")
                    .font(.title)
                    .foregroundColor(.black)
            }
            Spacer()
            NavigationLink(destination: TopView(employeeId: $employeeId)) {// TODO: マイプロフィール編集ビュー作る
                Image(systemName: "person.text.rectangle")
                    .font(.title)
                    .foregroundColor(.black)
            }
            Spacer()
        }
    }
}
