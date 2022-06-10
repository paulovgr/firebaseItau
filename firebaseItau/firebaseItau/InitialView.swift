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

    private lazy var titleLabel = biuldLabel()
    private lazy var errorLabel = biuldErrorLabel()
    private lazy var loaderIcon = UIActivityIndicatorView()

    
    // MARK: - Life Cycle
    
    init() {
        super.init(frame: .zero)
        setupViews()
        showLoader ()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(titleText: String) {
        titleLabel.text = titleText
        stopLoader ()
    }
    
    
    func showError() {
        errorLabel.isEnabled = true
        errorLabel.fadeIn(duration: 1.0, delay: 1) { _ in
            self.errorLabel.fadeOut()
        }
    }
    
    func showLoader () {
        loaderIcon.startAnimating()
    }
    
    func stopLoader () {
        loaderIcon.stopAnimating()
        loaderIcon.hidesWhenStopped = true
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
        addSubview(loaderIcon)
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
        
        loaderIcon.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.width.height.equalTo(50)
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
