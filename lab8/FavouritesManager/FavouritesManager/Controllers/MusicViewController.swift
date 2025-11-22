//
//  MusicViewController.swift
//  FavouritesManager
//
//  Created by Арайлым Кабыкенова on 21.11.2025.
//

import UIKit

class MusicViewController: UIViewController {

    @IBOutlet weak var musicTableView: UITableView!
    var favMusics:[FavObject]=[
        FavObject(
                     objectTitle: "Beautiful Things - Benson Boone",
                      objectSubtitle: "Don't take\nThese beautiful things that I've got",
                      objectImage:.beautifulThings,
                      review: "5/5 motivating"),
        
        FavObject(
                      objectTitle: "Sparks - Coldplay",
                      objectSubtitle: "My heart is yours\nIt's you that I hold on to\nYeah, that's what I do",
                      objectImage:.sparks,
                      review: "4.5/5 depressing"),
        
        FavObject(
                      objectTitle: "Wildflower - Billie Eilish",
                      objectSubtitle: "She was cryin’ on my shoulder\nAll I could do was hold her\nOnly made us closer until July",
                      objectImage:.wildflower,
                      review: "5/5 emotional"),
        
        FavObject(
                      objectTitle: "The First Time - Damiano David",
                      objectSubtitle: "That night, the stars aligned,\nHeaven dropped a line\nBefore you, I was just a flare in the sky\nA kid too afraid to go to play in the light\nA colorless painter, a man with no sight",
                      objectImage:.theFirstTime,
                      review: "4/5 energizing"),
        
        FavObject(
                      objectTitle: "Young and Beautiful - Lana Del Rey",
                      objectSubtitle: "Will you still love me when I'm no longer young and beautiful?\nWill you still love me when I got nothing but my aching soul?",
                      objectImage:.youngAndBeautiful,
                      review: "4/5 good")
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        musicTableView.dataSource=self
        musicTableView.delegate=self
       
    }
  

}
extension MusicViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favMusics.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath) as! FavouriteTableViewCell
        let currentItem=favMusics[indexPath.row]
        cell.configure(favObject: currentItem)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc=storyboard?.instantiateViewController(identifier:"DetailViewController" ) as! DetailViewController
        dvc.favObject = favMusics[indexPath.row]
        navigationController?.pushViewController(dvc, animated: true)
    }
    
}

