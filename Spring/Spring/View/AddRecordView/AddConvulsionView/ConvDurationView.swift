//
//  ConvDurationView.swift
//  Spring
//
//  Created by 이주희 on 2023/05/08.
//

import SwiftUI
import Combine

struct ConvDurationView: View {
    @State var convulsionDuration: String = ""
    
    var body: some View {
        HStack {
            Text("발작지속시간")
            TextField("", text: $convulsionDuration)
                .keyboardType(.numberPad)
                .onReceive(Just(convulsionDuration)) { newValue in
                    // 숫자만 입력하게 제한
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.convulsionDuration = filtered
                    }
                    // 글자수 3자로 제한
                    if convulsionDuration.count > 3 {
                        let index = convulsionDuration.index(convulsionDuration.startIndex, offsetBy: 3)
                        self.convulsionDuration = String(convulsionDuration.prefix(upTo: index))
                    }
                }
                .padding(5)
                .overlay(Rectangle().stroke(Color.accentColor, lineWidth: 1))
                .frame(width: 70)
            Text("분")
        }
    }
}

struct ConvDurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConvDurationView()
    }
}
