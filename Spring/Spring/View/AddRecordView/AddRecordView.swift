//
//  AddRecordView.swift
//  Spring
//
//  Created by 이주희 on 2023/05/08.
//

import SwiftUI

struct AddRecordView: View {
    @State private var isConvulsion: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                // MARK: 발작 여부 체크
                HStack {
                    Text("발작 여부")
                    
                    Button {
                        isConvulsion = true
                    } label: {
                        Text("Yes")
                    }
                    
                    Button {
                        isConvulsion = false
                    } label: {
                        Text("No")
                    }
                }
                
                // MARK: 발작 기록 추가
                if isConvulsion {
                    AddConvulsionView()
                }
                
                // MARK: 기타 건강 기록 메모
                HealthStateMemoView()
            }
            .navigationTitle("나의 뇌전증 기록 일지")
            .padding(.horizontal, 10)
        }
    }
}

struct AddRecordView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecordView()
    }
}
