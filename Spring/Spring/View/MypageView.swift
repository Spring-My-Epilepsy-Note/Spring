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
    @State var isPresentedUnregistertAlert: Bool = false

    @State private var logoutButtonTitle: String = "로그아웃"
    @State private var logoutButtonImage: String = "rectangle.portrait.and.arrow.forward"
    @State private var unregisterButtonTitle: String = "회원탈퇴"
    @State private var unregisterButtonImage: String = "x.circle"
    
    var body: some View {
        VStack(alignment: .leading){
            //로그아웃
            Section {
                HStack {
                    Button(action: { isPresentedLogoutAlert = true }) {
                        MyPageButton(buttonTitle: $logoutButtonTitle, buttonImage: $logoutButtonImage)
                        Spacer()
                    }
                }
            }
            Section {
                HStack {
                    Button(action: { isPresentedUnregistertAlert = true }) {
                        MyPageButton(buttonTitle: $unregisterButtonTitle, buttonImage: $unregisterButtonImage)
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
            }else if isPresentedUnregistertAlert {
                unRegisterAlert
            }
        }

        
    
    }//body
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
        private var unRegisterAlert: some View {
            ZStack {
                Rectangle()
                    .foregroundColor(.black.opacity(0.4))
                    .ignoresSafeArea()
                UnregisterAlert(cancelButtonTapped: $isPresentedUnregistertAlert)
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
