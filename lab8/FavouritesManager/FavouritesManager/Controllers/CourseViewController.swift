//
//  CourseViewController.swift
//  FavouritesManager
//
//  Created by Арайлым Кабыкенова on 21.11.2025.
//

import UIKit

class CourseViewController: UIViewController {

    @IBOutlet weak var courseTableView: UITableView!
    var favCourses:[FavObject]=[
            FavObject(
                objectTitle: "C++ — PP1",
                objectSubtitle: "A basic course on syntax, pointers, and memory management",
                objectImage: .c,
                review: "4/5 — almost retake, but first and favourite"
            ),
            FavObject(
                objectTitle: "Go — Language Fundamentals",
                objectSubtitle: "A course on Go basics: goroutines, channels, data types",
                objectImage: .golang,
                review: "4/5 — good, easy, but I didn't learn much"
            ),
            FavObject(
                objectTitle: "Linear Algebra",
                objectSubtitle: "Vector spaces, matrices, transformations",
                objectImage: .linearAlgebra,
                review: "4/5 — it could’ve been 5 if I had scored 90"
            ),
            FavObject(
                objectTitle: "PostgreSQL — Databases",
                objectSubtitle: "SQL basics, table creation, joins, transactions",
                objectImage: .postgresql,
                review: "4.5/5 — easy"
            ),
            FavObject(
                objectTitle: "Swift — iOS Development",
                objectSubtitle: "Basics of Swift, structs, OOP, UI development",
                objectImage: .swift,
                review: "5/5 — the best course ever"
            )
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        courseTableView.dataSource=self
        courseTableView.delegate=self
       
    }
  

}
extension CourseViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favCourses.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath) as! FavouriteTableViewCell
        let currentItem=favCourses[indexPath.row]
        cell.configure(favObject: currentItem)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc=storyboard?.instantiateViewController(identifier:"DetailViewController" ) as! DetailViewController
        dvc.favObject = favCourses[indexPath.row]
        navigationController?.pushViewController(dvc, animated: true)
    }
    
}
