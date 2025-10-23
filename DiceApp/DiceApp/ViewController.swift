//
//  ViewController.swift
//  DiceApp
//
//  Created by Арайлым Кабыкенова on 22.10.2025.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var leftDice: UIImageView!
    @IBOutlet weak var rightDice: UIImageView!
    
    @IBAction func roleAction(_ sender: UIButton) {
        let diceArray=["DiceOne","DiceTwo","DiceThree","DiceFour","DiceFive","DiceSix"]
        let rightDiceName=diceArray.randomElement( )!
        let leftDiceName=diceArray.randomElement( )!
        rightDice.image=UIImage(named:rightDiceName)
        leftDice.image=UIImage(named:leftDiceName )
}
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        let diceArray=["DiceOne","DiceTwo","DiceThree","DiceFour","DiceFive","DiceSix"]
        let rightDiceName=diceArray.randomElement( )!
        let leftDiceName=diceArray.randomElement( )!
        rightDice.image=UIImage(named:rightDiceName)
        leftDice.image=UIImage(named:leftDiceName )
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

