//
//  BaseManager.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//

import Moya
import Foundation

class BaseManager<Target: TargetType, Provider: MoyaProvider<Target>> {

    private var provider: Provider

    init(provider: Provider) {
        self.provider = provider
    }

    func request<T: Decodable>(target: Target, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
