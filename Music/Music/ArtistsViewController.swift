//
//  ArtistsViewController.swift
//  Music
//
//  Created by URim on 2022/08/24.
//

import UIKit

class ArtistsViewController: UIViewController   {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var artistData: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        self.searchBar.searchBarStyle = .minimal

        // Do any additional setup after loading the view.
    }
    
    private func loadData(){
        let path = Bundle.main.path(forResource:"songs", ofType: "csv")!
        parseCSVAt(url:URL(fileURLWithPath: path))
        tableView.reloadData()
    
    }
   
    private func parseCSVAt(url:URL) {
            do {
                
                let data = try Data(contentsOf: url)
                let dataEncoded = String(data: data, encoding: .utf8)
                
                if let dataArr = dataEncoded?.components(separatedBy: "\n").map({$0.components(separatedBy: ",")}) {
                    
                    for item in dataArr {
                        artistData.append(item)
                    }
                }
                
            } catch  {
                print("Error reading CSV file")
            }
        }
   
}




class ArtistsTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib(){
        super.awakeFromNib()
//        imgView.layer.cornerRadius = imgView.frame.width/2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
//    func configure(){
//        imgView.layer.cornerRadius = CGFloat(15)
//
//    }
}



extension ArtistsViewController: UITableViewDelegate, UITableViewDataSource { func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 40
}


func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ArtistsTableViewCell
    cell.nameLabel.text = artistData[indexPath.row][0]
    
    let url = URL(string:artistData[indexPath.row][2])
    let data = try! Data(contentsOf: url!)
    cell.imgView.image = UIImage(data: data)
    cell.imgView.layer.cornerRadius = cell.frame.height*0.45
    cell.imgView.layer.borderWidth = 0.3
    cell.imgView.layer.borderColor = UIColor.gray.cgColor

    //    cell.imgView.frame.width =CGFloat(CGFloat)
   
        return cell
    }

}
