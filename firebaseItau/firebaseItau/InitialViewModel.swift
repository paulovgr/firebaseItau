//
//  InitialViewModel.swift
//  firebaseItau
//
//  Created by Paulo Victor Guimaraes Rosa on 08/06/22.
//

import FirebaseRemoteConfig

protocol InitialViewModelDelegate: AnyObject{
    func showTitle(model: InitialModel)
}

class InitialViewModel {
    var remoteConfig: RemoteConfig?
    weak var delegate: InitialViewModelDelegate?
    
    
    func fetchData() {
        let remoteConfig = RemoteConfig.remoteConfig()
        // RETIRAR
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings

        remoteConfig.fetchAndActivate  { [weak self] (status, error)  in
            guard let self = self else { return }
            switch status {
            case .successFetchedFromRemote:
                guard let string = remoteConfig.configValue(forKey: "super_string").stringValue else { return }
                self.delegate?.showTitle(model: InitialModel(title: string))
            case .error:
                break;
            default:
                break
            }
        }
    }
    
    func loadDefaultValues(_ remoteConfig: RemoteConfig) {
      let appDefaults: [String: Any?] = [
        "super_string": "#FBB03B"
      ]
        remoteConfig.setDefaults(appDefaults as? [String: NSObject])
    }
}
