//
//  ViewController.swift
//  HeroApp2
//
//  Created by Арайлым Кабыкенова on 05.12.2025.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var intellegenceLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var combatLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthLocationLabel: UILabel!
    @IBOutlet weak var firstAppearanceLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    
    @IBOutlet weak var lastView: UIView!
    @IBOutlet weak var powerStatsView: UIView!
    @IBOutlet weak var imageViewBorder: UIView!
    @IBAction func rollButton(_ sender: UIButton) {
        service.fetchData()
    }

    var service=HeroNetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        service.delegate=self
        
    }


}

extension ViewController:HeroNetworkManagerDelegate{
    func update(_ newHero: HeroModel) {
        heroImage.kf.setImage(with: URL(string:newHero.image))
        nameLabel.text=newHero.name
        birthLocationLabel.text=newHero.placeOfBirth
        firstAppearanceLabel.text=newHero.firstAppearance
        //heroImage.image = UIImage(data: newHero.heroImage)
        intellegenceLabel.text="\(newHero.intelligence)"
        powerLabel.text="\(newHero.power)"
        genderLabel.text="\(newHero.gender)"
        speedLabel.text="\(newHero.speed)"
        combatLabel.text="\(newHero.combat)"
        publisherLabel.text=newHero.publisher
    }
    
}
