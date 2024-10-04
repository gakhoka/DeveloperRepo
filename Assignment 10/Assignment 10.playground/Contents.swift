import Foundation


//MARK: 1. შექმენით CreatureType enum-ი სხვადასხვა ტიპის არსებებით (მაგ: fire, water, earth, air, electric …). გამოიყენეთ associated value, რომ თითოეულ ტიპს ჰქონდეს rarity: Double მნიშვნელობა 0-დან 1-მდე. დაამატეთ computed property description, რომელიც დააბრუნებს არსების ტიპის აღწერას. 

enum CreatureType {
    case fire(rarity: Double)
    case water(rarity: Double)
    case earth(rarity: Double)
    case air(rarity: Double)
    case electric(rarity: Double)
    
    var description: String {
        switch self {
        case .fire(let rarity):
            return "Fire type rarity: \(rarity)"
        case .water(let rarity):
            return "Water type rarity: \(rarity)"
        case .earth(let rarity):
            return "Earth type rarity: \(rarity)"
        case .air(let rarity):
            return "Air type rarity: \(rarity)"
        case .electric(let rarity):
            return "Electric type rarity: \(rarity)"
        }
    }
}

//MARK: 2. შექმენით პროტოკოლი CreatureStats შემდეგი მოთხოვნებით:
//* var health: Double
//* var attack: Double
//* var defense: Double
//* func updateStats(health: Double, attack: Double, defense: Double) მეთოდი, რომელიც განაახლებს ამ მონაცემებს (შეგიძლიათ ფუნქციის პარამეტრები სურვილისამებრ შეცვალოთ, მაგ: დეფოლტ მნიშვნელობები გაუწეროთ 😌) 

protocol CreatureStats {
    var health: Double { get set }
    var attack: Double { get set }
    var defense: Double { get set }
    
    func updateStats(health: Double, attack: Double, defense: Double)
}

//MARK: 3. შექმენით კლასი Trainer შემდეგი ფროფერთებით:
//* public let name: String
//* private var creatures: [DigitalCreature]
//* დაამატეთ public მეთოდი add(creature: DigitalCreature) რომლითაც შეძლებთ ახალი არსების დამატებას მასივში, ასევე არსებას საკუთარ თავს (self) დაუსეტავს ტრენერად.


class Trainer {
    public let name: String
    private var creatures: [DigitalCreature] = []
    
    init(name: String) {
        self.name = name
    }
    
    public func add(creature: DigitalCreature) {
        creatures.append(creature)
        creature.trainer = self
    }
}

//MARK: 4. შექმენით კლასი DigitalCreature, რომელიც დააკმაყოფილებს CreatureStats პროტოკოლს. დაამატეთ:
//    * public let name: String
//    * public let type: CreatureType
//    * public var level: Int
//    * public var experience: Double
//    * weak public var trainer: Trainer?
//    * დაამატეთ deinit მეთოდი, რომელიც დაბეჭდავს შეტყობინებას არსების წაშლისას. 

class DigitalCreature: CreatureStats {
    var health: Double
    var attack: Double
    var defense: Double
    public let name: String
    public let type: CreatureType
    public var level: Int
    public var experience: Double
    weak public var trainer: Trainer?
    
    init(name: String, type: CreatureType, level: Int, experience: Double, health: Double, attack: Double, defense: Double) {
        self.name = name
        self.type = type
        self.level = level
        self.experience = experience
        self.health = health
        self.attack = attack
        self.defense = defense
    }
    
    func updateStats(health: Double = 100, attack: Double = 10, defense: Double = 50) {
        self.health = health
        self.attack = attack
        self.defense = defense
    }
    
    deinit {
        print("\(name) is removed")
    }
}

//MARK: 5. შექმენით CreatureManager კლასი შემდეგი ფუნქციონალით:
//    * private var creatures: [DigitalCreature] - არსებების მასივი
//    * public func adoptCreature(_ creature: DigitalCreature) - არსების დამატება
//    * public func trainCreature(named name: String) - კონკრეტული არსების წვრთნა (გაითვალისწინეთ რომ წვრთნა მოხდება მხოლოდ მაშინ თუ არჩეულ არსებას ყავს მწვრთნელი!)
//    * public func listCreatures() -> [DigitalCreature] - ყველა არსების სიის დაბრუნება  გააფართოვეთ CreatureManage კლასი მეთოდით func trainAllCreatures(), რომელიც გაწვრთნის ყველა არსებას. 

