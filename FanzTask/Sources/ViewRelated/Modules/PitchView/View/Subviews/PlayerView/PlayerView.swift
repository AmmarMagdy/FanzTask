//
//  PlayerView.swift
//  FanzTask
//
//  Created by Ammar.M on 30/03/2024.
//

import UIKit

final class PlayerView: NibLoadingView {
        
    private var performAction: (() -> Void)?

    func configure(with model: UIModel) {
        performAction = model.action
    }
    
    @IBAction func showDetails(_ sender: UIButton) {
        performAction?()
    }
}
// MARK: - UIModel
extension PlayerView {
    struct UIModel {
        let action: () -> Void
    }
}
