//
//  Definitions.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//

import Foundation
import Moya

// MARK: Provider
func createMoyaProvider<Target: TargetType>(targetType: Target.Type) -> MoyaProvider<Target> {
    let provider = MoyaProvider<Target>()
    provider.session.sessionConfiguration.timeoutIntervalForRequest = 120
    return provider
}

// MARK: RequestParameters
typealias APIRequestParameters = [String: Any]

// MARK: Typealiases
typealias MoyaMethod = Moya.Method
typealias MoyaTask = Task

// MARK: Definitions
let DefaultJSONEncoding = JSONEncoding.default
let DefaultURLEncoding = URLEncoding.default

// MARK: TargetType - Header
public protocol MTargetType: TargetType {}

extension MTargetType {
    
    var baseURL: URL {
        return URL(string: NetworkUtil.environmentBaseURL)!
    }
    
    private var apiKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "Movie-Info", ofType: "plist") else {
                fatalError("Couldn't find file 'Movie-Info.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_KEY") as? String else {
                fatalError("Couldn't find key 'API_KEY' in 'Movie-Info.plist'.")
            }
            return value
        }
    }
    
    public var headers: [String: String]? {
        let headers: [String: String] = [
            "Accept": "application/json; charset=utf-8",
            "Authorization": "Bearer \(apiKey)"
        ]
        return headers
    }
    
    func generateEndPoint(lastPath: String) -> String {
        return NetworkUtil.generateMobileEndPointV3(lastPath: lastPath)
    }
}
