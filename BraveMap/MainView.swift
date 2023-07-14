//
//  MainView.swift
//  BraveMap
//
//  Created by 飯島 伶斗 on 2023/07/05.
//

import SwiftUI


struct MainView: View {
    @Binding var employeeId: String
    @State private var selectedTab: Tab = .top
    @State private var offset = CGFloat.zero
    @State private var closeOffset = CGFloat.zero
    @State private var openOffset = CGFloat.zero
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    enum Tab {
        case top
        case search
        case tag
        case myDetail
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                VStack() {
                    // ヘッダー
                    HStack() {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .onTapGesture {
                                self.offset = self.openOffset
                            }
                        Spacer()
                        Text("BraveMap")
                            .font(.title)
                            .padding(.trailing, 30)
                        Spacer()
                    }
                    .padding()
                    .frame(height: 50)
                    Divider()
                    
                    //フッタータブ
                    TabView(selection: $selectedTab) {
                        TopView(employeeId: $employeeId)
                            .tag(Tab.top)
                            .tabItem {
                                Image(systemName: "house")
                            }
                        SearchView(employeeId: $employeeId)
                            .tag(Tab.search)
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                            }
                        TagView(employeeId: $employeeId)
                            .tag(Tab.tag)
                            .tabItem {
                                Image(systemName: "tag")
                            }
                        MyDetailView(employeeId: $employeeId)
                            .tag(Tab.myDetail)
                            .tabItem {
                                Image(systemName: "person.text.rectangle")
                            }
                    }
                    .accentColor(.black)
                }
                .navigationBarHidden(true)
                .background(Color.white)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .disabled(offset != closeOffset) // メニューが表示されている時のみ非活性にする
                
                if offset != closeOffset {
                    // メニューが表示されている時のみグレーアウトさせる
                    Color.gray.opacity(
                        Double((closeOffset - offset) / closeOffset) - 0.4
                    )
                    .onTapGesture {
                        self.offset = self.closeOffset
                    }
                }
                
                MenuView(employeeId: $employeeId)
                    .background(Color.white)
                    .frame(width: geometry.size.width * 0.7)
                    .onAppear(perform: {
                        self.offset = geometry.size.width * -1
                        self.closeOffset = self.offset
                        self.openOffset = .zero
                    })
                    .offset(x: self.offset)
                    .animation(.default)
            }
            .gesture(DragGesture(minimumDistance: 30)
                .onChanged { value in
                    if self.offset < self.openOffset {
                        self.offset = self.closeOffset + value.translation.width
                    }
                }
                .onEnded { value in
                    if value.location.x > value.startLocation.x {
                        self.offset = self.openOffset
                    } else {
                        self.offset = self.closeOffset
                    }
                }
            )
        }
    }
}

//struct MainView: View {
//    @Binding var employeeId: String
//    @State private var selectedTab: Tab = .top
//    @State private var offset = CGFloat.zero
//    @State private var closeOffset = CGFloat.zero
//    @State private var openOffset = CGFloat.zero
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//    enum Tab {
//            case top
//            case search
//            case tag
//            case myDetail
//        }
//
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack(alignment: .leading) {
//                VStack() {
//                    // ヘッダー
//                    HStack() {
//                        Image(systemName: "line.horizontal.3")
//                            .font(.title)
//                            .onTapGesture {
//                                self.offset = self.openOffset
//                            }
//                        Spacer()
//                        Text("BraveMap")
//                            .font(.title)
//                            .padding(.trailing, 30)
//                        Spacer()
//                    }
//                    .padding()
//                    .frame(height: 50)
//                    Divider()
//
//                    // メインコンテンツ
//                    viewForTab(selectedTab)
//
//                    //フッター
//                    Spacer()
//                    Divider()
//                    HStack {
//                        Spacer()
//                        FooterTabButton(tab: .top, imageName: "house", selectedTab: $selectedTab)
//                        Spacer()
//                        FooterTabButton(tab: .search, imageName: "magnifyingglass", selectedTab: $selectedTab)
//                        Spacer()
//                        FooterTabButton(tab: .tag, imageName: "tag", selectedTab: $selectedTab)
//                        Spacer()
//                        FooterTabButton(tab: .myDetail, imageName: "person.text.rectangle", selectedTab: $selectedTab)
//                        Spacer()
//                    }
//
//                }
//                .navigationBarHidden(true)
//                .background(Color.white)
//                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
//                .disabled(offset != closeOffset) // メニューが表示されている時のみ非活性にする
//
//                if offset != closeOffset {
//                    // メニューが表示されている時のみグレーアウトさせる
//                    Color.gray.opacity(
//                        Double((closeOffset - offset) / closeOffset) - 0.4
//                    )
//                    .onTapGesture {
//                        self.offset = self.closeOffset
//                    }
//                }
//
//                MenuView(employeeId: $employeeId)
//                    .background(Color.white)
//                    .frame(width: geometry.size.width * 0.7)
//                    .onAppear(perform: {
//                        self.offset = geometry.size.width * -1
//                        self.closeOffset = self.offset
//                        self.openOffset = .zero
//                    })
//                    .offset(x: self.offset)
//                    .animation(.default)
//            }
//            .gesture(DragGesture(minimumDistance: 30)
//                .onChanged { value in
//                    if self.offset < self.openOffset {
//                        self.offset = self.closeOffset + value.translation.width
//                    }
//                }
//                .onEnded { value in
//                    if value.location.x > value.startLocation.x {
//                        self.offset = self.openOffset
//                    } else {
//                        self.offset = self.closeOffset
//                    }
//                }
//            )
//        }
//    }
//
//    @ViewBuilder
//    private func viewForTab(_ tab: Tab) -> some View {
//        switch tab {
//        case .top:
//            TopView(employeeId: $employeeId)
//                .navigationBarTitle("Top", displayMode: .inline)
//        case .search:
//            SearchView(employeeId: $employeeId)
//                .navigationBarTitle("Search", displayMode: .inline)
//        case .tag:
//            TagView(employeeId: $employeeId)
//                .navigationBarTitle("Tag", displayMode: .inline)
//        case .myDetail:
//            MyDetailView(employeeId: $employeeId)
//                .navigationBarTitle("MyDetail", displayMode: .inline)
//        }
//    }
//}
//
//struct FooterTabButton: View {
//    let tab: MainView.Tab
//    let imageName: String
//    @Binding var selectedTab: MainView.Tab
//
//    var body: some View {
//        Button(action: {
//            selectedTab = tab
//        }) {
//            Image(systemName: imageName)
//                .font(.title)
//                .foregroundColor(selectedTab == tab ? .black : .gray)
//        }
//    }
//}
