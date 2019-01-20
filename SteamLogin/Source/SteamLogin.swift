//
//  SteamLogin.swift
//  SteamLogin
//
//  Created by Serhii Londar on 12/25/18.
//

import Foundation

public class SteamLogin {
    public static var steamApiKey: String = ""
    
    public class func login(from vc: UIViewController, completion: @escaping SteamLoginVCHandler) {
        let loginVC = SteamLoginVC(loginHandler: completion)
        let navigationVC = UINavigationController(rootViewController: loginVC)
        vc.present(navigationVC, animated: true, completion: nil)
    }
}
