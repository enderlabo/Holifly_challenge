//
//  NetworkService.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 22/04/24.
//


import Foundation

actor NetworkService {
    
    func fetchObjects<T: Codable>(for url: URL) async throws -> [T] {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw Error.request
        }
        
        return try JSONDecoder().decode([T].self, from: data)
    }
    
    func fetchObject<T: Codable>(for url: URL) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw Error.request
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
}

extension NetworkService {
    enum Error: LocalizedError {
        case request
        case decode
    }
}
