//
//  ProfileViewController.swift
//  Firebase-Auth-Lab
//
//  Created by Maitree Bain on 3/11/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var displayName: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    
    @IBOutlet weak var addressText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func updateUI() {
        guard let user = Auth.auth().currentUser else {
            return
        }
        
        displayName.text = user.displayName
    }

}
