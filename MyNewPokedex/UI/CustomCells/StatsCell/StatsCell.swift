//
//  statsCell.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 24/8/23.
//

import UIKit

class StatsCell: UITableViewCell {
    // MARK: outlets
    @IBOutlet weak var statLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        statLabel.textColor = .systemGray2
    }

    override func setSelected(_ selected: Bool,
                              animated: Bool) {
        super.setSelected(selected,
                          animated: animated)
    }
}

extension StatsCell {
    // MARK: change name stats
    func reduceText(){
        if statLabel.text == "Special-attack"{
            statLabel.text = "Sp. Atk"
        }
        if statLabel.text == "Special-defense"{
            statLabel.text = "Sp. Def"
        }
    }
    
    // MARK: Color of progress
    func statProgress(number: Int) {
        progressView.progress = Float(number)/100
        if number <= 25 {
            progressView.tintColor = .yellow
        } else if number <= 50 {
            progressView.tintColor = .blue
        } else if number <= 75 {
            progressView.tintColor = .green
        } else if number <= 90 {
            progressView.tintColor = .orange
        } else if number <= 100 {
            progressView.tintColor = .red
        } else {
            progressView.tintColor = .systemRed
        }
    }
}
