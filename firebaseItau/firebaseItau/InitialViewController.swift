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

    private let initialView = InitialView()
    
    // MARK: - Properties

    private let viewModel = InitialViewModel()
    weak var coordinator: MainCoordinator?
    
    // MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        self.view = initialView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
        viewModel.delegate = self
    }
}

    // MARK: - InitialViewModelDelegate

extension InitialViewController: InitialViewModelDelegate {
    func showTitle(_ model: InitialModel) {
        guard let title = model.title else { return }
        initialView.setup(titleText: title)
    }
}

