//
//  MockService.swift
//  MVVMDemo2
//
//  Created by Jose Vilson de Farias on 12/4/20.
//

import UIKit

class CarDataSource: NSObject {
    let data = [
        ["car":"Ferrari", "color":"Red", "year_built": "2020"],
        ["car":"Ecosport", "color":"Gray", "year_built": "2012"],
        ["car":"WV Bettle", "color":"Yellow", "year_built": "1959"],
        ["car":"Raptor", "color":"Black", "year_built": "2021"]
    ]

    func fetchData() -> [String:String] {
        return data.randomElement() ?? [:]
    }
}
