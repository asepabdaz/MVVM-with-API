//
//  ModelDetailMovie.swift
//  MVVM with API
//
//  Created by Asep Abdaz on 10/01/20.
//  Copyright © 2020 Asep Abdaz. All rights reserved.
//

import UIKit

class ModelDetailMovie {
    
    var title: String
    var rate: Double
    var language: String
    var imageTumbnail: String
    var buttonStatus: Bool
    var description: String
    
    init(titleMovie title: String, rateMovie rate: Double, languageMovie language: String, imageTumbnailMovie imageTumbnail: String, buttonStatusMovie buttonStatus: Bool, descpritionMovie description: String) {
        self.title = title
        self.rate = rate
        self.language = language
        self.imageTumbnail = imageTumbnail
        self.buttonStatus = buttonStatus
        self.description = description
    }
}
