//
//  HomeView.swift
//  Spring
//
//  Created by 이원형 on 2023/05/04.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var userName: String{
        "\(userViewModel.userInfo.userNickname)님\n"
    }

    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 10){
                Text("안녕하세요. \(userName) \(userViewModel.loginState.rawValue)")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(
                            destination: MypageView()
                                .environmentObject(userViewModel),
                            label: {
                                Label("MyPage", systemImage: "person.fill")
                                    .font(.title3)
                                    .foregroundColor(.gray)
                                    .padding([.top,.leading,.trailing])
                            })
                    }
                }

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
