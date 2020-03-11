//
//  UIViewController+Navigation.swift
//  Firebase-Auth-Lab
//
//  Created by Maitree Bain on 3/11/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private static func resetWindow(_ rootViewController: UIViewController) {
        guard let scene = UIApplication.shared.connectedScenes.first,
            let sceneDelegate = scene.delegate as? SceneDelegate,
            let window = sceneDelegate.window else {
                fatalError("could not reset window rootViewController")
        }
        window.rootViewController = rootViewController
    }
    
    public static func showViewController(storyboardName: String, viewControllerID: String) {
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let newVC = storyboard.instantiateViewController(withIdentifier: viewControllerID)
        resetWindow(newVC)
    }
    
    public static func showViewController(viewController: UIViewController) {
        resetWindow(viewController)
    }
}
