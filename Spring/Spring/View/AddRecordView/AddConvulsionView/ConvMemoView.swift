//
//  ConvulsionMemoView.swift
//  Spring
//
//  Created by 이주희 on 2023/05/08.
//

import SwiftUI

struct ConvMemoView: View {
    @State private var memoText: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("메모 (특이사항, 장소, 상황 등)")
            TextEditor(text: $memoText)
                .lineLimit(nil)
                .frame(height: 150)
                .padding()
                .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
                .onChange(of: memoText) { newValue in
                    if newValue.count > 200 { 
                        memoText = String(newValue.prefix(200))
                    }
                }
        }
    }
}

struct ConvMemoView_Previews: PreviewProvider {
    static var previews: some View {
        ConvMemoView()
    }
}
