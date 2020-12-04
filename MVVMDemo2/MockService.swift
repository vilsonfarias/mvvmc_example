//
//  MockService.swift
//  MVVMDemo2
//
//  Created by Jose Vilson de Farias on 12/4/20.
//

import UIKit

class MockService: NSObject {
    let data = [
        ["car":"Ferrari", "color":"red", "year": "2020"],
        ["car":"Ecosport", "color":"gray", "year": "2012"],
        ["car":"WV Bettle", "color":"yellow", "year": "1959"],
        ["car":"Raptor", "color":"black", "year": "2021"]
    ]

    func fetchData() -> [String:String] {
        return data.randomElement() ?? [:]
    }
}
