//
//  searchViewController.swift
//  Music
//
//  Created by URim on 2022/08/26.
//

import UIKit

class searchViewController: UIViewController {

    let name = "IU"
    let song = ["Blueming","Drama", "Secret Garden", "Hold My Hand","My Sea","Celebrity","eight(feat.SUGA)","Lilac"]
    let album = ["https://cdnimg.melon.co.kr/cm2/album/images/103/46/650/10346650_500.jpg?14a08050b8c6adc879b6e0cf587d456a/melon/resize/282/quality/80/optimize","https://cdnimg.melon.co.kr/cm2/album/images/108/27/816/10827816_20211229143632_500.jpg?5212701ba136b287d5c446d6f504451f/melon/resize/282/quality/80/optimize","https://cdnimg.melon.co.kr/cm/album/images/100/96/855/10096855_500.jpg?143adaa26f0aeb5c274cb302ddac684f/melon/resize/282/quality/80/optimize","https://cdnimg.melon.co.kr/cm/album/images/012/86/252/1286252_500.jpg/melon/resize/282/quality/80/optimize","https://cdnimg.melon.co.kr/cm2/album/images/105/54/246/10554246_20210325161233_500.jpg?304eb9ed9c07a16ec6d6e000dc0e7d91/melon/resize/282/quality/80/optimize","https://cdnimg.melon.co.kr/cm2/album/images/104/26/648/10426648_20200506153340_500.jpg?0ed92b652a9149e26387233529a32781/melon/resize/282/quality/80/optimize","https://cdnimg.melon.co.kr/cm2/album/images/105/54/246/10554246_20210325161233_500.jpg?304eb9ed9c07a16ec6d6e000dc0e7d91/melon/resize/282/quality/80/optimize","https://cdnimg.melon.co.kr/cm2/album/images/105/54/246/10554246_20210325161233_500.jpg?304eb9ed9c07a16ec6d6e000dc0e7d91/melon/resize/282/quality/80/optimize"]
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    

    var returnData: [[String]] = []

    @IBAction func clickButton(_ sender: Any) {
//        returnData[["IU"],[],[]]
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.searchBarStyle = .minimal
        // Do any additional setup after loading the view.
    }
    

  

}


extension searchViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return song.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SongsTableViewCell
        cell.textLabel?.text = song[indexPath.row]
        cell.detailTextLabel?.text = name
        let url = URL(string:album[indexPath.row])
        let data = try! Data(contentsOf: url!)
        cell.imageView?.image = UIImage(data: data)
        cell.imageView?.frame = CGRect(x:0, y:0,width:50, height:50)
        cell.selectionStyle = .none


            return cell    }
}
