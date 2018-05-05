//
//  Request.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 05/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import Foundation

class Request {
	
	static let shared = Request()
	private let session = URLSession(configuration: .default)
	typealias Response = ((Data?, URLResponse?, Error?) -> ())
	
	func request(urlRequest: URLRequest, completion: @escaping Response) {
		session.dataTask(with: urlRequest) { data, response, error in
			completion(data, response, error)
		}
	}
	
}
