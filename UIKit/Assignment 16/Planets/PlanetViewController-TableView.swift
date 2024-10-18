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
       
        planetVC.planetName = selectedPlanet.name
        planetVC.planetArea = "\(selectedPlanet.area.toDecimalString() ?? "") km2"
        planetVC.planetTemp = "\(selectedPlanet.temperature) ℃"
        planetVC.planetMass = "\(selectedPlanet.mass) kg"
        planetVC.isFavorite = selectedPlanet.isFavorite 
        navigationController?.pushViewController(planetVC, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        planets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath) as? PlanetTableViewCell {
            let planet = planets[indexPath.row]
            cell.planetName.text = planet.name
            cell.planetArea.text = "\(planet.area.toDecimalString() ?? "") km2"
            cell.planetImage.image = UIImage(named: planet.name)
            cell.backgroundColor = .hexColor
            let disclosureIndicator = UIImageView(image: UIImage(systemName: "chevron.right"))
            disclosureIndicator.tintColor = UIColor.titleLabelColor
            disclosureIndicator.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
            cell.accessoryView = disclosureIndicator
            cell.isFavorite = planet.isFavorite
            return cell
        }
        return UITableViewCell()
    }
}

