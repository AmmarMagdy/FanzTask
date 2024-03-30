//
//  CardPlayerTableViewCell.swift
//  FanzTask
//
//  Created by Ammar.M on 30/03/2024.
//

import UIKit

final class CardPlayerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        rotate()
    }
    
    func rotate() {
            let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotation.toValue = NSNumber(value: Double.pi * 2)
            rotation.duration = 1
            rotation.isCumulative = true
            rotation.repeatCount = Float.greatestFiniteMagnitude
            cardImageView.layer.add(rotation, forKey: "rotationAnimation")
        }
}
