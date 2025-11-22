//
//  DetailViewController.swift
//  FavouritesManager
//
//  Created by Арайлым Кабыкенова on 22.11.2025.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var objectImage: UIImageView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var backImage: UIImageView!
    var favObject:FavObject?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let favObject = favObject {
            titleLabel.text = favObject.objectTitle
            subtitleLabel.text = favObject.objectSubtitle
            objectImage.image = favObject.objectImage
            reviewLabel.text = favObject.review
            backImage.image = UIImage(resource:.back)
            // Do any additional setup after loading the view.
        }
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
