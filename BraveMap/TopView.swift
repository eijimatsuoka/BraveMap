//
//  TopView.swift
//  BraveMap
//
//  Created by 松岡栄志 on 2023/04/17.
//

import Foundation
import SwiftUI

struct TopView: View {
    @Binding var employeeId : String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {

            VStack() {

                HStack(alignment: .center) { TopProfile(employeeId: $employeeId) }
                NavigationLink(destination: SearchView(employeeId: $employeeId)) {
                    Text("検索")
                        .font(.title)
                        .background(Color.red)
                }
                    .frame(maxWidth:.infinity, maxHeight: .infinity)
                    .border(Color.orange, width: 5)
                    .navigationBarTitle("Top", displayMode: .inline)
                
            }
       
    }
}

struct TopProfile: View {
    @Binding var employeeId : String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {

            NavigationLink(destination: GroupDtailView(employeeId: $employeeId)) {
                
                VStack(spacing: 10) {
                    
                    Group {
                        
                        Text("S1G")
                            .font(.title)
                            .background(Color.yellow)
                        Spacer()
                        Divider()
                        
                        Text("S2G")
                            .font(.title)
                            .background(Color.yellow)
                        Spacer()
                        Divider()
                        
                        Text("S3G")
                            .font(.title)
                            .background(Color.yellow)
                        Spacer()
                        Divider()
                    }
                    Group {
                        Text("S4G")
                            .font(.title)
                            .background(Color.yellow)
                        Spacer()
                        Divider()
                    
                    
                        Text("S5G")
                            .font(.title)
                            .background(Color.yellow)
                        Spacer()
                        Divider()
                        
                        Text("S6G")
                            .font(.title)
                            .background(Color.yellow)
                        Spacer()
                        Divider()
                    }
                    Group {
                        Text("S7G")
                            .font(.title)
                            .background(Color.yellow)
                        Spacer()
                        Divider()
                        
                        Text("S8G")
                            .font(.title)
                            .background(Color.yellow)
                    
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

            }
    }
}
}
