//
//  HeroData.swift
//  HeroApp
//
//  Created by Арайлым Кабыкенова on 03.12.2025.
//
struct HeroData:Decodable{
    let name:String
    let powerstats:PowerStatus
    let appearance:HeroAppearance
    let biography:Biography
    let images:HeroImage
    
    struct PowerStatus:Decodable{
        let intelligence:Int
        let speed:Int
        let power: Int
        let combat:Int
    }
    struct HeroAppearance:Decodable{
    let gender:String
    }
    struct Biography:Decodable{
        let fullName:String
        let placeOfBirth:String
    }
    struct HeroImage:Decodable{
        let md:String
    }
}
