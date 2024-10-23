//
//  ViewController.swift
//  Assignment 17
//
//  Created by Giorgi Gakhokidze on 20.10.24.
//

import UIKit
import SwiftUI

final class PlanetViewController: UIViewController {
    
    private var titleLabel = UILabel()
    
     let planetsCollectionView: UICollectionView = {
        let collectionView: UICollectionView
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
        collectionLayout.itemSize = CGSize(width: 160, height: 200)
        collectionLayout.minimumLineSpacing = 20
        collectionView = UICollectionView(frame: CGRect(x: 20, y: 20, width: 100, height: 100), collectionViewLayout: collectionLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .hexColor
        return collectionView
    }()
    
    var planets = [
        Planet(name: "Mars", area: 1_258_250, temperature: -63, mass: "6.42e23", isFavorite: false),
        Planet(name: "Jupiter", area: 61_418_738, temperature: -108, mass: "1.90e27", isFavorite: false),
        Planet(name: "Earth", area: 510_100_000, temperature: 15, mass: "5.97e24", isFavorite: false),
        Planet(name: "Venus", area: 4_272_000, temperature: -139, mass: "5.68e26", isFavorite: false),
        Planet(name: "Uranus", area: 460_200_000, temperature: -195, mass: "8.682e14", isFavorite: false),
        Planet(name: "Mercury", area: 74_797_000, temperature: 167, mass: "3.122e13", isFavorite: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        collectionViewConfig()
        titleLabelConfig()
    }
    
    private func titleLabelConfig() {
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

    func collectionViewConfig() {
        view.addSubview(planetsCollectionView)
        
        NSLayoutConstraint.activate([
            planetsCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            planetsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            planetsCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            planetsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        
        planetsCollectionView.register(PlanetCollectionViewCell.self, forCellWithReuseIdentifier: "PlanetCell")
        planetsCollectionView.dataSource = self
        planetsCollectionView.delegate = self
        
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
