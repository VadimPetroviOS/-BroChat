//
//  FirestoreManager.swift
//  BROChat
//
//  Created by Вадим on 15.09.2022.
//

import Foundation

class FirestoreManager {

    static let shared = FirestoreManager()

    //let logActionManager = LogActionsManager()
    let signUpManager = SignUpManager()
    let userManager = UserManager()
    //let messageManager = MessageManager()
}
