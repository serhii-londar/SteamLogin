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
public let defaultNavigationBarColor = UIColor(red: 23.0 / 255.0, green: 26.0 / 255.0, blue: 32.0 / 255.0, alpha: 1.0)

public class SteamLoginVC: UIViewController {
    enum Strings: String {
        case cancel = "Cancel"
        case loginToSteam = "Login to Steam"
        case initError = "init(coder:) has not been implemented"
    }
    
    var loginWebView: WKWebView!
    
    var loginHandler: SteamLoginVCHandler
    var navigationBarColor: UIColor
    
    public class func login(from vc: UIViewController, navigationBarColor: UIColor = defaultNavigationBarColor, completion: @escaping SteamLoginVCHandler) {
        let loginVC = SteamLoginVC(loginHandler: completion, navigationBarColor: navigationBarColor)
        let navigationVC = UINavigationController(rootViewController: loginVC)
        vc.present(navigationVC, animated: true, completion: nil)
    }
    
    public init(loginHandler: @escaping SteamLoginVCHandler, navigationBarColor: UIColor = defaultNavigationBarColor) {
        self.loginHandler = loginHandler
        self.navigationBarColor = navigationBarColor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Strings.initError.rawValue)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.addWebView()
        self.addCancelButton()
        self.setupNavigationBar()
        self.title = Strings.loginToSteam.rawValue
    }
    
    func addCancelButton() {
        let cancelButton = UIButton()
        cancelButton.setTitle(Strings.cancel.rawValue, for: .normal)
        cancelButton.sizeToFit()
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cancelButton)
    }
    
    func addWebView() {
        loginWebView = WKWebView(frame: self.view.frame)
        loginWebView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loginWebView)
        
        let topConstraint = NSLayoutConstraint(item: loginWebView!, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        topConstraint.isActive = true
        self.view.addConstraint(topConstraint)
        let leftConstraint = NSLayoutConstraint(item: loginWebView!, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0)
        leftConstraint.isActive = true
        self.view.addConstraint(leftConstraint)
        let bottomConstraint = NSLayoutConstraint(item: loginWebView!, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0)
        bottomConstraint.isActive = true
        self.view.addConstraint(bottomConstraint)
        let rightConstraint = NSLayoutConstraint(item: loginWebView!, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0)
        rightConstraint.isActive = true
        self.view.addConstraint(rightConstraint)
        
        loginWebView.navigationDelegate = self
        loginWebView.load(URLRequest(url: URL(string: STEAM_MOBILE_LOGIN_URL)!))
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = navigationBarColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
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
        } else {
            decisionHandler(.allow)
        }
    }
    
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        loginHandler(nil, error)
        dismiss(animated: true, completion: nil)
    }
}
