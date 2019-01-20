//
//  ViewController.swift
//  Example
//
//  Created by Serhii Londar on 12/15/17.
//  Copyright © 2017 slon. All rights reserved.
//

import UIKit
import SteamLogin

class ViewController: UIViewController {
    var steamUser: SteamUser? = nil
    
    override func viewDidAppear(_ animated: Bool) {
        SteamLogin.steamApiKey = "160A1E87653E30D9562DE9E5A47386E5"
        self.steamUser = SteamUser.loadUser()
        if steamUser == nil {
            SteamLoginVC.login(from: self) { [weak self] (user, error) in
                guard let self = self else { return }
                if let user = user {
                    self.steamUser = user
                    self.steamUser?.save()
                    self.perform(#selector(self.showSuccessAlert), with: nil, afterDelay: 1)
                } else {
                    self.showErrorAlert(error)
                }
            }
        } else {
            self.perform(#selector(self.showSuccessAlert), with: nil, afterDelay: 1)
        }
    }
    
    @objc func showSuccessAlert() {
        let alert = UIAlertController(title: "Success", message: "Welcome \(steamUser?.steamVanityID ?? "").\n  Your steamID32 is : \(steamUser?.steamID32 ?? ""). \n Your steamID64 is : \(steamUser?.steamID64 ?? "").", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showErrorAlert(_ error: Error?) {
        let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

