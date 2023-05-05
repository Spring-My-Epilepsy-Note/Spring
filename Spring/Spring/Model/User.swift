//
//  User.swift
//  Spring
//
//  Created by 이원형 on 2023/05/05.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
}
