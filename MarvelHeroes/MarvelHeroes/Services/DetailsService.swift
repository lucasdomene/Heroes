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
		Request.shared.run(urlRequest: urlRequest(forType: type, heroID: heroID)) { data, _, error in
			completion(T.parseResponse(data: data, error: error))
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
