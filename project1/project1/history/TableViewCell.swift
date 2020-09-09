//
//  TableViewCell.swift
//  project1
//
//  Created by 吳冠緯 on 2020/9/8.
//  Copyright © 2020 吳冠緯. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

 
    @IBOutlet weak var AvrSpeed: UILabel!
      @IBOutlet weak var distance: UILabel!
      @IBOutlet weak var date: UILabel!
      
      func update(cellData: cellData) {
          AvrSpeed.text = "平均速度 : "+cellData.AvrSpeed
          distance.text = "距離 : "+cellData.distance
          date.text = "日期 : "+cellData.date
         
      }
    
}
