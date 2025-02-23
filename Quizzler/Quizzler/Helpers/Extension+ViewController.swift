//
//  Extension+ViewController.swift
//  Quizzler
//
//  Created by Artem Kriukov on 05.02.2025.
//

import Foundation
import SnapKit

extension ViewController {
    func setViews() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(questionLabel)
        mainStackView.addArrangedSubview(trueButton)
        mainStackView.addArrangedSubview(falseButton)
        mainStackView.addArrangedSubview(progressBar)
        
        view.addSubview(backgroundImage)
    }
    
    func setupConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        

        
        trueButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(80)
        }
        
        falseButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(80)
        }
        
        backgroundImage.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(0)
        }
    }
}
