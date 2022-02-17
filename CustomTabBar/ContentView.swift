//
//  ContentView.swift
//  CustomTabBar
//
//  Created by shehan karunarathna on 2022-02-17.
//

import SwiftUI

struct ContentView: View {
    @State var selection:String = "home"
    @State var tabSelection:TabBarItem = .home
   
    var body: some View {
        TabBarContainerView(selection: $tabSelection) {
            Color.red
                .tabBarItem(tab: .home, selection: $tabSelection)
            Color.blue
                .tabBarItem(tab: .favourites, selection: $tabSelection)
            Color.green
                .tabBarItem(tab:  .profile, selection: $tabSelection)
            Color.orange
                .tabBarItem(tab:  .messages, selection: $tabSelection)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView{
    var defaulttab : some View{
        TabView(selection: $selection) {
            Color.red.tabItem {
                Image(systemName: "house")
                Text("home")
            }
            Color.gray.tabItem {
                Image(systemName: "heart")
                Text("heart")
            }
            Color.yellow.tabItem {
                Image(systemName: "person")
                Text("person")
            }
            
        }
    }
}
