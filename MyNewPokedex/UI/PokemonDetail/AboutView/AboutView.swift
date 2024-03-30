//
//  AboutView.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 25/8/23.
//

import UIKit

final class AboutView: UIView {
    
    // MARK: Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var baseExpTitle: UILabel!
    @IBOutlet weak var baseExpData: UILabel!
    @IBOutlet weak var heightTitle: UILabel!
    @IBOutlet weak var heightData: UILabel!
    @IBOutlet weak var weightTitle: UILabel!
    @IBOutlet weak var weightData: UILabel!
    @IBOutlet weak var AbilitiesTitle: UILabel!
    @IBOutlet weak var AbilitiesData: UILabel!
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    // MARK: config
    private func commonInit() {
        Bundle.main.loadNibNamed("AboutView",
                                 owner: self,
                                 options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        heightTitle.text = "Height"
        heightTitle.textColor = .systemGray2
        weightTitle.text = "Weight"
        weightTitle.textColor = .systemGray2
        AbilitiesTitle.text = "Abilities"
        AbilitiesTitle.textColor = .systemGray2
        baseExpTitle.text = "Exp. Base"
        baseExpTitle.textColor = .systemGray2
    }
}
