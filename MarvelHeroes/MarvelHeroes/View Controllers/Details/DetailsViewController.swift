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
	var details = [[Detailable]]()
	let imageService = ImageService()
	
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
		for _ in 0...3 {
			details.append([])
		}
	}
	
	func fetchComics() {
		DetailsService.fetchDetails(type: Comic.self, heroID: String(hero.id)) { result in
			switch result {
			case .success(let comics):
				self.details[Sections.comics.rawValue] = comics
				DispatchQueue.main.async {
					self.tableView.reloadRows(at: [IndexPath(row: 0, section: Sections.comics.rawValue)], with: .none)
				}
			case .failure(let error):
				print(error)
			}
		}
	}
	
	func fetchEvents() {
		DetailsService.fetchDetails(type: Event.self, heroID: String(hero.id)) { result in
			switch result {
			case .success(let events):
				self.details[Sections.events.rawValue] = events
				DispatchQueue.main.async {
					self.tableView.reloadRows(at: [IndexPath(row: 0, section: Sections.events.rawValue)], with: .none)
				}
			case .failure(let error):
				print(error)
			}
		}
	}
	
	func fetchSeries() {
		DetailsService.fetchDetails(type: Serie.self, heroID: String(hero.id)) { result in
			switch result {
			case .success(let series):
				self.details[Sections.series.rawValue] = series
				DispatchQueue.main.async {
					self.tableView.reloadRows(at: [IndexPath(row: 0, section: Sections.series.rawValue)], with: .none)
				}
			case .failure(let error):
				print(error)
			}
		}
	}
	
	func fetchStories() {
		DetailsService.fetchDetails(type: Story.self, heroID: String(hero.id)) { result in
			switch result {
			case .success(let stories):
				self.details[Sections.stories.rawValue] = stories
				DispatchQueue.main.async {
					self.tableView.reloadRows(at: [IndexPath(row: 0, section: Sections.stories.rawValue)], with: .none)
				}
			case .failure(let error):
				print(error)
			}
		}
	}
}