class CreatureManager {
    private var creatures: [DigitalCreature] = []
    
    public func adoptCreature(_ creature: DigitalCreature) {
        creatures.append(creature)
    }
    
    public func trainCreature(named name: String) {
        for creature in creatures where creature.name == name {
            if let trainer = creature.trainer {
                creature.experience += 50
                creature.attack += 15
                creature.defense += 10
                creature.level += 1
                print("Training \(creature.name) by \(trainer.name)")
            }
        }
    }
    
    public func listCreatures() -> [DigitalCreature] {
        return creatures
    }
    
}

extension CreatureManager {
    func trainAllCreatures() {
        for creature in creatures {
            if let trainer = creature.trainer {
                creature.experience += 50
                creature.attack += 15
                creature.defense += 10
                creature.level += 1
                print("\(trainer.name) trained \(creature.name)")
            }
        }
    }
}

//MARK: 6. შექმენით CreatureShop კლასი მეთოდით purchaseRandomCreature() -> DigitalCreature. ეს მეთოდი დააბრუნებს რანდომიზირებულად დაგენერირებულ არსებას. 


class CreatureShop {
    func purchaseRandomCreature() -> DigitalCreature {
        let creatureTypes: [CreatureType] = [
            .fire(rarity: Double.random(in: 0...1)),
            .water(rarity: Double.random(in: 0...1)),
            .earth(rarity: Double.random(in: 0...1)),
            .air(rarity: Double.random(in: 0...1)),
            .electric(rarity: Double.random(in: 0...1))
        ]
        
        let randomType = creatureTypes.randomElement()!
        let names = ["Nini", "Giorgi", "Sandro", "Saba", "Nika", "Ana", "Soso", "Salome"]
        let randomCreature = DigitalCreature(name: names.randomElement()!,
                                             type: randomType,
                                             level: 1,
                                             experience: 0,
                                             health: 100,
                                             attack: Double.random(in: 10...50),
                                             defense: 5)
        return randomCreature
    }
}

//MARK: 7. შექმენით გლობალური ფუნქცია updateLeaderboard(players: [CreatureManager]) -> [CreatureManager], რომელიც დაალაგებს მოთამაშეებს მათი არსებების ჯამური ძალის მიხედვით.  


func updateLeaderboard(players: [CreatureManager]) -> [CreatureManager] {
    return players.sorted { player1, player2  in
        let totalAttack1 = player1.listCreatures().reduce(0) { $0 + $1.attack }
        let totalAttack2 = player2.listCreatures().reduce(0) { $0 + $1.attack }
        return totalAttack1 > totalAttack2
    }
}

//MARK: 8. გამოვიყენოთ წინა ტასკებში შექმნილი ყველა ფუნქციონალი:
//* შექმენით რამდენიმე Trainer ობიექტი
//* შექმენით რამდენიმე CreatureManager ობიექტი
//* შექმენით ერთი ან ორი CreatureShop
//* თითოეული მენეჯერისთვის:
//    * შეიძინეთ რამდენიმე შემთხვევითი არსება CreatureShop-იდან
//    * მიაბარეთ რამდენიმე არსება რომელიმე ტრენერს.
//    * სცადეთ არსებების წვრთნა CreatureManager-ის trainCreature(named:) მეთოდით
//* გამოიყენეთ CreatureManager-ის trainAllCreatures() მეთოდი ყველა მოთამაშის არსებების საწვრთნელად (თუ ყავს მწვრთნელი, რა თქმა უნდა)
//* განაახლეთ ლიდერბორდი updateLeaderboard() ფუნქციის გამოყენებით
//* დაბეჭდეთ თითოეული მოთამაშის არსებების სია და მათი სტატისტიკა
//* წაშალეთ ერთი არსება რომელიმე Trainer-იდან და აჩვენეთ, რომ weak reference მუშაობს სწორად (დაბეჭდეთ არსების trainer property-ს მნიშვნელობა წაშლამდე და წაშლის შემდეგ)
//* დააკვირდით deinit მეთოდის გამოძახებას არსების წაშლისას 


