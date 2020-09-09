//  History.swift
//  project1
//
//  Created by 吳冠緯 on 2020/8/30.
//  Copyright © 2020 吳冠緯. All rights reserved.
//

import UIKit
import CoreData



class History: UIViewController {
    
    @IBOutlet weak var SpeedLabel: UILabel!
    @IBOutlet var myTable : UITableView!
    var ListArray = [cellData]()
    var ListArray2 = [cellData(AvrSpeed: "20km/hr", distance: "20km", date: "2/2"),cellData(AvrSpeed: "21km/hr", distance: "25km", date: "2/3")]
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
//        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        myTable.delegate = self
        myTable.dataSource = self
        // Do any additional setup after loading the view.
        
        
    }
//    讀取coreData內資料
    func fetchData(){

        let moc = (UIApplication.shared.delegate
                   as! AppDelegate).persistentContainer.viewContext
        let EntityName = "ScoreRecord"
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: EntityName)
        
        do{
            let results =
                try moc.fetch(request) as! [ScoreRecord]
            for result in results{
              SpeedLabel.text! += "\(String(describing: result.speed))"
                ListArray.append(cellData(AvrSpeed:"81km/hr",
                    distance:"100km", date:"2/2"))
//              "\(String(describing:result.speed))"
            }
            print (ListArray)
        }catch let error{
            print("context can't fetch!, Error:\(error)")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension History :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListArray2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = ListArray2[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell",for: indexPath )as! TableViewCell
        
        cell.update(cellData:cellData)
        return cell
    }
    
    
}
