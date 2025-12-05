//
//  HeroData.swift
//  HeroApp2
//
//  Created by Арайлым Кабыкенова on 05.12.2025.
//

struct HeroData:Codable{
    let name:String
    let powerstats:PowerStats
    let appearance:Appearance
    let biography:Biography
    let images:Images
    
    struct PowerStats:Codable{
        let intelligence:Int
        let speed:Int
        let power:Int
        let combat:Int
        
    }
    struct Appearance:Codable{
        let gender:String
    }
    struct Biography:Codable{
        let fullName:String
        let placeOfBirth:String
        let firstAppearance:String
        let publisher:String
    }
    struct Images:Codable{
        let md:String
    }
}
