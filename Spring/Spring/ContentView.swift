//
//  ContentView.swift
//  Spring
//
//  Created by Hyesung Jeon on 2023/05/03.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @State private var tabSelection: Int = 0

    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView()
            .tabItem {
               Image(systemName: "house")
                Text("홈")
            }
            .tag(1)
            ChartView()
            .tabItem {
                Image(systemName: "chart.bar")
                 Text("차트")
            }
            .tag(2)
            MedicineView()
            .tabItem {
                Image(systemName: "alarm")
                 Text("복용시간")
            }
            .tag(3)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