let creatureShop1 = CreatureShop()
let creatureShop2 = CreatureShop()

let trainer1 = Trainer(name: "Nika")
let trainer2 = Trainer(name: "Giorgi")
let trainer3 = Trainer(name: "Lasha")

let creatureManager1 = CreatureManager()
let creatureManager2 = CreatureManager()

let randomCreature1 = creatureShop1.purchaseRandomCreature()
let randomCreature2 = creatureShop1.purchaseRandomCreature()
let randomCreature3 = creatureShop2.purchaseRandomCreature()
let randomCreature4 = creatureShop2.purchaseRandomCreature()

creatureManager1.adoptCreature(randomCreature1)
creatureManager1.adoptCreature(randomCreature2)
creatureManager2.adoptCreature(randomCreature3)
creatureManager2.adoptCreature(randomCreature4)

randomCreature1.trainer = trainer1
randomCreature2.trainer = trainer2
randomCreature3.trainer = trainer3

creatureManager1.trainCreature(named: randomCreature1.name)
creatureManager1.trainCreature(named: randomCreature2.name)
creatureManager2.trainCreature(named: randomCreature3.name)
creatureManager2.trainCreature(named: randomCreature4.name)


creatureManager1.trainAllCreatures()
creatureManager2.trainAllCreatures()

print("Manager 1:")
for creature in creatureManager1.listCreatures() {
    print("creature is \(creature.name), Trainer name is\(creature.trainer?.name ?? "None") and  Experience is \(creature.experience)")
}
print("Manager 2:")
for creature in creatureManager2.listCreatures() {
    print("creature is \(creature.name), Trainer name is  \(creature.trainer?.name ?? "None") and  Experience is \(creature.experience)")
}

let leaderBoard = updateLeaderboard(players: [creatureManager1, creatureManager2])

print("LeaderBoard by power")
for (index, players) in leaderBoard.enumerated() {
    print("Rank \(index + 1):")
    
    for player in players.listCreatures() {
        print("\(player.name) - \(player.attack)")
    }
}

print(randomCreature1.trainer?.name ?? "No trainer")


randomCreature1.trainer = nil

print(randomCreature1.trainer?.name ?? "No trainer")



//MARK: 9. შექმენით BattleSimulator კლასი, რომელიც მართავს ორ DigitalCreature-ს შორის ბრძოლას.
//    * გამოიყენეთ weak/unowned მიმთითებლები სათანადოდ, რათა თავიდან აიცილოთ ე.წ memory leak.
//    * დაამატეთ მეთოდი simulateBattle(between creature1: DigitalCreature, and creature2: DigitalCreature) -> DigitalCreature, რომელიც დააბრუნებს გამარჯვებულს. მეთოდის ლოგიკას როგორს გააკეთებთ თქვენს ფანტაზიაზეა დამოკიდებული 🙌
//    * გამართეთ რამდენიმე ბრძოლა და დაბეჭდეთ შედეგები. 🤺

class BattleSimulator {
    
    func simulateBattle(between creature1: DigitalCreature, and creature2: DigitalCreature) -> DigitalCreature {
        print("Battle is starting between")
        print("\(creature1.name) and \(creature2.name)")
        
        var creature1Health: Double {
            creature2.attack - creature1.defense
        }
        
        var creature2Health: Double {
            creature1.attack - creature2.defense
        }
        
        if creature1Health > creature2Health {
            print("\(creature1.name) won!")
            return creature1
        } else if creature2Health > creature1Health {
            print("\(creature2.name) won!")
            return creature2
        } else {
            print("It's a draw!")
            return creature1
        }
    }
}


let creature1 = DigitalCreature(name: "Iron Man", type: .fire(rarity: 0.8), level: 5, experience: 200, health: 100, attack: 30, defense: 15)
let creature2 = DigitalCreature(name: "Captain America", type: .water(rarity: 0.6), level: 5, experience: 150, health: 100, attack: 54, defense: 18)

let battleSimulator = BattleSimulator()

let winner1 = battleSimulator.simulateBattle(between: creature1, and: creature2)

print("Final results:")
print("Winner of battle: \(winner1.name)")


