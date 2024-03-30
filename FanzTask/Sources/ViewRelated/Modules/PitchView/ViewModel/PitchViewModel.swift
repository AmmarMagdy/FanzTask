//
//  PitchViewModel.swift
//  FanzTask
//
//  Created by Ammar.M on 30/03/2024.
//

import Foundation

final class PitchViewModel {
    
    private var coordinator: PlayerCoordinatorContact
    
    init(coordinator: PlayerCoordinatorContact) {
        self.coordinator = coordinator
    }
    
    func showDetails() {
        coordinator.showPlayerDetails()
    }
}
