//
//  HeroAPI.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 05/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
	case get = "GET"
	case post = "POST"
}

enum HeroAPI {
	
	// MARK: - Attributes
	
	static let baseURL = "https://gateway.marvel.com:443/v1/public/"
	static let key = "86615064800735f7e97fc730d1515256"
	
	// MARK: - Endpoints
	
	case heroes(offset: Int)
	
	// MARK: - HTTP Method
	
	var method: HTTPMethod {
		switch self {
		case .heroes:
			return .get
		}
	}
	
	// MARK: - Endpoint path
	
	var path: String {
		switch self {
		case .heroes:
			return "/characters"
		}
	}
	
	// MARK: - Parameters
	
	var parameters: [String: Any] {
		switch self {
		case .heroes(let offset):
			return ["offset": offset, "limit": 20, "apiKey": HeroAPI.key]
		}
	}
	
	// MARK: - URLRequest builder
	
	func asURLRequest() -> URLRequest {
		var components = URLComponents(string: HeroAPI.baseURL)
		components?.path += path
		components?.queryItems = parameters.map {
			URLQueryItem(name: $0.key, value: $0.value is String ? $0.value as! String : String($0.value as! Int))
		}
		
		var urlRequest = URLRequest(url: components?.url ?? URL(string: HeroAPI.baseURL)!)
		urlRequest.httpMethod = method.rawValue
		
		return urlRequest
	}
}
