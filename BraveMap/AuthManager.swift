//
//  AuthManager.swift
//  BraveMap
//
//  Created by 飯島 伶斗 on 2023/05/22.
//

import Foundation

class AuthManager {
    // Singletonパターンでのインスタンスの共有
    static let shared = AuthManager()
    // ログイン情報を管理するファイル名
    private let loginInfoFileName = "loginInfo.json"
    
    // 初期化
    private init() {
        //TODO: 初期化 コンストラクタ的な感じ
    }
    
    /// 端末内にログイン情報ファイルが存在するか判定
    /// - Returns: true:ファイルが存在する false:ファイルが存在しない
    ///
    func checkLoginInfoFileExists() -> Bool {
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        guard let loginInfoFileURL = documentsDirectory?.appendingPathComponent("loginInfo.json") else {
            return false
        }
        
        return fileManager.fileExists(atPath: loginInfoFileURL.path)
    }
    
    func login(employeeId: String, password: String, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "http://localhost/api/authenticate") else {// TODO: 実行端末情報を取得するメソッド作ってURLを切り替え
            print("Invalid URL")
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "employeeId": employeeId,
            "password": password
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Request error: \(error)")
                completion(false)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                completion(false)
                return
            }
            
            if httpResponse.statusCode == 200 {
                DispatchQueue.main.async {
                    completion(true)
                }
            } else {
                completion(false)
            }
        }
        
        task.resume()
    }
    
    func logout() {
        // TODO: ログアウトの処理を行うコードを記述
        // ユーザーのセッションを無効化し、必要なクリアアップを行う
    }

    struct LoginInfo: Codable {
        let employeeId: String
        let password: String
    }
    
    func saveLoginInfo(employeeId: String, password: String) {
        let loginInfo = LoginInfo(employeeId: employeeId, password: password)
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(loginInfo)
            
            if let fileURL = getFileURL() {
                try data.write(to: fileURL)
                print("Login info saved successfully.")
            }
        } catch {
            print("Failed to save login info: \(error)")
        }
    }
    
    func getSavedLoginInfo() -> LoginInfo? {
        guard let fileURL = getFileURL() else {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let loginInfo = try decoder.decode(LoginInfo.self, from: data)
            
            return loginInfo
        } catch {
            print("Failed to retrieve saved login info: \(error)")
            return nil
        }
    }
    
    private func getFileURL() -> URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        let fileURL = documentsDirectory.appendingPathComponent(loginInfoFileName)
        return fileURL
    }
    
    
    // TODO: あ
    // ユーザー認証を実行
//    let employeeId = "exampleemployeeId"
//    let password = "examplePassword"
//    authenticateEmployeeId(employeeId: employeeId, password: password)

}



