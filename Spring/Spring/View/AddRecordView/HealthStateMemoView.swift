//
//  HealthStateMemoView.swift
//  Spring
//
//  Created by 이주희 on 2023/05/08.
//

import SwiftUI

struct HealthStateMemoView: View {
    @State private var healthStateText: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("메모 (건강 상태 기록)")
            TextEditor(text: $healthStateText)
                .lineLimit(nil)
                .frame(height: 150)
                .padding()
                .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
            // 글자수 200자 제한
                .onChange(of: healthStateText) { newValue in
                    if newValue.count > 200 {
                        healthStateText = String(newValue.prefix(200))
                    }
                }
        }
    }
}

struct HealthStateMemoView_Previews: PreviewProvider {
    static var previews: some View {
        HealthStateMemoView()
    }
}
