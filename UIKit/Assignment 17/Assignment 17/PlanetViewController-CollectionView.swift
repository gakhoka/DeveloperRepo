//
//  PlanetViewController-CollectionView.swift
//  Assignment 17
//
//  Created by Giorgi Gakhokidze on 20.10.24.
//

import Foundation
import UIKit

extension PlanetViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tappe")
        let currentPlanet = planets[indexPath.row]
        let planetVC = PlanetDetailViewController()
        planetVC.configureView(with: currentPlanet)
        planetVC.delegate = self
        navigationController?.pushViewController(planetVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        planets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath) as? PlanetCollectionViewCell {
            let planet = planets[indexPath.row]
            cell.configureCell(planet: planet)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension PlanetViewController: PlanetDetailViewControllerDelegate {
    func favoritedPlanet(_ planet: Planet) {
        if let index = planets.firstIndex(where: { $0.name == planet.name }) {
            planets[index] = planet
            planets.sort(by: { $0.isFavorite && !$1.isFavorite })
            planetsCollectionView.reloadData()
        }
    }
    
    func favoriteTapped(for planet: Planet) {
        if let index = planets.firstIndex(where: { $0.isFavorite == planet.isFavorite }) {
            planets[index] = planet
            planetsCollectionView.reloadData()
        }
    }
}
