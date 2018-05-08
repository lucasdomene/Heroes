//
//  HeroService.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 06/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import Foundation

class HeroService {
	
	class func fetchHeroes(_ offset: Int, name: String? = nil, completion: @escaping (Result<[Hero]>) -> Void) {
		Request.shared.run(urlRequest: HeroAPI.heroes(offset: offset, name: name).asURLRequest()) { data, error in
			completion(Hero.parseResponse(data: data, error: error))
		}
	}
	
}
