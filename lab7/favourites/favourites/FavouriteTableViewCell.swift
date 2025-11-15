//
//  FavouriteTableViewCell.swift
//  favourites
//
//  Created by Арайлым Кабыкенова on 15.11.2025.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var favImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(favObject:FavouriteItem){
        titleLabel.text=favObject.objectTitle
        subtitleLabel.text=favObject.objectSubtitle
        reviewLabel.text=favObject.review
        favImageView.image=favObject.objectImage
        
    }
}
