//
//  BraveMapApp.swift
//  BraveMap
//
//  Created by 松岡栄志 on 2023/04/17.
//

import SwiftUI

@main
struct BraveMapApp: App {
    @State private var isLoading = true
    @State private var isLoggedIn = false
    @State private var employeeId = ""// TODO: ユーザー情報をどうやって持つか考える 管理画面とかリーダー用画面にユーザー情報とかフラグで分岐する プロパティをログイン用のシングルトンのなかに書けばとりあえず良いかも

    var body: some Scene {
        WindowGroup {
            if isLoading {
                LoadingView()
                    .onAppear {
                        // TODO: 一時的にコメントアウト
//                        loadLoginInfo()
                        // TODO: 動作確認用（３秒間ローディング画面表示）
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            isLoading = false
                        }
                    }
            } else {
                contentView()
            }
        }
    }
    
    // 遷移する画面の判定が終了したらローディング画面を終了する
    private func loadLoginInfo() {
        if AuthManager.shared.checkLoginInfoFileExists() {
            if let loginInfo = AuthManager.shared.getSavedLoginInfo() {
                employeeId = loginInfo.employeeId
                let password = loginInfo.password
                AuthManager.shared.login(employeeId: employeeId, password: password) { success in
                    if success {
                        isLoggedIn = true
                    }
                    isLoading = false
                }
            } else {
                isLoading = false
            }
        } else {
            isLoading = false
        }
    }
    
    // 次の画面に遷移する
    @ViewBuilder
    private func contentView() -> some View {
        if isLoggedIn {
            TopView(employeeId: $employeeId)
        } else {
            LoginView()
        }
    }
}
