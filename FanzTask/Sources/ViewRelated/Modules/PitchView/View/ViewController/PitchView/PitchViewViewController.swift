//
//  PitchViewViewController.swift
//  FanzTask
//
//  Created by Ammar.M on 30/03/2024.
//

import UIKit
import FirebaseRemoteConfig

final class PitchViewViewController: UIViewController {
    
    @IBOutlet private weak var cView: UIView!
    @IBOutlet private weak var vcView: UIView!
    @IBOutlet private weak var stadiumView: UIView!
    @IBOutlet private weak var coinView: UIView!
    @IBOutlet private weak var pointsView: UIView!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var actionsView: UIView!
    @IBOutlet private weak var shareView: UIView!
    @IBOutlet private weak var priceView: UIView!
    @IBOutlet private weak var chirtsView: UIView!
    @IBOutlet private weak var salahView: PlayerView!
    @IBOutlet private weak var ronaldoView: PlayerView!

    var viewModel: PitchViewModel!
   
    // MARK: - init
    required init(viewModel: PitchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentInsetAdjustmentBehavior = .never
        setupViews()
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
    }
    
    func setupViews() {
        coinView.layer.cornerRadius = coinView.frame.height / 2
        pointsView.layer.cornerRadius = pointsView.frame.height / 2
        priceView.layer.cornerRadius = priceView.frame.height / 2
        chirtsView.layer.cornerRadius = chirtsView.frame.height / 2
        actionsView.layer.cornerRadius = actionsView.frame.height / 2
        actionsView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        shareView.layer.cornerRadius = actionsView.frame.height / 2
        shareView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        stadiumView.layer.cornerRadius = 30
        stadiumView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        vcView.layer.cornerRadius = 6
        salahView.configure(with: PlayerView.UIModel(action: { [weak self] in
            self?.viewModel.showDetails()
        }))
        cView.layer.cornerRadius = 6
        ronaldoView.configure(with: PlayerView.UIModel(action: { [weak self] in
            self?.viewModel.showDetails()
        }))
    }
}

