//
//  HeroNetworkManager.swift
//  HeroApp
//
//  Created by Арайлым Кабыкенова on 03.12.2025.
//
import Foundation
struct HeroNetworkManager{
    var delegate:HeroServiceDelegate?
    func fetchData(_ random:Int){
        let urlString="https://akabab.github.io/superhero-api/api/id/\(random).json"
        print(urlString)
        performRequest(with: urlString)
        }
    func performRequest(with urlString:String){
        if let url=URL(string:urlString){
            let session=URLSession(configuration: .default)
            let dataTask = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print("Error:\(error!)")
                    return
                }
                if let safeData=data{
                    if let newHero=self.parseHeroModel(data: safeData){
                        print(newHero)
                        DispatchQueue.main.async{
                            delegate?.didHeroUpdate(self,newHero)
                        }
                    }
                }
            }
            dataTask.resume()

        }
}

    
    func parseHeroModel(data:Data)->HeroModel?{
        do{
            let model=try JSONDecoder().decode(HeroData.self, from: data)
            let heroName=model.name
            let heroIntellegence=model.powerstats.intelligence
            let speed=model.powerstats.speed
            let power = model.powerstats.power
            let combat=model.powerstats.combat
            let heroBirthLocation=model.biography.placeOfBirth
            let gender=model.appearance.gender
            let imageURL=URL(string: model.images.md)!
            if let imageData=try? Data(contentsOf: imageURL){
                let hero=HeroModel(heroName:heroName, heroIntelligence: heroIntellegence, heroSpeed: speed, heroPower: power, heroCombat: combat, heroBirthLocation: heroBirthLocation, heroGender: gender, heroImage: imageData)
                return hero
            }
        }
        catch{
            print("Error:\(error)")
        }
        return nil
    }
}
