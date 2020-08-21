//
//  ViewController.swift
//  project1
//
//  Created by 吳冠緯 on 2020/8/8.
//  Copyright © 2020 吳冠緯. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
  
//var myLocationManager :CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    // 建立一個 CLLocationManager
//    myLocationManager = CLLocationManager()
//
//    // 設置委任對象
//    myLocationManager.delegate = self
//
//    // 距離篩選器 用來設置移動多遠距離才觸發委任方法更新位置
//    myLocationManager.distanceFilter =
//      kCLLocationAccuracyNearestTenMeters
//
//    // 取得自身定位位置的精確度
//    myLocationManager.desiredAccuracy =
//      kCLLocationAccuracyBest
//
    }

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        // 首次使用 向使用者詢問定位自身位置權限
//        if CLLocationManager.authorizationStatus()
//            == .notDetermined {
//            // 取得定位服務授權
//        myLocationManager.requestWhenInUseAuthorization()
//
//            // 開始定位自身位置
//            myLocationManager.startUpdatingLocation()
//        }
//        // 使用者已經拒絕定位自身位置權限
//        else if CLLocationManager.authorizationStatus()
//            == .denied {
//            // 提示可至[設定]中開啟權限
//            let alertController = UIAlertController(
//              title: "定位權限已關閉",
//              message:
//              "如要變更權限，請至 設定 > 隱私權 > 定位服務 開啟",
//              preferredStyle: .alert)
//            let okAction = UIAlertAction(
//                title: "確認", style: .default, handler:nil)
//            alertController.addAction(okAction)
//            self.present(
//              alertController,
//              animated: true, completion: nil)
//        }
//        // 使用者已經同意定位自身位置權限
//        else if CLLocationManager.authorizationStatus()
//            == .authorizedWhenInUse {
//            // 開始定位自身位置
//            myLocationManager.startUpdatingLocation()
//        }
//    }
}

