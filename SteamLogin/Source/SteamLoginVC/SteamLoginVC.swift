//
//  SteamLoginVC.swift
//  SteamKit
//
//  Created by Serhii Londar on 12/15/17.
//  Copyright © 2017 slon. All rights reserved.
//

import Foundation
import WebKit

public typealias SteamLoginVCHandler = (_ user: SteamUser?, _ error: Error?) -> Void

private let STEAM_MOBILE_LOGIN_URL = "https://steamcommunity.com/mobilelogin"

public class SteamLoginVC: UIViewController {
    var loginWebView: WKWebView!
    
    var loginHandler: SteamLoginVCHandler
    
    public class func login(from vc: UIViewController, completion: @escaping SteamLoginVCHandler) {
        let loginVC = SteamLoginVC(loginHandler: completion)
        let navigationVC = UINavigationController(rootViewController: loginVC)
        vc.present(navigationVC, animated: true, completion: nil)
    }
    
    public init(loginHandler: @escaping SteamLoginVCHandler) {
        self.loginHandler = loginHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        let lCancel = UIButton()
        lCancel.setTitle("Cancel", for: .normal)
        lCancel.sizeToFit()
        lCancel.addTarget(self, action: #selector(self.cancel), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: lCancel)
        loginWebView = WKWebView(frame: self.view.frame)
        loginWebView.navigationDelegate = self
        loginWebView.load(URLRequest(url: URL(string: STEAM_MOBILE_LOGIN_URL)!))
    }
    
    @objc public func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension SteamLoginVC: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        if ((url?.absoluteString as NSString?)?.range(of: "steamcommunity.com/profiles/"))?.location != NSNotFound {
            let urlComponents = url?.absoluteString.components(separatedBy: "/")
            let potentialID: String = urlComponents![4]
            let lUser = SteamUser(steamID64: potentialID)
            loginHandler(lUser, nil)
            dismiss(animated: true, completion: nil)
            decisionHandler(.cancel)
        } else if ((url?.absoluteString as NSString?)?.range(of: "steamcommunity.com/id/"))?.location != NSNotFound {
            let urlComponents = url?.absoluteString.components(separatedBy: "/")
            let potentialVanityID: String = urlComponents![4]
            let lUser = SteamUser(steamVanityID: potentialVanityID)
            loginHandler(lUser, nil)
            dismiss(animated: true, completion: nil)
            decisionHandler(.cancel)
        }
        decisionHandler(.allow)
    }
}
