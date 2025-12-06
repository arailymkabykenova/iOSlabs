//
//  ViewController.swift
//  HeroApp2
//
//  Created by Арайлым Кабыкенова on 05.12.2025.
//

import UIKit
import Kingfisher
protocol UIViewExtension{
    func updateUI(_ object:UIView)
}
class ViewController: UIViewController {
    let randomColors: [UIColor] = [
        .systemBlue,
        .systemTeal,
        .systemIndigo,
        .systemPurple,
        .systemPink,
        .systemOrange,
        .systemYellow,
        .systemGreen,
        .systemMint,
        .systemCyan,
        .systemRed
    ]
    @IBOutlet var mainBackView: UIView!
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
    @IBOutlet var propertyImages: [UIImageView]!
    @IBOutlet var propertyViews: [UIView]!
   
    @IBOutlet weak var powerStatsView: UIView!
    @IBOutlet weak var imageViewBorder: UIView!
    
    @IBOutlet weak var lastView: UIView!
    
    @IBOutlet weak var rollButton: UIButton!
    @IBAction func rollButton(_ sender: UIButton) {
        service.fetchData()
        propertyUpdate()
    }

    var service=HeroNetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        service.delegate=self
        changeUI()
        setFirstHero()
    }
    func changeUI(){
        updateUI(imageViewBorder )
        imageViewBorder.backgroundColor = .black
        updateUI(heroImage )
        updateUI(powerStatsView )
        updateUI(lastView )
        updateUI(rollButton)
        updateUI(mainBackView)
        updateUI(nameLabel)
        updateUI(birthLocationLabel)
        updateUI(firstAppearanceLabel)
        updateUI(publisherLabel)
        updateUI(intellegenceLabel)
        updateUI(speedLabel)
        updateUI(genderLabel)
        updateUI(powerLabel)
        updateUI(combatLabel)
        for property in propertyViews{
            updateUI(property)
        }
        updateUI(heroImage)
    }


}

extension ViewController:HeroNetworkManagerDelegate{
    func update(_ newHero: HeroModel) {
        heroImage.kf.setImage(with: URL(string:newHero.image))
        nameLabel.text="Name:\(newHero.name)"
        birthLocationLabel.text="Born in :\(newHero.placeOfBirth)"
        firstAppearanceLabel.text="First appear in:\(newHero.firstAppearance)"
        //heroImage.image = UIImage(data: newHero.heroImage)
        intellegenceLabel.text="\(newHero.intelligence)"
        powerLabel.text="\(newHero.power)"
        genderLabel.text="\(newHero.gender)"
        speedLabel.text="\(newHero.speed)"
        combatLabel.text="\(newHero.combat)"
        publisherLabel.text="Publisher:\(newHero.publisher)"
        storeLocally(newHero)
    }
    func storeLocally(_ heroData:HeroModel){
        let heroData=try? PropertyListEncoder().encode(heroData)
        UserDefaults.standard.set(heroData, forKey: "hero")
        print("hero saved")
    }
    func setFirstHero(){
        guard let firstHeroData=UserDefaults.standard.data(forKey: "hero"),
              let heroModel=try? PropertyListDecoder().decode(HeroModel.self,from:firstHeroData)
                else{
            print("not find hero model")
            return}
        update(heroModel)
    }
}
extension ViewController:UIViewExtension{
    func updateUI(_ object:UIView) {
        object.layer.cornerRadius=10
        object.layer.masksToBounds=true
        //object.backgroundColor = .
        
    }
    
    func propertyUpdate(){
        for image in propertyImages{
            image.tintColor=randomColors.randomElement()!
        }

    }
}
