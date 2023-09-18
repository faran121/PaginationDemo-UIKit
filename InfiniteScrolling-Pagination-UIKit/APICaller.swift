//
//  APICaller.swift
//  InfiniteScrolling-Pagination-UIKit
//
//  Created by Maliks on 16/09/2023.
//

import Foundation

class APICaller {
    var isPaginating = false
    
    func fetchData(pagination: Bool = false, completion: @escaping (Result<[String], Error>) -> Void) {
        
        if pagination {
            isPaginating = true
        }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + (pagination ? 3 : 2), execute: {
            let originalData = ["Apple",
                        "Facebook",
                        "Google",
                        "Apple",
                        "Facebook",
                        "Google",
                        "Apple",
                        "Facebook",
                        "Google",
                        "Apple",
                        "Facebook",
                        "Google",
                        "Apple",
                        "Facebook",
                        "Google",
                        "Facebook",
                        "Google",
                        "Apple",
                        "Facebook",
                        "Google"
            ]
            
            let newData = ["Banana", "Oranges", "Grapes", "Peach"]
            
            completion(.success(pagination ? newData : originalData))
            
            if pagination {
                self.isPaginating = false
            }
        })
    }
}
