//
//  ViewController.swift
//  firebaseItau
//
//  Created by Paulo Victor Guimaraes Rosa on 08/06/22.
//

import UIKit
import FirebaseRemoteConfig

class InitialViewController: UIViewController {
    // MARK: - Views
     let initialView = InitialView()
    var remoteConfig: RemoteConfig!
    
    
    
    
    // MARK: - View Life Cycle
    override func loadView() {
        super.loadView()
        self.view = initialView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
        remoteConfig.fetchAndActivate  { [weak self] (status, error)  in
            switch status {
            case .successFetchedFromRemote:
                self?.initialView.setup(titleText: remoteConfig["super_string"].stringValue ?? "")
                    print(remoteConfig["super_string"].stringValue)
                
                
            case .error:
                break
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

