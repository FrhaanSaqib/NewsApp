//
//  Dates.swift
//  NewsApp
//
//  Created by Farhan Saqib on 18/07/2023.
//

import Foundation

extension Date{
    
    func dateToStringConverter(_ date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dateToStringFormat
        return dateFormatter.string(from: date)
    }
}
