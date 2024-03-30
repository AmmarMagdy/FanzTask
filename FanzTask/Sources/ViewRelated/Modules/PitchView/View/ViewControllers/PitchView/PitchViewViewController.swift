//
//  PitchViewViewController.swift
//  FanzTask
//
//  Created by Ammar.M on 30/03/2024.
//

import UIKit

final class PitchViewViewController: UIViewController {

    @IBOutlet private weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentInsetAdjustmentBehavior = .never
    }
}
