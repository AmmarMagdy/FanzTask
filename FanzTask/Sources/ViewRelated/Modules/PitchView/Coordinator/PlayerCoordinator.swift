//
//  PlayerCoordinator.swift
//  FanzTask
//
//  Created by Ammar.M on 30/03/2024.
//

import UIKit

protocol PlayerCoordinatorContact: AnyObject {
    func popViewController()
    func showPlayerDetails()
}

final class PlayerCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
    }
    
    /// Starts the home coordinator and shows the home screen by default.
    func start() {
        showPitchView()
    }
}
extension PlayerCoordinator: PlayerCoordinatorContact {

    func popViewController() {
        navigationController.popViewController(animated: true)
    }

    func showPitchView() {
        let viewModel = PitchViewModel(coordinator: self)
        let viewController = PitchViewViewController(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func showPlayerDetails() {
        let viewModel = PlayerDetailsViewModel(coordinator: self)
        let viewController = PlayerDetailsViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
