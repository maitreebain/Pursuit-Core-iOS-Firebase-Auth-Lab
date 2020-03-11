//
//  LogInViewController.swift
//  Firebase-Auth-Lab
//
//  Created by Maitree Bain on 3/10/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit
import FirebaseAuth

enum AccountState {
    case newUser
    case existingUser
}

class LogInViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var miniView: UIView!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var makeAccountButton: UIButton!
    
    private var accountState = AccountState.existingUser
    
    private var authSession = AuthenticationSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        guard let email = emailText.text, !email.isEmpty, let password = passwordText.text, !password.isEmpty else {
            DispatchQueue.main.async {
                self.showAlert(title: "Missing Fields", message: "Please enter your e-mail/password")
            }
            return
        }
        continueLogin(email: email, password: password)
    }
    
    private func continueLogin(email: String, password: String) {
        
        if accountState == .existingUser {
            authSession.signExistingUser(email: email, password: password) { [weak self] (result) in
                
                switch result {
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.showAlert(title: "Error Signing In", message: "\(error.localizedDescription)")
                    }
                case .success:
                    self?.navigateToProfile()
                }
            }
        } else {
            authSession.createNewUser(email: email, password: password) { [weak self] (result) in
                
                switch result {
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.showAlert(title: "Error Creating Account", message: "\(error.localizedDescription)")
                    }
                case .success:
                    self?.navigateToProfile()
                }
            }
        }
    }
    
    private func navigateToProfile() {
        UIViewController.showViewController(storyboardName: "ProfileView", viewControllerID: "ProfileViewController")
    }
    
    @IBAction func accountButtonPressed(_ sender: UIButton) {
        
        accountState = accountState == .existingUser ? .newUser : .existingUser
        
        if accountState == .existingUser{
            UIView.transition(with: miniView, duration: 0.6, options: [.transitionCrossDissolve], animations: {
                self.logInButton.setTitle("Log In", for: .normal)
                self.accountLabel.text = "Don't have an account?"
                self.makeAccountButton.setTitle("Sign Up", for: .normal)
            }, completion: nil)
        } else {
            UIView.transition(with: miniView, duration: 0.6, options: [.transitionCrossDissolve], animations: {
                self.logInButton.setTitle("Sign Up", for: .normal)
                self.accountLabel.text = "Have an account?"
                self.makeAccountButton.setTitle("Log In", for: .normal)
            }, completion: nil)
        }
        
    }
    
    
}
