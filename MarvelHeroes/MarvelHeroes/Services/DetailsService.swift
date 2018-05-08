//
//  DetailsService.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 07/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import Foundation

class DetailsService {
	
	class func fetchDetails<T: Parseable>(type: T.Type, heroID: String, completion: @escaping (Result<[T]>) -> Void) {
		Request.shared.run(urlRequest: urlRequest(forType: type, heroID: heroID)) { data, response, error in
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
	
	private class func urlRequest<T: Parseable>(forType type: T.Type, heroID: String) -> URLRequest {
		if type is Comic.Type {
			return HeroAPI.comics(heroID: heroID).asURLRequest()
		} else if type is Event.Type {
			return HeroAPI.events(heroID: heroID).asURLRequest()
		} else if type is Serie.Type {
			return HeroAPI.series(heroID: heroID).asURLRequest()
		}
		return HeroAPI.stories(heroID: heroID).asURLRequest()
	}
	
}
