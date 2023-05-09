//
//  MypageButton.swift
//  Spring
//
//  Created by 이원형 on 2023/05/06.
//

import SwiftUI

struct MyPageButton: View {
    @Binding var buttonTitle : String
    @Binding var buttonImage : String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: buttonImage)
            
            Text(buttonTitle)
                .font(.title3)
                .fontWeight(.semibold)

        }
        .foregroundColor(.primary)
        .frame(minHeight: 30, maxHeight: 58)
    }
}

