//
//  ContentView.swift
//  BraveMap
//
//  Created by 松岡栄志 on 2023/04/17.
//

import SwiftUI

struct LoginView: View {
    @State var employeeId : String = ""
    @State var password : String = ""
    @State var shouldNavigate = false
    
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
                TextField("", text: $password)
                    .font(.title)
                    .border(Color.gray, width: 3)
                    .padding()
                }
                Divider()
                Spacer()
                Button(action: {
                    if validateLogin() {
                        shouldNavigate = true
                        AuthManager.shared.saveLoginInfo(employeeId: employeeId, password: password)// TODO: このメソッドの前にloginメソッド 　trueだったらこのメソッド
                    } else {
                        // TODO: ログインに失敗した場合の処理　アラートとか
                    }
                }) {
                    VStack {
                        Text("ログイン")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.blue)
                            .padding(.bottom)
                        TextField("", text: $employeeId)
                            .font(.title)
                            .border(Color.gray, width: 3)
                            .opacity(0)
                            .disabled(true)
                    }
                }
                .fullScreenCover(isPresented: $shouldNavigate, content: {
                    TopView(employeeId: $employeeId)
                })
            }
        }
        
    }
    private func validateLogin() -> Bool{
        // TODO: ログインのバリデーションロジックを実装 入力判定とか　ワンチャンサーバーサイドになげる
        return true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
