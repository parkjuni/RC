//
//  songsViewController.swift
//  Music
//
//  Created by URim on 2022/08/23.
//

import UIKit

class songsViewController: UIViewController{
    
    var songData: [[String]] = []
    var count = 40
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
        self.searchBar.searchBarStyle = .minimal

        
    }
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var playImg: UIImageView!
    @IBOutlet weak var playLabel: UILabel!
    @IBAction func shuffle(_ sender: Any) {
        let randomData = Int.random(in: 0...39)
        playLabel.text = songData[randomData][1]
        let url = URL(string:songData[randomData][3])
        let data = try! Data(contentsOf: url!)
        playImg.image = UIImage(data: data)

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
                        songData.append(item)
                    }
                }
                
            } catch  {
                print("Error reading CSV file")
            }
        }
    //스와이프 delete
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // 오른쪽에 만들기
        let del = UIContextualAction(style: .normal, title: "del") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
                  print("del 클릭 됨")
                  success(true)
            
            
            self.songData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
    
              }
        del.backgroundColor = .systemRed
        del.image = UIImage(systemName: "trash.fill")
     
        count = count-1
              //actions배열 인덱스 0이 왼쪽에 붙어서 나옴
              return UISwipeActionsConfiguration(actions:[del])
    }
    
}
class SongsTableViewCell: UITableViewCell {

    override func awakeFromNib(){
        super.awakeFromNib()

      
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
   
}


extension songsViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SongsTableViewCell
        cell.textLabel?.text = songData[indexPath.row][1]
        cell.detailTextLabel?.text = songData[indexPath.row][0]
        let url = URL(string:songData[indexPath.row][3])
        let data = try! Data(contentsOf: url!)
        cell.imageView?.image = UIImage(data: data)
        cell.imageView?.frame = CGRect(x:0, y:0,width:50, height:50)


            return cell    }
}



