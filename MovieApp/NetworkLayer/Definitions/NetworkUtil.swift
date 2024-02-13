//
//  NetworkUtil.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//

import Foundation

enum APIEnvironment {
    case dev
    case production
}

struct NetworkUtil {
    private static let environment: APIEnvironment = .dev

    static var environmentBaseURL: String {
        switch NetworkUtil.environment {
        case .production: return "https://api.themoviedb.org"
        case .dev: return "https://api.themoviedb.org"
        }
    }

    static func generateMobileEndPointV3(lastPath: String) -> String {
        return "3\(lastPath)"
    }
}
