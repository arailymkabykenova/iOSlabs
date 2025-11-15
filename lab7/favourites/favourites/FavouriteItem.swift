//
//  FavouriteItem.swift
//  favourites
//
//  Created by Арайлым Кабыкенова on 15.11.2025.
//
import UIKit
struct FavouriteItem{
let objectType:favourite
    let objectTitle:String
    let objectSubtitle:String
    let objectImage:UIImage
    var review:String
    
}
enum favourite:String{
    case movie
    case music
    case book
    case course
}
