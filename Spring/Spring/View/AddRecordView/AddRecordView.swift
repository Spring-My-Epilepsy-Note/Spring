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
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    // MARK: 발작 여부 체크
                    HStack {
                        Text("발작 여부")
                            .padding(.trailing)
                        
                        Button {
                            isConvulsion = true
                        } label: {
                            Text("Yes")
                                .foregroundColor(Color.accentColor)
                                .padding(5)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color.accentColor, lineWidth: 1))
                        }
                        
                        Button {
                            isConvulsion = false
                        } label: {
                            Text("No")
                                .foregroundColor(Color.accentColor)
                                .padding(5)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color.accentColor, lineWidth: 1))
                        }
                    }
                    
                    // MARK: 발작 기록 추가
                    if isConvulsion {
                        AddConvulsionView()
                            .padding(.top)
                    }
                    
                    // MARK: 기타 건강 기록 메모
                    HealthStateMemoView()
                }
                .navigationTitle("나의 뇌전증 기록 일지")
                .padding(.horizontal, 10)
            }
        }
        .navigationBarItems(trailing: Button {} label: { Text("Save") })
    }
}

struct AddRecordView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecordView()
    }
}
