//
//  Parseable.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit
import Foundation

protocol Parseable {
	init?(json: [String: Any])
	static func parseResponse<T: Parseable>(data: Data?, error: Error?) -> Result<[T]>
}

extension Parseable {
	
	static func parseResponse<T: Parseable>(data: Data?, error: Error?) -> Result<[T]> {
		if error != nil && data != nil { return .failure(.fetching) }
		
		do {
			if let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any],
				let data = json["data"] as? [String: Any],
				let results = data["results"] as? [[String: Any]] {
				let items = results.map { T(json: $0) }.compactMap { $0 }
				return .success(items)
			} else {
				return .failure(.parsing)
			}
		} catch {
			return .failure(.parsing)
		}
	}
	
}
