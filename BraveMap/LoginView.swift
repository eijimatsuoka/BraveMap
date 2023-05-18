//
//  ContentView.swift
//  BraveMap
//
//  Created by 松岡栄志 on 2023/04/17.
//

import SwiftUI

struct LoginView: View {
    
    @State var employeeId : String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("BraveMap")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
                Divider()
                Group {
                Text("社員ID")
                    .font(.title)
                    .multilineTextAlignment(.center)
                TextField("", text: $employeeId)
                    .font(.title)
                    .border(Color.gray, width: 3)
                    .padding()
                Spacer().frame(height: 10)
                Text("パスワード")
                    .font(.title)
                    .multilineTextAlignment(.center)
                TextField("", text: .constant(""))
                    .font(.title)
                    .border(Color.gray, width: 3)
                    .padding()
                }
                Divider()
                Spacer()
                NavigationLink(destination: TopView(employeeId: $employeeId)) {
                    Text("ログイン")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        .padding(.bottom)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
