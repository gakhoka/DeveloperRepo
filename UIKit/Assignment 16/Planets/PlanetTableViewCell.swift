//
//  PlanetTableViewCell.swift
//  Planets
//
//  Created by Giorgi Gakhokidze on 18.10.24.
//

import UIKit
import SwiftUI

class PlanetTableViewCell: UITableViewCell {
    
    var planetName = UILabel()
    var planetArea = UILabel()
    var planetImage = UIImageView()
    var starButton = UIButton()
    var isFavorite = false
    var planet: Planet?

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.hexColor
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellConfig()
        starButtonConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
        let disclosureIndicator = UIImageView(image: UIImage(systemName: "chevron.right"))
        disclosureIndicator.tintColor = UIColor.titleLabelColor
        disclosureIndicator.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        accessoryView = disclosureIndicator
        starButton.tintColor = planet.isFavorite ? .yellow : .gray
    }
    private func cellConfig() {
        contentView.addSubview(planetName)
        contentView.addSubview(planetArea)
        contentView.addSubview(planetImage)
        contentView.addSubview(starButton)
        
        planetName.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        planetArea.font = UIFont.systemFont(ofSize: 18)
        planetImage.sizeToFit()
        
        planetName.textColor = .white
        planetArea.textColor = .white
        planetName.translatesAutoresizingMaskIntoConstraints = false
        planetArea.translatesAutoresizingMaskIntoConstraints = false
        planetImage.translatesAutoresizingMaskIntoConstraints = false
        starButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            planetImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            planetImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            planetImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            planetImage.heightAnchor.constraint(equalToConstant: 100),
            planetImage.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            planetName.topAnchor.constraint(equalTo: planetImage.topAnchor),
            planetName.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            planetName.leftAnchor.constraint(equalTo: planetImage.rightAnchor, constant: 40),
            planetArea.topAnchor.constraint(equalTo: planetName.bottomAnchor, constant: 10),
            planetArea.leftAnchor.constraint(equalTo: planetName.leftAnchor),
        ])
        
        NSLayoutConstraint.activate([
            starButton.leftAnchor.constraint(equalTo: planetName.rightAnchor, constant: 30),
            starButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            starButton.bottomAnchor.constraint(equalTo: planetArea.topAnchor, constant: -10)
        ])
    }
}

