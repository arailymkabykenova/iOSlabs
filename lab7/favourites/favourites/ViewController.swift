//
//  ViewController.swift
//  favourites
//
//  Created by Арайлым Кабыкенова on 12.11.2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    

    enum favCategory{
        case music
        case book
        case movie
        case course
        
        var sectionTitle:String{
            switch self{
            case .music:
                return "Musics"
            case .book:
                return "Books"
            case .movie:
                return "Movies"
            case .course:
                return "Courses"
            }
        }
    }
    var allCategories:[favCategory]=[.music,.book,.movie,.course]
    var favouriteObjects:[[FavouriteItem]]=[
        [
                FavouriteItem(objectType: .music,
                              objectTitle: "Beautiful Things - Benson Boone",
                              objectSubtitle: "Don't take\nThese beautiful things that I've got",
                              objectImage:.beautifulThings,
                              review: "5/5 motivating"),
                
                FavouriteItem(objectType: .music,
                              objectTitle: "Sparks - Coldplay",
                              objectSubtitle: "My heart is yours\nIt's you that I hold on to\nYeah, that's what I do",
                              objectImage:.sparks,
                              review: "4.5/5 depressing"),
                
                FavouriteItem(objectType: .music,
                              objectTitle: "Wildflower - Billie Eilish",
                              objectSubtitle: "She was cryin’ on my shoulder\nAll I could do was hold her\nOnly made us closer until July",
                              objectImage:.wildflower,
                              review: "5/5 emotional"),
                
                FavouriteItem(objectType: .music,
                              objectTitle: "The First Time - Damiano David",
                              objectSubtitle: "That night, the stars aligned,\nHeaven dropped a line\nBefore you, I was just a flare in the sky\nA kid too afraid to go to play in the light\nA colorless painter, a man with no sight",
                              objectImage:.theFirstTime,
                              review: "4/5 energizing"),
                
                FavouriteItem(objectType: .music,
                              objectTitle: "Young and Beautiful - Lana Del Rey",
                              objectSubtitle: "Will you still love me when I'm no longer young and beautiful?\nWill you still love me when I got nothing but my aching soul?",
                              objectImage:.youngAndBeautiful,
                              review: "4/5 good")
            ],[
                FavouriteItem(
                    objectType: .book,
                    objectTitle: "Homo Sapiens — Yuval Noah Harari",
                    objectSubtitle: "A history of humankind from ancient people to the modern world",
                    objectImage: .homoSapiens,
                    review: "4/5 — good"
                ),
                FavouriteItem(
                    objectType: .book,
                    objectTitle: "The Hunger Games — Suzanne Collins",
                    objectSubtitle: "A dystopian story about survival and rebellion against a totalitarian regime",
                    objectImage: .hungerGame,
                    review: "5/5 — special"
                ),
                FavouriteItem(
                    objectType: .book,
                    objectTitle: "The Little Prince — Antoine de Saint-Exupéry",
                    objectSubtitle: "A philosophical tale about childhood, friendship, and human nature",
                    objectImage: .littlePrince,
                    review: "5/5 — deep thoughts"
                ),
                FavouriteItem(
                    objectType: .book,
                    objectTitle: "Pride and Prejudice — Jane Austen",
                    objectSubtitle: "A classic romance novel about love, character, and social norms",
                    objectImage: .prideAndPrejudice,
                    review: "5/5 — classic"
                ),
                FavouriteItem(
                    objectType: .book,
                    objectTitle: "The Picture of Dorian Gray — Oscar Wilde",
                    objectSubtitle: "A gothic story about morality, beauty, and corruption",
                    objectImage: .thePictureOfDorianGray,
                    review: "4/5"
                )
            ],[
                FavouriteItem(
                    objectType: .movie,
                    objectTitle: "Falling for Christmas (2022)",
                    objectSubtitle: "A romantic Christmas comedy with a light storyline",
                    objectImage: .fallingForChristmas,
                    review: "3/5 — nothing special"
                ),
                FavouriteItem(
                    objectType: .movie,
                    objectTitle: "How the Grinch Stole Christmas (2000)",
                    objectSubtitle: "A warm family story about how the Grinch learned to love Christmas",
                    objectImage: .grinch,
                    review: "5/5 — favourite"
                ),
                FavouriteItem(
                    objectType: .movie,
                    objectTitle: "Last Christmas (2019)",
                    objectSubtitle: "A romantic story of self-discovery and love, inspired by George Michael's music",
                    objectImage: .lastChristmas,
                    review: "5/5 — always crying"
                ),
                FavouriteItem(
                    objectType: .movie,
                    objectTitle: "Let It Snow (2019)",
                    objectSubtitle: "A light teen Christmas movie about friendship and romance",
                    objectImage: .letItSnow,
                    review: "3/5 — nothing special"
                ),
                FavouriteItem(
                    objectType: .movie,
                    objectTitle: "Love Hard (2021)",
                    objectSubtitle: "A romantic comedy about dating and learning that looks aren't everything",
                    objectImage: .loveHard,
                    review: "4/5 — good"
                )
            ],
            [
                FavouriteItem(
                    objectType: .course,
                    objectTitle: "C++ — PP1",
                    objectSubtitle: "A basic course on syntax, pointers, and memory management",
                    objectImage: .c,
                    review: "4/5 — almost retake, but first and favourite"
                ),
                FavouriteItem(
                    objectType: .course,
                    objectTitle: "Go — Language Fundamentals",
                    objectSubtitle: "A course on Go basics: goroutines, channels, data types",
                    objectImage: .golang,
                    review: "4/5 — good, easy, but I didn't learn much"
                ),
                FavouriteItem(
                    objectType: .course,
                    objectTitle: "Linear Algebra",
                    objectSubtitle: "Vector spaces, matrices, transformations",
                    objectImage: .linearAlgebra,
                    review: "4/5 — it could’ve been 5 if I had scored 90"
                ),
                FavouriteItem(
                    objectType: .course,
                    objectTitle: "PostgreSQL — Databases",
                    objectSubtitle: "SQL basics, table creation, joins, transactions",
                    objectImage: .postgresql,
                    review: "4.5/5 — easy"
                ),
                FavouriteItem(
                    objectType: .course,
                    objectTitle: "Swift — iOS Development",
                    objectSubtitle: "Basics of Swift, structs, OOP, UI development",
                    objectImage: .swift,
                    review: "5/5 — the best course ever"
                )
            ]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        tableView.delegate=self
        
        // Do any additional setup after loading the view.
    }


}
extension ViewController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return favouriteObjects.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteObjects[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell=tableView.dequeueReusableCell(withIdentifier: "cell") as! FavouriteTableViewCell
        let currentItem=favouriteObjects[indexPath.section][indexPath.row]
        cell.configure(favObject: currentItem)
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return allCategories[section].sectionTitle
        
    }
    
}
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

