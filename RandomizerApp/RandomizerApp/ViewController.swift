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
    
    @IBAction func selectButton(_ sender: UIButton) {
        let flowers=["amaryllis","lily","poppy","rose","carnation","chrysanthemum","daisy","pansy","tulip","hibiscus"]
        let flower=flowers.randomElement()!
        flowerImage.image=UIImage(named:flower)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

