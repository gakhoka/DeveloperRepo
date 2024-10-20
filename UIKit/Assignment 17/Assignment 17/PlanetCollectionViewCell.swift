//
//  CollectionViewCell.swift
//  Assignment 17
//
//  Created by Giorgi Gakhokidze on 20.10.24.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    var planetName = UILabel()
    var planetArea = UILabel()
    var planetImage = UIImageView()
    var starButton = UIButton()
    var isFavorite = false
    var planet: Planet?
    private var stackView = UIStackView()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    private func setupUI() {
        cellConfig()
        starButtonConfig()
    }


    private func starButtonConfig() {
        starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        starButton.addAction(UIAction(handler: { [weak self] action in
            self?.starButtonAction()
        }), for: .touchUpInside)
    }
    
    private func starButtonAction() {
        planet?.isFavorite.toggle()
        starButton.tintColor = planet?.isFavorite ?? false ? .yellow : .gray
    }
    
    func configureCell(planet: Planet) {
        planetName.text = planet.name
        planetArea.text = "\(planet.area.toDecimalString() ?? "") km2"
        planetImage.image = UIImage(named: planet.name)
        starButton.tintColor = planet.isFavorite ? .yellow : .gray
    }
    
    private func cellConfig() {
        contentView.isUserInteractionEnabled = true
        planetImage.isUserInteractionEnabled = true
        starButton.isUserInteractionEnabled = true

        contentView.addSubview(planetName)
        contentView.addSubview(planetArea)
        contentView.addSubview(planetImage)
        contentView.addSubview(starButton)
        contentView.addSubview(stackView)
        
        stackView.distribution = .fill
        stackView.axis = .horizontal
        
        planetName.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        planetArea.font = UIFont.systemFont(ofSize: 18)
        planetImage.sizeToFit()
        
        planetName.textColor = .white
        planetArea.textColor = .white
        planetName.translatesAutoresizingMaskIntoConstraints = false
        planetArea.translatesAutoresizingMaskIntoConstraints = false
        planetImage.translatesAutoresizingMaskIntoConstraints = false
        starButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        planetName.textAlignment = .center
        planetArea.textAlignment = .center
        
        NSLayoutConstraint.activate([
            planetImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30),
            planetImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            planetImage.heightAnchor.constraint(equalToConstant: 100),
            planetImage.widthAnchor.constraint(equalToConstant: 100),
            planetImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: planetImage.bottomAnchor, constant: 10),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            planetArea.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            planetArea.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            planetArea.leftAnchor.constraint(equalTo: contentView.leftAnchor),
        ])
        stackView.addMultipleSubviews(planetName, starButton)
    }
}
