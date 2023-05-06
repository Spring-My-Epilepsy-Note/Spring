//
//  MypageView.swift
//  Spring
//
//  Created by 이원형 on 2023/05/06.
//

import SwiftUI

struct MypageView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State var isPresentedLogoutAlert: Bool = false
    @State private var logoutButtonTitle: String = "로그아웃"
    @State private var logoutButtonImage: String = "x.circle"
    
    var body: some View {
        VStack(alignment: .leading){
            Section {
                HStack {
                    Button(action: { isPresentedLogoutAlert = true }) {
                        MyPageButton(buttonTitle: $logoutButtonTitle, buttonImage: $logoutButtonImage)
                        Spacer()
                    }
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 30)
        .overlay {
            if isPresentedLogoutAlert {
                logoutAlert
            }
        }
    }
        private var logoutAlert: some View {
                ZStack {
                    Rectangle()
                        .foregroundColor(.black.opacity(0.4))
                        .ignoresSafeArea()
                    LogoutAlert(cancelButtonTapped: $isPresentedLogoutAlert)
                        .padding(.horizontal, 45)
                }
                .transition(AnyTransition.opacity.animation(.easeOut(duration: 0.3)))
            }

    }


//struct MypageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MypageView()
//    }
//}
