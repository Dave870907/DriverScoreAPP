//
//  UnitExtensions.swift
//  project1
//
//  Created by 吳冠緯 on 2020/8/14.
//  Copyright © 2020 吳冠緯. All rights reserved.
//

import Foundation

class UnitConverterPace: UnitConverter {
  private let coefficient: Double
  
  init(coefficient: Double) {
    self.coefficient = coefficient
  }
  
  override func baseUnitValue(fromValue value: Double) -> Double {
    return reciprocal(value * coefficient)
  }
  
  override func value(fromBaseUnitValue baseUnitValue: Double) -> Double {
    return reciprocal(baseUnitValue * coefficient)
  }
  
  private func reciprocal(_ value: Double) -> Double {
    guard value != 0 else { return 0 }
    return 1.0 / value
  }
}
    
extension UnitSpeed {
  class var secondsPerMeter: UnitSpeed {
    return UnitSpeed(symbol: "sec/m", converter: UnitConverterPace(coefficient: 1))
  }
  
  class var minutesPerKilometer: UnitSpeed {
    return UnitSpeed(symbol: "min/km", converter: UnitConverterPace(coefficient: 60.0 / 1000.0))
  }
  
  class var minutesPerMile: UnitSpeed {
    return UnitSpeed(symbol: "min/mi", converter: UnitConverterPace(coefficient: 60.0 / 1609.34))
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


