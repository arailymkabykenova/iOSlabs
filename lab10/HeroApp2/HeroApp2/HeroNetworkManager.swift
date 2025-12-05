//
//  HeroNetworkManager.swift
//  HeroApp2
//
//  Created by Арайлым Кабыкенова on 05.12.2025.
//
import Foundation
import Alamofire

protocol HeroNetworkManagerDelegate{
    func update(_ newHero: HeroModel)
}
struct HeroNetworkManager {
    var delegate: HeroNetworkManagerDelegate?
    func fetchData(){
        let randomId=Int.random(in:1...563)
        let urlString="https://akabab.github.io/superhero-api/api/id/\(randomId).json"
        AF.request(urlString).responseDecodable(of:HeroData.self){response in
            switch response.result{
            case .success(let heroData):
                let name=heroData.name
                let power=heroData.powerstats.power
                let heroIntellegence=heroData.powerstats.intelligence
                let speed=heroData.powerstats.speed
                let combat=heroData.powerstats.combat
                let heroBirthLocation=heroData.biography.placeOfBirth
                let gender=heroData.appearance.gender
                let image=heroData.images.md
                let fullName=heroData.biography.fullName
                let firstAppearance=heroData.biography.firstAppearance
                let publisher=heroData.biography.publisher
                let hero=HeroModel(name: name, intelligence: heroIntellegence, speed: speed, power: power, combat: combat, gender: gender, fullName: fullName, placeOfBirth: heroBirthLocation, firstAppearance: firstAppearance, publisher: publisher, image: image)
                delegate?.update(hero)
            case .failure(let error):
                debugPrint(error)
                
            }
        }
    }
}
