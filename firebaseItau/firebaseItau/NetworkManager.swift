//
//  NetworkManager.swift
//  firebaseItau
//
//  Created by Paulo Victor Guimaraes Rosa on 09/06/22.
//

import Foundation
import FirebaseRemoteConfig

class NetworkManager {
    var remoteConfig: RemoteConfig!

    func request<InitialModel: Error>(completionHandler: @escaping (Result<InitialModel, Error>) -> Void) {
        let remoteConfig = RemoteConfig.remoteConfig()

    }

}
