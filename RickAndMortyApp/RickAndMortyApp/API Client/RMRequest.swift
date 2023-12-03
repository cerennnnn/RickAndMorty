//
//  RMRequest.swift
//  RickAndMortyApp
//
//  Created by Ceren Güneş on 27.11.2023.
//

import Foundation

///Object that represents a single API call
final class RMRequest {
    ///API constants
    //https://rickandmortyapi.com/api/character/2

    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    ///Desired endpoint
        private let endpoint: RMEndpoint
    ///Path components for api, if any
        private let pathComponents: [String]
    ///Query arguments for api, if any
        private let queryParameters: [URLQueryItem]
        
        ///Constructed url for the api request in string format
        
        private var urlString: String {
            var string = Constants.baseURL
            string += "/"
            string += endpoint.rawValue
            
            if !pathComponents.isEmpty {
                pathComponents.forEach({
                    string += "/\($0)"
                })
            }
            
            if !queryParameters.isEmpty {
                string += "?"
                //name=value&name=value
                let argumentString = queryParameters.compactMap {
                    guard let value = $0.value else { return nil }
                    return "\($0.name)=\(value)"
                }.joined(separator: "&")
                
                string += argumentString
            }
            
            return string
        }
        
    ///Computed & constructed api url
        public var url: URL? {
            return URL(string: urlString)
        }
    
    ///Desired http method
    public let httpMethod = "GET"
        
    //MARK: - Public
    
    ///Construct request
    ///- Parameters:
    ///     - endpoint: Target endpoint
    ///     - pathComponents: Collection of path components
    ///     - queryParameters: Collection of query parameters
        
        init(endpoint: RMEndpoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
            self.endpoint = endpoint
            self.pathComponents = pathComponents
            self.queryParameters = queryParameters
    }
}

extension RMRequest {
    static let listCharactersRequest = RMRequest(endpoint: .character)
    
}
