//
//  CustomTabBarView.swift
//  CustomTabBar
//
//  Created by shehan karunarathna on 2022-02-17.
//

import SwiftUI

struct CustomTabBarView: View {
    @Namespace private var namespace
    @State var locationSelecton : TabBarItem
    var tabs:[TabBarItem] = [
        .home,
        .favourites,
        .profile
    ]
    @Binding var selectedTab:TabBarItem
    var body: some View {
//        tabBarVaersion1
        tabBarVaersion2
            .onChange(of: selectedTab) { newValue in
                withAnimation (.easeInOut){
                    locationSelecton = newValue
                }
            }
    }
}



extension CustomTabBarView{
    @ViewBuilder
    func tabView(tab:TabBarItem) -> some View{
      return VStack{
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size:10, weight: .semibold, design: .rounded))
            
            
        }
      .foregroundColor(locationSelecton == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth:.infinity)
        .background(locationSelecton == tab ?  tab.color.opacity(0.2) : .clear)
        cornerRadius(10)
    }
    
    private var tabBarVaersion1 : some View {
        HStack{
            ForEach(tabs,id: \.self){
                tabItem in
                tabView(tab: tabItem)
                    .onTapGesture {
                        switchTab(tab: tabItem)
                    }
            }
        }
        .padding(6)
        .background(
            Color.white.ignoresSafeArea(edges: .bottom)
        )
    }
    
    
    private func switchTab(tab:TabBarItem){
//        withAnimation(.easeInOut) {
//            selectedTab = tab
//        }
        selectedTab = tab
       
    }
}

//struct TabBarItem:Hashable{
//    let iconName:String
//    let title:String
//    let color:Color
//}

enum TabBarItem:Hashable{
    case home,favourites, profile, messages
    var iconName : String{
        switch self {
        case .home:
            return "house"
        case .favourites:
            return "heart"
        case .profile:
            return "person"
        case .messages:
            return "message"
        }
    }
    
    var title : String{
        switch self {
        case .home:
            return "Home"
        case .favourites:
            return "Favourites"
        case .profile:
            return "Profile"
        case .messages:
            return "Messages"
        }
    }
    
    
    var color : Color{
        switch self {
        case .home:
            return .red
        case .favourites:
            return .blue
        case .profile:
            return .green
        case .messages:
            return .orange
        }
    }
}

extension CustomTabBarView{
    @ViewBuilder
    func tabView2(tab:TabBarItem) -> some View{
      return VStack{
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size:10, weight: .semibold, design: .rounded))
            
            
        }
      .foregroundColor(locationSelecton == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth:.infinity)
        .background(
            ZStack{
                if locationSelecton == tab {
                    RoundedRectangle(cornerRadius: 10 )
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "back_rect", in: namespace)
                }
            }
        )
        cornerRadius(10)
    }
    
    private var tabBarVaersion2 : some View {
        HStack{
            ForEach(tabs,id: \.self){
                tabItem in
                tabView2(tab: tabItem)
                    .onTapGesture {
                        switchTab(tab: tabItem)
                    }
            }
        }
        .padding(6)
        .background(
            Color.white.ignoresSafeArea(edges: .bottom)
        )
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
        .padding(.horizontal)
    }
}
