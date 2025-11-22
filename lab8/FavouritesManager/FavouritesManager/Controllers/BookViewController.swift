//
//  BookViewController.swift
//  FavouritesManager
//
//  Created by Арайлым Кабыкенова on 21.11.2025.
//

import UIKit

class BookViewController: UIViewController {
    @IBOutlet weak var bookTableView: UITableView!
    var favBooks:[FavObject]=[
        FavObject(
                            objectTitle: "Homo Sapiens — Yuval Noah Harari",
                            objectSubtitle: "A history of humankind from ancient people to the modern world",
                            objectImage: .homoSapiens,
                            review: "4/5 — good"
                        ),
        FavObject(
                            objectTitle: "The Hunger Games — Suzanne Collins",
                            objectSubtitle: "A dystopian story about survival and rebellion against a totalitarian regime",
                            objectImage: .hungerGame,
                            review: "5/5 — special"
                        ),
        FavObject(
                            objectTitle: "The Little Prince — Antoine de Saint-Exupéry",
                            objectSubtitle: "A philosophical tale about childhood, friendship, and human nature",
                            objectImage: .littlePrince,
                            review: "5/5 — deep thoughts"
                        ),
        FavObject(
                            objectTitle: "Pride and Prejudice — Jane Austen",
                            objectSubtitle: "A classic romance novel about love, character, and social norms",
                            objectImage: .prideAndPrejudice,
                            review: "5/5 — classic"
                        ),
        FavObject(
                            objectTitle: "The Picture of Dorian Gray — Oscar Wilde",
                            objectSubtitle: "A gothic story about morality, beauty, and corruption",
                            objectImage: .thePictureOfDorianGray,
                            review: "4/5"
                        )
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        bookTableView.dataSource=self
        bookTableView.delegate=self
       
    }
  

}
extension BookViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favBooks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cells",for:indexPath) as! FavouriteTableViewCell
        let currentItem=favBooks[indexPath.row]
        cell.configure(favObject: currentItem)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc=storyboard?.instantiateViewController(identifier:"DetailViewController" ) as! DetailViewController
        dvc.favObject = favBooks[indexPath.row]
        navigationController?.pushViewController(dvc, animated: true)
    }
    
}
