//
//  ProdromalSymptomsView.swift
//  Spring
//
//  Created by 이주희 on 2023/05/08.
//

import SwiftUI

struct ProdromalSymptomsView: View {
    // TODO: 나중에 다른 파일에서 관리
    let symptomsList: [String] = ["멍때림", "오심", "어지러움", "악취", "시각적 변화", "청각적 변화", "감각적 변화"]
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        HStack {
            Text("전조 증상")
            // Picker는 다중 선택 지원 안함
            Picker(selection: $selectedIndex, label: Text("증상 선택")) {
                ForEach(symptomsList.indices, id: \.self, content: { index in
                    Text("\(symptomsList[index])").tag(index)
                })
            }
        }
        
    }
}

struct ProdromalSymptomsView_Previews: PreviewProvider {
    static var previews: some View {
        ProdromalSymptomsView()
    }
}
