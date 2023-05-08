//
//  AddConvulsionView.swift
//  Spring
//
//  Created by 이주희 on 2023/05/08.
//

import SwiftUI

struct AddConvulsionView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // MARK: 1. 발작 지속 시간 입력 뷰 2. 전조 증상 선택 뷰 3. 특이사항 메모 뷰 4. 발작 유발 요인 선택 뷰
            ConvDurationView()
            ProdromalSymptomsView()
            ConvulsionMemoView()
            ConvulsionTriggerView()
            
            Divider()
            
            Button {
                // TODO: 버튼을 누를 때마다 인덱스를 늘려주고
                // TODO: AddRecordView에서 인덱스만큼 AddConvulsionView 호출
            } label: {
                Text(" + 발작 기록 추가하기 ")
                    .foregroundColor(.black)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.accentColor))
        }
    }
}

struct AddConvulsionView_Previews: PreviewProvider {
    static var previews: some View {
        AddConvulsionView()
    }
}
