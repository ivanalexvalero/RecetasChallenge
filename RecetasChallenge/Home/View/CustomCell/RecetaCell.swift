//
//  RecetaCell.swift
//  RecetasChallenge
//
//  Created by Ivan Valero on 13/09/2022.
//

import UIKit

class RecetaCell: UITableViewCell {

    @IBOutlet weak var imageReceta: UIImageView!
    @IBOutlet weak var titleRecetaLabel: UILabel!
    @IBOutlet weak var descriptionRecetaLabel: UILabel!
    
    static let kId = "RecetaCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }


    func configCell(model: RecipesModel.RecipesJson) {
        
        titleRecetaLabel.text = model.name
        descriptionRecetaLabel.text = model.description
    }
    
}
