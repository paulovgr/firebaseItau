//
//  InitialViewModel.swift
//  firebaseItau
//
//  Created by Paulo Victor Guimaraes Rosa on 08/06/22.
//

import FirebaseRemoteConfig

protocol InitialViewModelDelegate: AnyObject{
    func showTitle(_ model: InitialModel)
}

class InitialViewModel {
    weak var delegate: InitialViewModelDelegate?
    private let networkManager = NetworkManager()
    
    func fetchData() {
        networkManager.request { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.delegate?.showTitle(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
