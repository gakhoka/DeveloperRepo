//
//  PlanetDetailViewController.swift
//  Assignment 17
//
//  Created by Giorgi Gakhokidze on 20.10.24.
//

import UIKit

protocol PlanetDetailViewControllerDelegate: AnyObject {
    func favoritedPlanet(_ planet: Planet)
}

class PlanetDetailViewController: UIViewController {
    
    var planet: Planet?
    weak var delegate: PlanetDetailViewControllerDelegate?
    
    private var nameLabel = UILabel()
    private var planetImageView = UIImageView()
    private var planetAreaLabel = UILabel()
    private var planetTempLabel = UILabel()
    private var planetMassLabel = UILabel()
    private var starButton = UIButton()
    private var navigationButton = UIButton()
    private var firstStack = UIStackView()
    private var secondStack = UIStackView()
    private var thirdStack = UIStackView()
    private var isSmallDevice = false
    
    var isFavorite = false
    var planetName: String?
    var planetArea: String?
    var planetImage: UIImage?
    var planetTemp: String?
    var planetMass: String?
    var isFavoritButtonTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .hexColor
    }
    
    private func setupUI() {
        setupImageView()
        setupNameLabel()
        setupInformationForFirstStack()
        setupInformationForSecondStack()
        setupInformationForThirdStack()
        navigationButtonConfig()
        buttonConfig()
    }
    
    func configureView(with planet: Planet) {
        planetArea = "\(planet.area.toDecimalString() ?? "") km2"
        planetTemp = "\(planet.temperature) ℃"
        planetMass = "\(planet.mass) kg"
        planetName = planet.name
        self.planet = planet
    }
    
    private func navigationButtonConfig() {
        view.addSubview(navigationButton)
        navigationButton.translatesAutoresizingMaskIntoConstraints = false
        navigationButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        navigationButton.tintColor = .titleLabelColor
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigationButton)
        navigationButton.addAction(UIAction(handler: {  [weak self] action in
            self?.goBackToPlanetsList()
        }), for: .touchUpInside)
    }
    
    private func buttonConfig() {
        view.addSubview(starButton)
        starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        starButton.tintColor = planet?.isFavorite == true ? .yellow : .gray
        starButton.addAction(UIAction(handler: { [weak self] action in
            self?.starButtonAction()
        }), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: starButton)
    }
    
    private func starButtonAction() {
        planet?.isFavorite.toggle()
        starButton.tintColor = planet?.isFavorite == true ? .yellow : .gray
        
        if let favorite = planet {
            delegate?.favoritedPlanet(favorite)
        }
    }
    
    private func goBackToPlanetsList() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupInformationForThirdStack() {
        view.addSubview(thirdStack)
        view.addSubview(planetMassLabel)
        planetMassLabel.simpleLabel(text: planetMass)
        planetMassLabel.textAlignment = .right
        thirdStack.configureStackView()
        
        let mass = UILabel()
        view.addSubview(mass)
        mass.simpleLabel(text: "Mass")
        
        NSLayoutConstraint.activate([
            mass.leftAnchor.constraint(equalTo: thirdStack.leftAnchor, constant: 10),
            mass.heightAnchor.constraint(equalToConstant: 52),
            mass.topAnchor.constraint(equalTo: thirdStack.topAnchor, constant: 5),
            mass.centerYAnchor.constraint(equalTo: thirdStack.centerYAnchor),
            
            thirdStack.topAnchor.constraint(equalTo: secondStack.bottomAnchor, constant: 20),
            thirdStack.heightAnchor.constraint(equalToConstant: 52),
            thirdStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            thirdStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            thirdStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            planetMassLabel.rightAnchor.constraint(equalTo: thirdStack.rightAnchor, constant: -10),
            planetMassLabel.heightAnchor.constraint(equalToConstant: 52),
            planetMassLabel.centerYAnchor.constraint(equalTo: thirdStack.centerYAnchor)
        ])
        thirdStack.addMultipleSubviews(mass, planetMassLabel)
    }
    
    private func setupInformationForSecondStack() {
        view.addSubview(secondStack)
        view.addSubview(planetTempLabel)
        planetTempLabel.simpleLabel(text: planetTemp)
        planetTempLabel.textAlignment = .right
        secondStack.configureStackView()
        
        let temperature = UILabel()
        view.addSubview(temperature)
        temperature.simpleLabel(text: "Temperature")
        
        NSLayoutConstraint.activate([
            temperature.leftAnchor.constraint(equalTo: secondStack.leftAnchor, constant: 10),
            temperature.heightAnchor.constraint(equalToConstant: 52),
            temperature.topAnchor.constraint(equalTo: secondStack.topAnchor, constant: 5),
            temperature.centerYAnchor.constraint(equalTo: secondStack.centerYAnchor),
            
            secondStack.topAnchor.constraint(equalTo: firstStack.bottomAnchor, constant: 20),
            secondStack.heightAnchor.constraint(equalToConstant: 52),
            secondStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            secondStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            secondStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
           planetTempLabel.rightAnchor.constraint(equalTo: secondStack.rightAnchor, constant: -10),
           planetTempLabel.heightAnchor.constraint(equalToConstant: 52),
           planetTempLabel.topAnchor.constraint(equalTo: secondStack.topAnchor, constant: 5),
           planetTempLabel.centerYAnchor.constraint(equalTo: secondStack.centerYAnchor)
        ])
        secondStack.addMultipleSubviews(temperature, planetTempLabel)
    }
    
    private func setupInformationForFirstStack() {
        view.addSubview(firstStack)
        view.addSubview(planetAreaLabel)
        planetAreaLabel.simpleLabel(text: planetArea)
        firstStack.configureStackView()
        
        let area = UILabel()
        view.addSubview(area)
        area.simpleLabel(text: "Area")
        
        NSLayoutConstraint.activate([
            firstStack.topAnchor.constraint(equalTo: planetImageView.bottomAnchor, constant: 75),
            firstStack.heightAnchor.constraint(equalToConstant: 52),
            firstStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            firstStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            firstStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            area.leftAnchor.constraint(equalTo: firstStack.leftAnchor, constant: 10),
            area.heightAnchor.constraint(equalToConstant: 52),
            area.topAnchor.constraint(equalTo: firstStack.topAnchor, constant: 5),
            area.centerYAnchor.constraint(equalTo: firstStack.centerYAnchor),
    
            planetAreaLabel.rightAnchor.constraint(equalTo: firstStack.rightAnchor, constant: -10),
            planetAreaLabel.heightAnchor.constraint(equalToConstant: 52),
            planetAreaLabel.topAnchor.constraint(equalTo: firstStack.topAnchor, constant: 5),
            planetAreaLabel.centerYAnchor.constraint(equalTo: firstStack.centerYAnchor)
        ])
        firstStack.addMultipleSubviews(area, planetAreaLabel)
    }
    
    private func setupNameLabel() {
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = planetName
        nameLabel.textColor = .titleLabelColor
        nameLabel.font = UIFont.systemFont(ofSize: 36, weight: .heavy)
        self.navigationItem.titleView = nameLabel

        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupImageView() {
        view.addSubview(planetImageView)
        planetImageView.translatesAutoresizingMaskIntoConstraints = false
        planetImageView.image = UIImage(named: planetName ?? "")
        
        NSLayoutConstraint.activate([
            planetImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            planetImageView.heightAnchor.constraint(equalToConstant: 280),
            planetImageView.widthAnchor.constraint(equalToConstant: 280),
            planetImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        ])
        
        let screenHeight = UIScreen.main.bounds.height
        
        if screenHeight < 800 {
            planetImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        } 
    }
}

