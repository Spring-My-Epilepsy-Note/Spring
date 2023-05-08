//
//  LogoutAlert.swift
//  Spring
//
//  Created by 이원형 on 2023/05/06.
//

import SwiftUI

struct UnregisterAlert: View {
    @EnvironmentObject var userViewModel: UserViewModel

    
    @Binding var cancelButtonTapped: Bool
    var body: some View {
        
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .frame(height: 160)
            VStack {
                Text("Spring에서 탈퇴 하시겠습니까?")
                    .font(.body)
                    .fontWeight(.semibold)

                    .padding(25)
                    .padding(.top, 10)

                HStack {
                    Button {
                        cancelButtonTapped = false
                    } label: {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 100, height: 50)
                            .foregroundColor(Color("Silver"))
                            .overlay {
                                Text("취소")
                                    .foregroundColor(.white)
                                    .font(.callout)
                                    .fontWeight(.semibold)
                            }
                    }
                    .padding(.trailing, 18)
                    
                    
                    Button {
                        Task{
                            await userViewModel.deleteUser()
                        }
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 100, height: 50)
                            .foregroundColor(.red)
                            .overlay {
                                Text("탈퇴")
                                    .foregroundColor(.white)
                                    .font(.callout)
                                    .fontWeight(.semibold)
                            }
                    }
                    
                    
                }
            }
        } // ZStack
        .frame(height: 200)
    }
    

    
}


