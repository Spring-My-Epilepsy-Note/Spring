//
//  User.swift
//  Spring
//
//  Created by 이원형 on 2023/05/05.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Hashable, Codable {
    @DocumentID var id: String?
    var userNickname: String = ""
    var userEmail: String =  ""
}
