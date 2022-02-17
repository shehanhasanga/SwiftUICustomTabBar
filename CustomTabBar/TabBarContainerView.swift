//
//  TabBarContainerView.swift
//  CustomTabBar
//
//  Created by shehan karunarathna on 2022-02-17.
//

import SwiftUI

struct TabBarContainerView<Content:View>: View {
    @Binding var selection : TabBarItem
    @State var tabs:[TabBarItem] = [
        .home,
        .favourites,
        .profile
    ]
    let content : Content
    init(selection:Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    var body: some View {
        ZStack(alignment: .bottom){
            content
                .ignoresSafeArea()
            CustomTabBarView(locationSelecton: selection, tabs: tabs, selectedTab:$selection)
        }
//        VStack{
//            ZStack{
//                content
//            }
//            CustomTabBarView(tabs: tabs, selectedTab:$selection )
//        }
        .onPreferenceChange(TabBarPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}


