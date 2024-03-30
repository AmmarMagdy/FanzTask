//
//  PlayerDetailsViewController.swift
//  FanzTask
//
//  Created by Ammar.M on 30/03/2024.
//

import UIKit

private enum PlayerDetailsSections {
    case cardPlayer
    case playerInfo
    case cardInfo
    case lastMatch
    case nextMatch
    case totalReward
}
final class PlayerDetailsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var sections: [PlayerDetailsSections] = [.cardPlayer, .playerInfo, .cardInfo, .lastMatch, .nextMatch]
    private var lastContentOffset: CGFloat = 0
    var viewModel: PlayerDetailsViewModel!
    
    // MARK: - init
    required init(viewModel: PlayerDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func back(_ sender: UIButton) {
        viewModel.popViewController()
    }
}
extension PlayerDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch sections[indexPath.section] {
        case .cardPlayer:
            let cell = tableView.cell(type: CardPlayerTableViewCell.self, indexPath)
            return cell
        case .playerInfo:
            let cell = tableView.cell(type: PlayerInfoTableCell.self, indexPath)
            return cell
        case .cardInfo:
            let cell = tableView.cell(type: CardInfoTableCell.self, indexPath)
            return cell
        case .lastMatch:
            let cell = tableView.cell(type: LastMatchTableViewCell.self, indexPath)
            return cell
        case .totalReward:
            let cell = tableView.cell(type: TotalRewardsTableCell.self, indexPath)
            return cell
        case .nextMatch:
            let cell = tableView.cell(type: NextMatchTableCell.self, indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 42))
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 42
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let indexPath = IndexPath(row: 0, section: 0)
        guard let cell = (scrollView as? UITableView)?.cellForRow(at: indexPath) as? CardPlayerTableViewCell else { return }
        if (self.lastContentOffset > scrollView.contentOffset.y) {
            // move up
            cell.cardImageView.transform = CGAffineTransform(rotationAngle: 90)
        }
        else if (self.lastContentOffset < scrollView.contentOffset.y) {
            // move down
            cell.cardImageView.transform = CGAffineTransform(rotationAngle: 0)
        }
        
        // update the new position acquired
        self.lastContentOffset = scrollView.contentOffset.y
        print(lastContentOffset)
    }
}
