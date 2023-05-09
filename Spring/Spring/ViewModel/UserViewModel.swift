//
//  UserViewModel.swift
//  Spring
//
//  Created by 이원형 on 2023/05/05.
//

import SwiftUI
import Firebase
import GoogleSignIn
import FirebaseFirestore
import FirebaseAuth


enum LoginState: String {
    case googleLogin = "googleLogin"
    case appleLogin = "appleLogin"
    case logout
}

class UserViewModel: NSObject, ObservableObject {
    
    let database = Firestore.firestore()
    let currentUser = Auth.auth().currentUser
    
    @Published var loginState: LoginState = .logout
    @Published var userInfo: User = User()
    
    
    // MARK: - 자동로그인을 위한 UserDefaults 변수
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "isLoggedIn")
    @AppStorage("loginPlatform") var loginPlatform: String = (UserDefaults.standard.string(forKey: "loginPlatform") ?? "")
    
    override init() {
        super.init()
        if self.isLoggedIn && currentUser != nil {
            self.fetchUserInfo(uid:self.currentUser?.uid ?? "")
            self.loginState = LoginState(rawValue: loginPlatform) ?? .logout
        }
    }
    
    func fetchUserInfo(uid: String) {
        let docRef = database.collection("User").document(uid)
        docRef.getDocument { [weak self] document, error in
            guard let self = self else { return }
            
            if let document = document, document.exists {
                if let data = try? document.data(as: User.self) {
                    DispatchQueue.main.async {
                        self.userInfo = data
                    }
                }
            } else {
                print("정보가 없습니다.")
            }
        }
    }


    func insertUserInFirestore(userEmail: String, userName: String) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Task {
            do {
                let document = try await database.collection("User").document(uid).getDocument()
                
                if document.exists {
                    try database.collection("User").document(uid).setData(from: document.data(as: User.self))
                } else {
                    try await database.collection("User").document(uid).setData([
                        "userEmail" : userEmail,
                        "userNickname" : userName
                    ])
                }
                
                DispatchQueue.main.async {
                    self.fetchUserInfo(uid: uid)
                }
            } catch {
                print("\(#function) 파이어베이스 에러 : \(error.localizedDescription)")
            }
        }
    }

    // MARK: - 구글
    // 구글 로그인
    @MainActor
    func googleLogin() async {
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
        
        // 구글 로그인 로직 실행
        do {
            let googleUserInfo = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController).user
            
            guard
                let idToken = googleUserInfo.idToken?.tokenString else {
                print(#function, "there is no token")
                return
            }
            let accessToken = googleUserInfo.accessToken.tokenString
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            let user = try await Auth.auth().signIn(with: credential).user
            
            self.insertUserInFirestore(userEmail: user.providerData.first?.email ?? "", userName: user.providerData.first?.displayName ?? "")
            
            setUserDefaults(.googleLogin)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    //MARK: - UserDefaults 값 저장
    private func setUserDefaults(_ loginState: LoginState) {
        DispatchQueue.main.async {
            self.loginState = loginState
        }
        if loginState == .logout {
            UserDefaults.standard.set(false, forKey: "isLoggedIn")
        } else {
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
        }
        
        UserDefaults.standard.set(loginState.rawValue, forKey: "loginPlatform")
    }
    
    // MARK: - 로그아웃(공통)
    // 로그인 상태 열거형 변수를 참조하여 해당하는 플랫폼 로그아웃 로직 실행
    func logoutByPlatform() {
        
        switch loginPlatform {
        case "googleLogin", "appleLogin": // 구글, 애플 로그인일때
            do {
                try Auth.auth().signOut()
                
                self.setUserDefaults(.logout)
                
            } catch {
                print("Error signing out: %@", error.localizedDescription)
            }
            
        default: return
        }
    }

    func deleteAllUserData(id: String) async {
        let user = Auth.auth().currentUser
        
        do {
            print("회원정보 삭제중")
            try await user?.delete()
            let _: Void = try await database.collection("User").document(id).delete()
            print("회원정보 삭제완료")
        } catch {
            print("Error deleting user: \(error.localizedDescription)")
        }
    }

    func deleteUser() async {
        print("회원탈퇴 눌림")
        guard let user = Auth.auth().currentUser else {
            return
        }
        
        await deleteAllUserData(id: user.uid)
        logoutByPlatform()
    }

    

}
