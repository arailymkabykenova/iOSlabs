//
//  FavouriteTableViewCell.swift
//  FavouritesManager
//
//  Created by Арайлым Кабыкенова on 21.11.2025.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var favImageView: UIImageView!
    @IBOutlet weak var reviewLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
            favImageView.layer.cornerRadius = 10
            favImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(favObject:FavObject){
        titleLabel.text=favObject.objectTitle
        descriptionLabel.text=favObject.objectSubtitle
        favImageView.image=favObject.objectImage
        reviewLabel.text=favObject.review
    }

}
