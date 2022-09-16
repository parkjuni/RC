//
//  GenresViewController.swift
//  Music
//
//  Created by URim on 2022/08/24.
//

import UIKit

class GenresViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,UIScrollViewDelegate  {
   
    
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableview: UITableView!
    

    
    let tableViewData = ["Adult Alternative","Adult Contemporary","Alternative","Alternative Folk","Animation","Anime","Ballad","Blues","Children's Music","Classical","Country","Crossover","Dance","Drama","Electronic","Electronica","Enka","Folk","Folk-Rock","Foreign Movie","Hip-Hop","Hip-Hop/Rap","Holiday","Indie Pop","Indie Rock","J-Pop","Jazz","K-Pop","Korean Hip-Hop","Korean Indie","Korean Movie","Mandopop","Musicals","New Age","Orchestra","Original Score","OST","Pop","R&B/Soul","Rap/Hip-Hop","Rock","Singer/Songwriter","Solo Instrumental","Soundtrack","Teen Pop","Trot","TV OST","TV Soundtrack","Vocal","World"]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return tableViewData.count

       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GenresTableViewCell

        cell.GenresLabel.text = tableViewData[indexPath.row]

        return cell
       }
//

    override func viewDidLoad() {
        super.viewDidLoad()
//        setSearchBar()
        self.searchBar.searchBarStyle = .minimal
      
        // Do any additional setup after loading the view.

    }
   

}




class GenresTableViewCell: UITableViewCell {

    
    @IBOutlet weak var GenresLabel: UILabel!

}

        
        

    



