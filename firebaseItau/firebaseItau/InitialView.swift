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
    lazy var errorLabel = biuldErrorLabel()

    
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
    
    
    func showError() {
        errorLabel.isEnabled = true
        errorLabel.fadeIn(duration: 1.0, delay: 1) { _ in
            self.errorLabel.fadeOut()
        }
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
    
    func biuldErrorLabel() -> UILabel {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.alpha = 0.0
        label.text = "Erro ao atualizar"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

    // MARK: - ViewCode

extension InitialView: ViewCode {
    func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(errorLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self).offset(-30)
        }
        
    }
    
    
}

extension UIView {
    func fadeIn(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
            }, completion: completion)
        
    }
    
    func fadeOut(duration: TimeInterval = 1.0, delay: TimeInterval = 1.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
            }, completion: completion)
    }
}
