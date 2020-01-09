//
//  Array.swift
//  MVVM with API
//
//  Created by Asep Abdaz on 09/01/20.
//  Copyright © 2020 Asep Abdaz. All rights reserved.
//

import Foundation

extension Array where Element == Movie {
    func matching(_ query: String) -> [Movie] {
        return self.filter({ $0.title == query || $0.original_title == query})
    }

    func shortByName() -> [Movie] {

        return self.sorted { (first, next) -> Bool in
            return first.title?.compare(next.title!) == .orderedAscending
        }
    }
}
