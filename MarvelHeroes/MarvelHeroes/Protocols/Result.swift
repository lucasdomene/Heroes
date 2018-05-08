//
//  Result.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

enum Result<T> {
	case success(T)
	case failure(Error)
}
