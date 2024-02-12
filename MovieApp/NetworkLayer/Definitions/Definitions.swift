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
    
    public var headers: [String: String]? {
        let headers: [String: String] = [
            "Accept": "application/json; charset=utf-8",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMjRiODVkNTU3YjRiN2VmMjk1YjRmMGE0MDljNjUzOSIsInN1YiI6IjYyZmI1YzAzMjQ0MTgyMDA3Yzc2ZTNkZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.gs8cKhouwUrkkkXAB1Osmf3EdySrNdtNoWuQXEXLrQY"
        ]
        return headers
    }
    
    func generateEndPoint(lastPath: String) -> String {
        return NetworkUtil.generateMobileEndPointV3(lastPath: lastPath)
    }
}
