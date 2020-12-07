//
//  RedViewController+ViewModel.swift
//  MVVMDemo2
//
//  Created by Jose Vilson de Farias on 12/7/20.
//

extension CarViewController {
    struct ViewModel{
        let carName: String // Example: Red Ferrari
        let year: String // Example: Year 2020

        init(color: String?, model: String?, year: String?) {

            guard let color = color,
                  let car = model,
                  let year = year
            else {
                self.carName = "unknown"
                self.year = "no year"
                return
            }

            self.carName = "\(color) \(car)"
            self.year = "Year \(year)"
        }
    }
}
