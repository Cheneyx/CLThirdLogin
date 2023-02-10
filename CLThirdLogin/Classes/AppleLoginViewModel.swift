//
//  AppleLoginViewModel.swift
//  CLThirdLogin
//
//  Created by Cheney on 2023/2/10.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import AuthenticationServices
class AppleLoginViewModel: NSObject {
    
    var appleLoginSuccess: ((AppleUserInfo) -> ())?
    
    func appleLogin() {
        if #available(iOS 13, *) {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.presentationContextProvider = self
            authorizationController.performRequests()
        }
    }
    
}

/// Apple登录代理
extension AppleLoginViewModel: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    @available(iOS 13.0, *)
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIApplication.shared.windows.last ?? UIWindow()
    }
    
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userIdentifier = appleIDCredential.user
            let familyName = appleIDCredential.fullName?.familyName
            let givenName = appleIDCredential.fullName?.givenName
            let token = appleIDCredential.identityToken
            let email = appleIDCredential.email
            print("Apple登录---->>>userIdentifier: \(userIdentifier),familyName: \(familyName),givenName: \(givenName), token: \(token)")
                appleLoginSuccess?(AppleUserInfo(user: userIdentifier, familyName: familyName, givenName: givenName, identityToken: token, email: email))
        case let passwordCredential as ASPasswordCredential:
            
            let username = passwordCredential.user
            let password = passwordCredential.password
              
            DispatchQueue.main.async {}

        default:
            break
        }
    }
    
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        var errorStr = "登录异常"
        switch error {
        case ASAuthorizationError.canceled:
            errorStr = "用户取消了授权请求"
        case ASAuthorizationError.failed:
            errorStr = "授权请求失败"
        case ASAuthorizationError.invalidResponse:
            errorStr = "授权请求响应无效"
        case ASAuthorizationError.notHandled:
            errorStr = "未能处理授权请求"
        case ASAuthorizationError.unknown:
            errorStr = "授权请求失败未知原因"
        default:
            break
        }
        print("authorizationController ---->>>>>> \(errorStr)")
    }
}

public struct AppleUserInfo {
    var user: String?
    var familyName: String?
    var givenName: String?
    var identityToken: Data?
    var email: String?
    
    init(user: String? = nil, familyName: String? = nil, givenName: String? = nil, identityToken: Data? = nil, email: String? = nil) {
        self.user = user
        self.familyName = familyName
        self.givenName = givenName
        self.identityToken = identityToken
        self.email = email
    }
}
