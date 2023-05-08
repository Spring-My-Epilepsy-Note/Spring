//
//  ConvulsionTriggerView.swift
//  Spring
//
//  Created by 이주희 on 2023/05/08.
//

import SwiftUI

struct ConvTriggerView: View {
    // TODO: 나중에 다른 파일에서 관리
    let triggerList: [String] = ["약물 미복용", "술", "수면부족", "불규칙한 수면", "스트레스", "긴장", "강한 광자극(TV, PC 등)", "약물 복용(감기약 등)", "호르몬 변화", "고열", "감기", "기타", "모르겠음"]
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        HStack {
            Text("발작 유발 요인")
            // Picker는 다중 선택 지원 안함
            Picker(selection: $selectedIndex, label: Text("요인 선택")) {
                ForEach(triggerList.indices, id: \.self, content: { index in
                    Text("\(triggerList[index])").tag(index)
                })
            }
        }
    }
}

struct ConvTriggerView_Previews: PreviewProvider {
    static var previews: some View {
        ConvTriggerView()
    }
}
