//
//  PlayerDetailsViewModel.swift
//  FanzTask
//
//  Created by Ammar.M on 30/03/2024.
//

import Foundation

final class PlayerDetailsViewModel {
    
    private var coordinator: PlayerCoordinatorContact
    
    init(coordinator: PlayerCoordinatorContact) {
        self.coordinator = coordinator
    }
    
    func popViewController() {
        coordinator.popViewController()
    }
}
