//
//  ViewController.swift
//  RandomizerApp
//
//  Created by Арайлым Кабыкенова on 23.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var flowerImage: UIImageView!
    
    @IBOutlet weak var flowerDiscription: UILabel!
    
    @IBAction func selectButton(_ sender: UIButton) {
        let flowersAndMood:[String:String]=["amaryllis":"Amaryllis — bold and confident","daisy":"Daisy — cheerful and pure","rose":"Rose — loving and passionate","tulip1":"Tulip — hopeful and warm","lily":"Lily — calm and graceful","poppy":"Poppy — creative and dreamy","carnation":"Carnation - gentle and inspired","chrysanthemum":"Chrysanthemum - wise and thoughtful","pansy":"Pansy — kind and reflective","hibiscus":"Hibiscus — vibrant and free-spirited"]
        let flower=flowersAndMood.keys.randomElement()!
        UIView.animate(withDuration: 0.6, animations: {
            self.flowerImage.transform=self.flowerImage.transform.rotated(by:.pi )
        },completion:{ _ in
            self.flowerImage.image=UIImage(named:flower)})
        //flowerImage.image=UIImage(named:flower)
        flowerDiscription.text=flowersAndMood[flower]
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

