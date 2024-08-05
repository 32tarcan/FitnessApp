//
//  AuthViewModel.swift
//  FitnessApp
//
//  Created by Sakans on 5.08.2024.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = UserDefaults.standard.bool(forKey: "isAuthenticated") {
        didSet {
            UserDefaults.standard.set(isAuthenticated, forKey: "isAuthenticated")
        }
    }
    @Published var errorMessage: String?
    @Published var displayName: String?

    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                return
            }
            self?.isAuthenticated = true
            self?.displayName = result?.user.displayName
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
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
