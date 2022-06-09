//
//  InitialViewModel.swift
//  firebaseItau
//
//  Created by Paulo Victor Guimaraes Rosa on 08/06/22.
//

import FirebaseRemoteConfig

class InitialViewModel {
    var initialData: InitialModel?
    var remoteConfig: RemoteConfig!

    internal init(viewModel: InitialModel?, remoteConfig: RemoteConfig? = nil) {
        self.initialData = viewModel
        self.remoteConfig = remoteConfig
    }
    
    
    func fetchData() {
        let remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.fetchAndActivate  { [weak self] (status, error)  in
            switch status {
            case .successFetchedFromRemote:
                    print(remoteConfig["super_string"].stringValue)
                
                
            case .error:
                break
            default:
                break
            }
        }
    }
}
