//
//  AboutView.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 25/8/23.
//

import UIKit

class AboutView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var baseExpTitle: UILabel!
    @IBOutlet weak var baseExpData: UILabel!
    @IBOutlet weak var heightTitle: UILabel!
    @IBOutlet weak var heightData: UILabel!
    @IBOutlet weak var weightTitle: UILabel!
    @IBOutlet weak var weightData: UILabel!
    @IBOutlet weak var AbilitiesTitle: UILabel!
    @IBOutlet weak var AbilitiesData: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("AboutView",
                                 owner: self,
                                 options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        heightTitle.text = "Height"
        weightTitle.text = "Weight"
        AbilitiesTitle.text = "Abilities"
        baseExpTitle.text = "Exp. Base"
    }
    
}

