//
//  InitialView.swift
//  firebaseItau
//
//  Created by Paulo Victor Guimaraes Rosa on 08/06/22.
//

import UIKit
import SnapKit

class InitialView: UIView {
    
    // MARK: - Properties

    lazy var titleLabel = biuldLabel()
    
    // MARK: - Life Cycle
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(titleText: String) {
        titleLabel.text = titleText
    }
    
    
}
    // MARK: - View Builders

extension InitialView {
    func biuldLabel() -> UILabel {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

    // MARK: - ViewCode

extension InitialView: ViewCode {
    func setupViewHierarchy() {
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            
        }
    }
    
    
}
