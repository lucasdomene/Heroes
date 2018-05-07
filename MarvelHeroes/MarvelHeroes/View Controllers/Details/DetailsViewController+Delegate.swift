//
//  DetailsViewController+Delegate.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 07/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

extension DetailsViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		guard let detailsTableViewCell = cell as? DetailsTableViewCell else { return }
		detailsTableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.section)
	}
	
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
		(view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.red
		(view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.white
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		switch section {
		case Sections.comics.rawValue:
			return "Comics"
		case Sections.events.rawValue:
			return "Events"
		case Sections.series.rawValue:
			return "Series"
		case Sections.stories.rawValue:
			return "Stories"
		default:
			return ""
		}
	}
}
