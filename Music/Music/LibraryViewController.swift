////
////  LibraryViewController.swift
////  Music
////
////  Created by URim on 2022/08/21.
////

import UIKit


class LibraryViewController: UIViewController
{

    @IBOutlet weak var navigationBar: UINavigationItem!
    
    @IBOutlet weak var collectionView: UICollectionView!
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    
    let tableViewData = ["Playlists","Artists","Albums","Genres","Songs"]

    let tableViewimage : Array<String> = ["music.note.list","music.mic","rectangle.stack","guitars","music.note"]
    
    let images = ["NewJeans","10cm"]

    var collectData: [[String]] = []

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50

        loadData()
                
        
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
                        collectData.append(item)
                    }
                }
                
            } catch  {
                print("Error reading CSV file")
            }
        }
    


}


extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return tableViewData.count

//            return 5
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! TableViewCell

        cell.myLabel.text = tableViewData[indexPath.row]
        cell.myimage.image = UIImage(systemName : tableViewimage[indexPath.row])
//        cell.accessoryType = .disclosureIndicator //악세사리 뷰 화살표
    

        return cell

       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //클릭한 셀의 이벤트 처리
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            print("A")
        case 1:
            if let controller = self.storyboard?.instantiateViewController(identifier: "ArtistsViewController"){
            self.navigationController?.pushViewController(controller, animated: true)
            }
        case 2:
            print("A")
        case 3:
            if let controller = self.storyboard?.instantiateViewController(identifier: "GenresViewController"){
            self.navigationController?.pushViewController(controller, animated: true)
            }
        case 4:
            if let controller = self.storyboard?.instantiateViewController(identifier: "songsViewController"){
            self.navigationController?.pushViewController(controller, animated: true)
            }

        default:
            print("?")
        }
       
        
        
        }
    
        

}



class TableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myimage: UIImageView!
 
}


//collection view

class collectionViewCell: UICollectionViewCell {

    @IBOutlet weak var album: UIImageView!
    
    @IBOutlet weak var song: UILabel!
    @IBOutlet weak var artist: UILabel!
    override func awakeFromNib(){
        super.awakeFromNib()
   
    }
    
}

extension LibraryViewController: UICollectionViewDataSource,
                                 UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

//
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectCell", for: indexPath) as! collectionViewCell
        cell.artist.text = collectData[indexPath.row][0]
        cell.song.text = collectData[indexPath.row][1]
        let url = URL(string:collectData[indexPath.row][3])
        let data = try! Data(contentsOf: url!)
        cell.album.image = UIImage(data: data)
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let width = collectionView.frame.width
           let height = collectionView.frame.height
           let itemsPerRow: CGFloat = 2
           let widthPadding = sectionInsets.left * (itemsPerRow + 1)
           let itemsPerColumn: CGFloat = 5
           let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
           let cellWidth = (width - widthPadding) / itemsPerRow
           let cellHeight = (height - heightPadding) / itemsPerColumn
           
           return CGSize(width: cellWidth, height: cellHeight)
           
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return sectionInsets
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return sectionInsets.left
       }
    
}
