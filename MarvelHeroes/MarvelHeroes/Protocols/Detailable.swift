//
//  Detailable.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

protocol Detailable {
	var id: Int { get set }
	var title: String { get set }
	var description: String { get set }
	var thumbnail: Thumbnail? { get set }
}

