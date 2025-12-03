//
//  ViewController.swift
//  HeroApp
//
//  Created by Арайлым Кабыкенова on 28.11.2025.
//

import UIKit
protocol UIViewExtension{
    func initialUI(object:UIView)
}
protocol HeroServiceDelegate:AnyObject{
    func didHeroUpdate(_ heroManager:HeroNetworkManager,_ model:HeroModel)
}
class ViewController: UIViewController {

    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var intellegenceLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var combatLabel: UILabel!
   
    @IBOutlet weak var characteristicView: UIView!
   
    @IBOutlet weak var genderImage: UIImageView!
    @IBOutlet weak var nameStackView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstAppearance: UILabel!
    
    @IBOutlet weak var propertyView: UIView!
    @IBOutlet weak var propertySecond: UIView!
    @IBOutlet weak var propertyThird: UIView!
    @IBOutlet weak var propertyFifth: UIView!
    @IBOutlet weak var propertyFourth: UIView!
    
    @IBOutlet weak var rollButton: UIButton!
    @IBAction func randomButton(_ sender: UIButton) {
        let randomId = Int.random(in: 1...563)
        print(randomId)
        service.fetchData(randomId)
        print(service.fetchData(randomId))
    }
    var service=HeroNetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        service.delegate=self
        updateUI()
        print(service.fetchData(1))
        // Do any additional setup after loading the view.
    }
   
    func updateUI(){
        initialUI(object:imageView )
        imageView.backgroundColor = .black
        initialUI(object:heroImage )
        initialUI(object:propertyView )
        initialUI(object:rollButton )
        initialUI(object:characteristicView )
        characteristicView.backgroundColor = UIColor(resource: .yellow)
        initialUI(object:nameLabel )
        initialUI(object:firstAppearance )

        
    }
}
extension ViewController:UIViewExtension{
    func initialUI(object: UIView) {
        object.layer.cornerRadius = 10
        object.clipsToBounds = true
    }
    
    
}
extension ViewController:HeroServiceDelegate{
    func didHeroUpdate(_ heroManager: HeroNetworkManager, _ model: HeroModel) {
        heroImage.image = UIImage(data: model.heroImage)
        intellegenceLabel.text="\(model.heroIntelligence)"
        strengthLabel.text="\(model.heroPower)"
        if model.heroGender != "Male"{
            genderImage.tintColor = .red
        }else{
            genderImage.tintColor = .blue
        }
        genderLabel.text="\(model.heroGender)"
        speedLabel.text="\(model.heroSpeed)"
        combatLabel.text="\(model.heroCombat)"
        nameLabel.text="Hero name:\(model.heroName)"
        firstAppearance.text="Born in:\(model.heroBirthLocation)"
        
    }
    
    
}
