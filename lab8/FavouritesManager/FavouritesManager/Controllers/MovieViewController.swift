//
//  MovieViewController.swift
//  FavouritesManager
//
//  Created by Арайлым Кабыкенова on 21.11.2025.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    var favMovies:[FavObject]=[
        FavObject(
            objectTitle: "Falling for Christmas (2022)",
            objectSubtitle: "A romantic Christmas comedy with a light storyline",
            objectImage: .fallingForChristmas,
            review: "3/5 — nothing special"
        ),
        FavObject(
            objectTitle: "How the Grinch Stole Christmas (2000)",
            objectSubtitle: "A warm family story about how the Grinch learned to love Christmas",
            objectImage: .grinch,
            review: "5/5 — favourite"
        ),
        FavObject(
            objectTitle: "Last Christmas (2019)",
            objectSubtitle: "A romantic story of self-discovery and love, inspired by George Michael's music",
            objectImage: .lastChristmas,
            review: "5/5 — always crying"
        ),
        FavObject(
            objectTitle: "Let It Snow (2019)",
            objectSubtitle: "A light teen Christmas movie about friendship and romance",
            objectImage: .letItSnow,
            review: "3/5 — nothing special"
        ),
        FavObject(
            objectTitle: "Love Hard (2021)",
            objectSubtitle: "A romantic comedy about dating and learning that looks aren't everything",
            objectImage: .loveHard,
            review: "4/5 — good"
        )
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.dataSource=self
        movieTableView.delegate=self
       
    }
  

}
extension MovieViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favMovies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath) as! FavouriteTableViewCell
        let currentItem=favMovies[indexPath.row]
        cell.configure(favObject: currentItem)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc=storyboard?.instantiateViewController(identifier:"DetailViewController" ) as! DetailViewController
        dvc.favObject = favMovies[indexPath.row]
        navigationController?.pushViewController(dvc, animated: true)
    }
    
}
