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
	
	static let baseURL = "https://gateway.marvel.com/v1/public/"
	static let privateKey = "86615064800735f7e97fc730d1515256"
	static let publicKey = "22026d7439253af65f68bb150eeaff3d2c5d9e79"
	
	// MARK: - Endpoints
	
	case heroes(offset: Int, name: String?)
	case comics(heroID: String)
	case events(heroID: String)
	case stories(heroID: String)
	case series(heroID: String)
	
	// MARK: - HTTP Method
	
	var method: HTTPMethod {
		switch self {
		case .heroes, .comics, .events, .stories, .series:
			return .get
		}
	}
	
	// MARK: - Endpoint path
	
	var path: String {
		switch self {
		case .heroes:
			return "characters"
		case .comics(let heroID):
			return "characters/\(heroID)/comics"
		case .events(let heroID):
			return"characters/\(heroID)/events"
		case .stories(let heroID):
			return"characters/\(heroID)/stories"
		case .series(let heroID):
			return"characters/\(heroID)/series"
		}
	}
	
	// MARK: - Parameters
	
	var parameters: [String: Any] {
		var parameters = requiredParameters()
		switch self {
		case .heroes(let offset, let name):
			parameters["offset"] = offset
			if name != nil {
				parameters["name"] = name
			}
			return parameters
		case .comics, .events, .stories, .series:
			return parameters
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
	
	func requiredParameters() -> [String: Any] {
		let ts = NSUUID().uuidString
		let hash = (ts + HeroAPI.publicKey + HeroAPI.privateKey).md5()!
		var parameters = [String: Any]()
		parameters["apikey"] = HeroAPI.privateKey
		parameters["hash"] = hash
		parameters["ts"] = ts
		parameters["limit"] = 20
		return parameters
	}
}
