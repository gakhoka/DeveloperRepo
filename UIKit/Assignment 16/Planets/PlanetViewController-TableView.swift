//
//  PlanetViewController-TableView.swift
//  Planets
//
//  Created by Giorgi Gakhokidze on 18.10.24.
//

import Foundation
import UIKit


extension PlanetViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPlanet = planets[indexPath.row]
        let planetVC = PlanetDetailViewController()
        planetVC.configureView(with: selectedPlanet)
        planetVC.delegate = self
        navigationController?.pushViewController(planetVC, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        planets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath) as? PlanetTableViewCell {
            let planet = planets[indexPath.row]
            cell.configureCell(planet: planet)
            cell.backgroundColor = .hexColor
            cell.planet = planet
            return cell
        }
        return UITableViewCell()
    }
}

