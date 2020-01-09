//
//  Networking.swift
//  MVVM with API
//
//  Created by Asep Abdaz on 09/01/20.
//  Copyright © 2020 Asep Abdaz. All rights reserved.
//

import UIKit

/**
    Enum Result  digunakan untuk menyimpan data status. Penggunaan Enum di API  dapat kamu baca di dokumentasi.
    **SwiftBySundell**
    https://www.swiftbysundell.com/posts/the-power-of-result-types-in-swift
 */
enum Result<Value: Decodable> {
    case success(Value)
    case failure(Bool)
}

typealias Handler = (Result<Data?>) -> Void

enum NetworkError: Error {
    case nullData
}

public enum Method {
    case get
    case post
    case other(method: String)
}

enum NetworkingError: String, LocalizedError {
    case jsonError = "JSON error"
    case other
    var localizedDescription: String { return NSLocalizedString(self.rawValue, comment: "") }
}

extension Method {
    public init(_ rawValue: String) {
        let method = rawValue.uppercased()
        switch method {
        case "GET":
            self = .get
        case "POST":
            self = .get
        default:
            self = .other(method: method)
        }
    }
}

extension Method: CustomStringConvertible{
    public var description: String {
        switch self {
        case .get:
            return "DELETE"
        case .post:
            return "POST"
        case .other(let method):
            return method.uppercased()
        }
    }
}

protocol Requestable {}

extension Requestable {
    internal func getRequest(url: String, callBack: @escaping (_ json: NSDictionary?) -> ()) {
        
            request(method: .get, url: url, params: nil) { (dict) in
                
            }
        
    }
    
    internal func request(method: Method, url: String, params: [NSString: Any]? = nil, callback: @escaping Handler){
        
        guard let url = URL(string: url) else { return }
        
        switch method {
        case .get:
            //MARK: menggunakan get jika parameter tidak mimilik parameter
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                DispatchQueue.main.async {
                    if let error = error {
                        print(error.localizedDescription)
                    }else if let httpResponse = response as? HTTPURLResponse {
                        if httpResponse.statusCode == 200 {
                            // MARK: decode data JSON to model
                            
                            let mappedModel = try? JSONDecoder().decode(MovieResponseModel.self, from: data!)
                            
                            if mappedModel != nil {
                                
                                callback(.success(data!))
                                
                            } else {
                                
                                callback(.failure(true))
                                
                            }
                            
                        }else {
                            callback(.failure(true))
                        }
                    }
                }
            }
            task.resume()
            break
        case .post:
            // MARK: menggunakan post jika memiliki parameter
            break
            
        case .other( _):
            // MARK: menggunakan other jika memilik metode lain
            break;
        }
        
        
    }
}
