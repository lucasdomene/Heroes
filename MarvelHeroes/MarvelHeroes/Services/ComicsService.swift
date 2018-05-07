//
//  ComicsService.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 07/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import Foundation

class ComicsService {
	
	//class func fetchComics(_ offset: Int, heroID: String, completion: @escaping ())
	
	class func fetchHeroes(_ offset: Int, name: String? = nil, completion: @escaping (Result<[Hero]>) -> Void) {
		
		Request.shared.run(urlRequest: HeroAPI.heroes(offset: offset, name: name).asURLRequest()) { data, response, error in
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
					let heroes = results.map { Hero(json: $0) }.compactMap { $0 }
					completion(.success(heroes))
				}
			} catch {
				// TODO: - Error Handling
				print(error)
			}
		}
	}
	
}
