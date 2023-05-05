//
//  LoginView.swift
//  Spring
//
//  Created by 이원형 on 2023/05/05.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        ZStack{
            Color("MainColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20){
                Text("Spring")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text("나의 뇌전증 건강 기록 일지")
                    .font(.title2)
                    .fontWeight(.light)
                    .foregroundColor(.white)
              
                VStack{
                    Button {
                        Task {
                            await userViewModel.googleLogin()
                        }
                    } label: {
                        Text("구글로 로그인")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .frame(width: UIScreen.main.bounds.width * 0.85)
                            .padding(.vertical, 18)
                        
                            .background(alignment:.leading) {
                                Image("GoogleLoginIcon")
                                    .resizable()
                                    .frame(width: 25, height: 25, alignment: .center)
                                    .padding(.leading, 20)
                            }
                        
                    }
                    .background(.white)
                    .cornerRadius(25)
                    
                    Button {
                            print("애플로 로그인 버튼 누름")
                   
                    } label: {
                        Text("애플로 로그인")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .frame(width: UIScreen.main.bounds.width * 0.85)
                            .padding(.vertical, 18)
                        
                            .background(alignment:.leading) {
                                Image("AppleLoginIcon")
                                    .resizable()
                                    .frame(width: 35, height: 50, alignment: .center)
                                    .padding(.leading, 15)
                            }
                        
                    }
                    .background(.black)
                    .cornerRadius(25)
                    
                    
                }
            }
            
          
        }

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
