//
//  AuthViewModel.swift
//  FitnessApp
//
//  Created by Sakans on 5.08.2024.
//


import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String?
    @Published var displayName: String?
    @Published var lastLoginDate: Date?

    init() {
        checkUser()
    }

    func checkUser() {
        if let user = Auth.auth().currentUser {
            self.isAuthenticated = true
            self.displayName = user.displayName
            self.lastLoginDate = UserDefaults.standard.object(forKey: "lastLoginDate") as? Date
        } else {
            self.isAuthenticated = false
        }
    }

    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                return
            }
            self?.isAuthenticated = true
            self?.displayName = result?.user.displayName
            self?.saveLoginTime()
        }
    }

    func signUp(name: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                completion(false)
                return
            }
            // Kullanıcı adını güncelleme
            if let user = result?.user {
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = name
                changeRequest.commitChanges { error in
                    if let error = error {
                        print("Failed to update display name: \(error.localizedDescription)")
                        completion(false)
                    } else {
                        self?.isAuthenticated = true
                        self?.displayName = name
                        self?.saveLoginTime()
                        completion(true)
                    }
                }
            } else {
                completion(false)
            }
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            isAuthenticated = false
            displayName = nil
            lastLoginDate = nil
            UserDefaults.standard.removeObject(forKey: "lastLoginDate")
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func saveLoginTime() {
        let currentTime = Date()
        lastLoginDate = currentTime
        UserDefaults.standard.set(currentTime, forKey: "lastLoginDate")
    }

    func has24HoursPassed() -> Bool {
        if let lastLoginTime = lastLoginDate {
            let currentTime = Date()
            let timeInterval = currentTime.timeIntervalSince(lastLoginTime)
            return timeInterval >= 86400 // 24 saat = 86400 saniye
        }
        return true // Eğer daha önce giriş yapılmamışsa, 24 saat geçmiş gibi davran
    }
}
