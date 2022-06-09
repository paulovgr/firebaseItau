//
//  ViewCodeConfig.swift
//  firebaseItau
//
//  Created by Paulo Victor Guimaraes Rosa on 08/06/22.
//

import Foundation

protocol ViewCode {
    func setupViews()
    func setupViewHierarchy()
    func setupConstraints()
    func setupAditionalConfiguration()
}

extension ViewCode {
    func setupViews() {
        setupViewHierarchy()
        setupConstraints()
        setupAditionalConfiguration()
    }
    
    func setupAditionalConfiguration() { }
}

