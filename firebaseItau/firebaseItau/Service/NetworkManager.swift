//
//  NetworkManager.swift
//  firebaseItau
//
//  Created by Paulo Victor Guimaraes Rosa on 09/06/22.
//

import Foundation
import FirebaseRemoteConfig

class NetworkManager {
    let remoteConfig = RemoteConfig.remoteConfig()

    init() {
        loadDefaultValues(remoteConfig)
    }
    
    func request(completionHandler: @escaping (Result<InitialModel, Error>) -> Void) {
        let remoteConfig = RemoteConfig.remoteConfig()
        
        remoteConfig.fetchAndActivate  { [weak self] (status, error)  in
            guard let self = self else { return }
            guard let string = self.remoteConfig.configValue(forKey: "super_string").stringValue else { return }
            completionHandler(.success(InitialModel(title: string)))
            if status == .error {
                guard let error = error else { return  }
                completionHandler(.failure(error))
            }
        }
    }
    
    func loadDefaultValues(_ remoteConfig: RemoteConfig) {
      let appDefaults: [String: Any?] = [
        "super_string": "Bem Vindo!"
      ]
        remoteConfig.setDefaults(appDefaults as? [String: NSObject])
    }

}
