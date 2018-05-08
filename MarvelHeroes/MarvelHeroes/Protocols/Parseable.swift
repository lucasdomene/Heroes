//
//  Parseable.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

protocol Parseable {
	init?(json: [String: Any])
}
