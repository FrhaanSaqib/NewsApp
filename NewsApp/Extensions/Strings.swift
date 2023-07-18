//
//  Strings.swift
//  NewsApp
//
//  Created by Farhan Saqib on 18/07/2023.
//

import Foundation

extension String{
    
    func stringToDateConverter(_ date: String) -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.stringToDateFormate
        return dateFormatter.date(from: date)
    }
}
