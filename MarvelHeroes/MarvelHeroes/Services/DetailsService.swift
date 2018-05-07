//
//  DetailsService.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 07/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import Foundation

protocol Parseable {
	init?(json: [String: Any])
}

class DetailsService {
	
	class func fetchDetails<T: Parseable>(type: T.Type, offset: Int, heroID: String, completion: @escaping (Result<[T]>) -> Void) {
		Request.shared.run(urlRequest: urlRequest(forType: type, offset: offset, heroID: heroID)) { data, response, error in
			if error != nil {
				print("ERROR")
				// TODO: - Error Handling
			}
			
			guard let data = data else {
				// TODO: - Error Handling
				print("ERROR")
				return
			}
			
			do {
				if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any],
					let data = json["data"] as? [String: Any],
					let results = data["results"] as? [[String: Any]] {
					let comics = results.map { T(json: $0) }.compactMap { $0 }
					completion(.success(comics))
				}
			} catch {
				// TODO: - Error Handling
				print(error)
			}
			
		}
	}
	
	private class func urlRequest<T: Parseable>(forType type: T.Type, offset: Int, heroID: String) -> URLRequest {
		if type is Comic.Type {
			return HeroAPI.comics(offset: offset, heroID: heroID).asURLRequest()
		}
		return HeroAPI.comics(offset: offset, heroID: heroID).asURLRequest()
	}
	
}
