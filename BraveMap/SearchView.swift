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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {

            VStack(spacing: 10) {
                Divider()
                  Text("検索ボタン")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
            }
//        . navigationBarHidden(true)
    }
}
