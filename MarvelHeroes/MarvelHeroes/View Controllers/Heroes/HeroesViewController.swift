//
//  HeroesViewController.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 05/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

class HeroesViewController: UIViewController, UINavigationControllerDelegate, Loadable {
	
	// MARK: - Outlets
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var favoritesButton: UIBarButtonItem!
	@IBOutlet weak var searchBarHeight: NSLayoutConstraint!
	
	// MARK: - Attributes
	
	let imageService = ImageService()
	var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
	var emptyLabel: UILabel?
	var offset = 0
	var heroes = [Hero]()
	var isSearchActive = false
	var isFavoritesActive = false
	var selectedHero: Hero?
	var selectedHeroImage: UIImage?
	var selectedFrame: CGRect?
	
	// MARK: - View life cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.tableFooterView = UIView()
		registerCell()
		fetchHeroes()
		configureSpinner()
		configureEmptyLabel()
		FavoritesService.retrieve()
		navigationController?.delegate = self
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData()
	}
	
	// MARK: - View configuration
	
	func registerCell() {
		let nib = UINib(nibName: "HeroTableViewCell", bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: "HeroCell")
	}
	
	// MARK: - Actions
	
	@IBAction func favoritesPressed(_ sender: UIBarButtonItem) {
		isFavoritesActive = !isFavoritesActive
		favoritesButton.image = isFavoritesActive ? #imageLiteral(resourceName: "close") : #imageLiteral(resourceName: "favorites")
		tableView.reloadData()
		emptyLabel?.isHidden = !(FavoritesService.favorites.isEmpty && isFavoritesActive)
		if !FavoritesService.favorites.isEmpty && isFavoritesActive {
			tableView.scrollToRow(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
		}
		
		searchBarHeight.constant = isFavoritesActive ? 0 : 56
		UIView.animate(withDuration: 0.5) {
			self.view.layoutIfNeeded()
		}
	}
	
	// MARK: - Data Fetchers
	
	func fetchHeroes(name: String? = nil) {
		startLoading()
		HeroService.fetchHeroes(offset, name: name) { result in
			switch result {
			case .success(let heroes):
				self.heroes.append(contentsOf: heroes)
				DispatchQueue.main.async {
					self.tableView.reloadData()
					self.emptyLabel?.isHidden = !(self.isSearchActive && self.heroes.isEmpty)
				}
			case .failure(let error):
				print(error)
			}
			DispatchQueue.main.async {
				self.stopLoading()
			}
		}
	}
	
	// MARK: - Navigation
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showDetails" {
			let destinationViewController = segue.destination as! DetailsViewController
			destinationViewController.hero = selectedHero
		}
	}
	
	public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		guard let frame = selectedFrame else { return nil }
		guard let heroImage = selectedHeroImage else { return nil }
		
		switch operation {
		case .push:
			return CustomAnimator(duration: TimeInterval(UINavigationControllerHideShowBarDuration), isPresenting: true, originFrame: frame, image: heroImage)
		default:
			return CustomAnimator(duration: TimeInterval(UINavigationControllerHideShowBarDuration), isPresenting: false, originFrame: frame, image: heroImage)
		}
	}

}

