//
//  EditView.swift
//  BraveMap
//
//  Created by 松岡栄志 on 2023/04/17.
//

import Foundation
import SwiftUI

struct EditView: View {
    @Binding var employeeId : String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {

            VStack() {
                HStack(alignment: .center) { DetailProfile(employeeId: $employeeId) }
                HStack(alignment: .center) { DetailTag(employeeId: $employeeId) }
                Spacer()
                NavigationLink(destination: DetailView(employeeId: $employeeId)) {
                  Text("更新ボタン")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                }
                NavigationLink(destination: DetailView(employeeId: $employeeId)) {
                  Text("取消ボタン")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
                }
                .navigationBarTitle("編集画面", displayMode: .inline)
            }
//        . navigationBarHidden(true)
    }
}


