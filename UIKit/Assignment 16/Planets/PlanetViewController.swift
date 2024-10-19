//
//  ViewController.swift
//  Planets
//
//  Created by Giorgi Gakhokidze on 17.10.24.
//

import UIKit
import SwiftUI

class PlanetViewController: UIViewController, PlanetDetailViewControllerDelegate {

    private var titleLabel = UILabel()
    private let tableView = UITableView()
    
    var planets = [
        Planet(name: "Mars", area: 1_258_250, temperature: -63, mass: "6.42e23", isFavorite: false),
        Planet(name: "Jupiter", area: 61_418_738, temperature: -108, mass: "1.90e27", isFavorite: false),
        Planet(name: "Earth", area: 510_100_000, temperature: 15, mass: "5.97e24", isFavorite: false),
        Planet(name: "Saturn", area: 4_272_000, temperature: -139, mass: "5.68e26", isFavorite: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        tableViewSetup()
        titleLabelSetup()
        sortPlanets()
    }
    
    func favoritedPlanet(_ planet: Planet) {
        if let index = planets.firstIndex(where: { $0.name == planet.name }) {
            planets[index] = planet
            sortPlanets()
            tableView.reloadData()
        }
    }
    
    func favoriteTapped(for planet: Planet) {
        if let index = planets.firstIndex(where: { $0.isFavorite == planet.isFavorite }) {
            planets[index] = planet
            sortPlanets()
            tableView.reloadData()
        }
    }
    
    private func sortPlanets() {
        planets.sort { $0.isFavorite && !$1.isFavorite }
        tableView.reloadData()
    }

    private func titleLabelSetup() {
        view.addSubview(titleLabel)
        titleLabel.textColor = .titleLabelColor
        titleLabel.text = "Planets"
        titleLabel.font = UIFont.systemFont(ofSize: 36, weight: .heavy)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide
                .topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        self.navigationItem.titleView = titleLabel
    }
    
    private func tableViewSetup() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .hexColor
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
        
        tableView.register(PlanetTableViewCell.self, forCellReuseIdentifier: "PlanetCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

struct viewControllerRepresentable: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = PlanetViewController
    
    func makeUIViewController(context: Context) -> PlanetViewController {
        PlanetViewController()
    }
    
    func updateUIViewController(_ uiViewController: PlanetViewController, context: Context) {
    }
}

struct viewController_Previews: PreviewProvider {
    static var previews: some View {
        viewControllerRepresentable()
    }
}

