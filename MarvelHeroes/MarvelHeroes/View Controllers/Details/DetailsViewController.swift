//
//  DetailsViewController.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 07/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var tableView: UITableView!
	
	var hero: Hero!
	var details = [Int: [Any]]()
	
	enum Sections: Int {
		case comics = 0
		case stories
		case events
		case series
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.tableFooterView = UIView()
		initDetails()
		fetchComics()
		fetchEvents()
		fetchSeries()
		fetchStories()
	}
	
	func initDetails() {
		for i in 0...3 {
			details[i] = []
		}
	}
	
	func fetchComics() {
		DetailsService.fetchDetails(type: Comic.self, offset: 0, heroID: String(hero.id)) { result in
			switch result {
			case .success(let comics):
				self.details[Sections.comics.rawValue] = comics
			case .failure(let error):
				print(error)
			}
		}
	}
	
	func fetchEvents() {
		DetailsService.fetchDetails(type: Event.self, offset: 0, heroID: String(hero.id)) { result in
			switch result {
			case .success(let events):
				self.details[Sections.events.rawValue] = events
			case .failure(let error):
				print(error)
			}
		}
	}
	
	func fetchSeries() {
		DetailsService.fetchDetails(type: Serie.self, offset: 0, heroID: String(hero.id)) { result in
			switch result {
			case .success(let series):
				self.details[Sections.series.rawValue] = series
			case .failure(let error):
				print(error)
			}
		}
	}
	
	func fetchStories() {
		DetailsService.fetchDetails(type: Story.self, offset: 0, heroID: String(hero.id)) { result in
			switch result {
			case .success(let stories):
				self.details[Sections.stories.rawValue] = stories
			case .failure(let error):
				print(error)
			}
		}
	}
}
