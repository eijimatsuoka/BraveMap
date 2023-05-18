//
//  GroupDetailView.swift
//  BraveMap
//
//  Created by 松岡栄志 on 2023/05/15.
//

import Foundation
import SwiftUI

struct GroupDtailView: View {
    @Binding var employeeId : String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {

            VStack() {
                ForEach(0..<4){_ in
                    HStack(alignment: .center) { GroupView(employeeId: $employeeId) }
                    HStack(alignment: .center) { TopTag(employeeId: $employeeId) }
                }
                
                Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("ログアウト")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.red)
                            .padding(.bottom)
                        }
                        .navigationBarTitle("S1G", displayMode: .inline)
            }
       
//        . navigationBarHidden(true)
    }
}

struct GroupView: View {
    @Binding var employeeId : String
    var body: some View {
        //画像配置
        NavigationLink(destination: DetailView(employeeId: $employeeId)) {
            Image("DemoImage")
                .resizable()
                .frame(width: 100, height: 100,alignment : .leading)
        }
        VStack(alignment: .leading) {

            Text("所属 S1G")
                .font(.body)
                .background(Color.yellow)

            NavigationLink(destination: DetailView(employeeId: $employeeId)) {
                Text("嗚呼島 涼斗")
                    .font(.title)
                    .padding(.vertical, 10)
                    .background(Color.white)
            }
        }

    }
}

struct TopTag: View {
    @Binding var employeeId : String
    var body: some View {
        NavigationLink(destination: TagView(employeeId: $employeeId)) {
            Text("保存済みのタグ:〇〇,〇〇,〇〇,〇〇,〇〇,〇〇〇〇,〇〇,〇〇,〇〇,〇〇,〇〇,〇〇,〇〇,〇〇,〇〇,〇〇")
                .font(.body)
                .padding(.vertical, 10)
                .background(Color.yellow)
        }

    }
}
