import UIKit


//MARK: 1. შექმენით Genre ტიპის enum, რომელიც შეიცავს ფილმის ჟანრებს, მაგალითად: action, drama, comedy, thriller და სხვა. შექმენით ძირითადი კლასი Film, რომელსაც ექნება შემდეგი თვისებები:
//title - ფილმის სახელი,
//releaseYear— გამოშვების წელი,
//genre — ფილმის ჟანრი,
//revenue - შემოსავალი
//მეთოდი description(), რომელიც დაბეჭდავს ინფორმაციას ფილმზე.

enum Genre {
    case action, drama, comedy, thriller, horror, scifi
}

class Film {
    var title: String
    var releaseYear: Int
    var genre: Genre
    var revenue: Double
    
    init(title: String, releaseYear: Int, genre: Genre, revenue: Double) {
        self.title = title
        self.releaseYear = releaseYear
        self.genre = genre
        self.revenue = revenue
    }
    
    func description() {
        print("\(title) is \(genre) and was released in \(releaseYear)")
    }
    
    static func removeFilm(from films: [Film], named: String) -> [Film] {
        films.filter { $0.title != named}
    }
}

//MARK: 2.  შექმენით კლასი Person, რომელსაც აქვს შემდეგი თვისებები:
//name — პიროვნების სახელი
//birthYear — დაბადების წელი.
//მეთოდი getAge რომელიც დაიანგარიშებს და დააბრუნებს ამ პიროვნების ასაკს მოცემულ წელს.


class Person {
    var name: String
    var birthYear: Int
    
    init(name: String, birthYear: Int) {
        self.name = name
        self.birthYear = birthYear
    }
    
    func getAge(currentDate: Int) -> Int {
        currentDate - birthYear
    }
}


//MARK: 3. Film კლასში შექმენით ფუნქცია removeFilm რომელიც პარამეტრად მიიღებს ფილმების მასივს და დასახელებას, ფუნქციამ უნდა წაშალოს მასივში თუ მოიძებნა მსგავსი დასახელების ფილმი.


//MARK: 4 შექმენით კლასი Actor, რომელიც არიას Person კლასის მემკვიდრე კლასი Actor-ს უნდა ჰქონდეს actedFilms  მსახიობის მიერ ნათამაშები ფილმების სია და მეთოდი რომელიც მსახიობის მიერ ნათამაშებ ფილმებს დაამატებს სიაში.

final class Actor: Person {
    var actedFilms: [Film]
    
    
    init(name: String, birthYear: Int, actedFilms: [Film] = [] ) {
        self.actedFilms = actedFilms
        super.init(name: name, birthYear: birthYear)
    }
    
    func addMovie(_ movie: Film) {
        actedFilms.append(movie)
    }
}

//MARK: 5. შექმენი Director კლასი, რომელიც ასევე Person-ის მემკვიდრეა და ექნება directedFilms რეჟისორის მიერ გადაღებული ფილმების სია და totalRevenue რეჟისორის ჯამური შემოსავალი. დაამატე მეთოდი რომელიც რეჟისორის მიერ გადაღებულ ფილმებს დაამატებს და დაითვლის თითოეული ფილმისთვის ჯამურ შემოსავალს.

final class Director: Person {
    var directedFilms: [Film]
    var totalRevenue: Double
    
    init(name: String, birthYear: Int, directedFilms: [Film], totalRevenue: Double = 0.0) {
        self.directedFilms = directedFilms
        self.totalRevenue = totalRevenue
        super.init(name: name, birthYear: birthYear)
    }
    
    func totalRevenuefrom(movie: Film) -> Double {
        directedFilms.append(movie)
        let revenue = movie.revenue
        totalRevenue += revenue
        return revenue
    }
}



//MARK: 6. შექმენით 5 ფილმის და 5 მსახიობის ობიექტები და Dictionary, რომელშიც key იქნება მსახიობის სახელი, ხოლო მნიშვნელობებად მიიღებს იმ ფილმების სიას, რომლებშიც მონაწილეობს ეს მსახიობი.

let film1 = Film(title: "Inception", releaseYear: 2010, genre: .scifi, revenue: 829.000)
let film2 = Film(title: "Titanic", releaseYear: 1997, genre: .drama, revenue: 187.000)
let film3 = Film(title: "The Matrix", releaseYear: 1999, genre: .scifi, revenue: 463.000)
let film4 = Film(title: "The Wolf of Wall Street", releaseYear: 2013, genre: .drama, revenue: 920.000)
let film5 = Film(title: "John Wick", releaseYear: 2014, genre: .action, revenue: 860.000)

let actor1 = Actor(name: "Leonardo DiCaprio", birthYear: 1974)
let actor2 = Actor(name: "Keanu Reeves", birthYear: 1964)
let actor3 = Actor(name: "Kate Winslet", birthYear: 1975)
let actor4 = Actor(name: "Matthew McConaughey", birthYear: 1969)
let actor5 = Actor(name: "Joseph Gordon-Levitt", birthYear: 1981)

actor1.addMovie(film1)
actor1.addMovie(film2)
actor1.addMovie(film4)

actor2.addMovie(film3)
actor2.addMovie(film5)

actor3.addMovie(film2)

actor4.addMovie(film4)

actor5.addMovie(film1)

var actorFilmography: [String: [Film]] = [
    actor1.name: actor1.actedFilms,
    actor2.name: actor2.actedFilms,
    actor3.name: actor3.actedFilms,
    actor4.name: actor4.actedFilms,
    actor5.name: actor5.actedFilms
]

for (name , movies) in actorFilmography {
    print("\(name) played in: ")
    for movie in movies {
        movie.description()
    }
}

//removing movie from films array

let films: [Film] = [film5, film3, film2 , film1 ,film4]
print(films)


let filtered = Film.removeFilm(from: films, named: "Inception")

let movies = filtered.map { $0.title }
print(movies)


//Director of The Sopranos <333


let director1 = Director(name: "David Chase", birthYear: 1945, directedFilms: films)
let ageOfDirector = director1.getAge(currentDate: 2024)
let revenueFromMovie = director1.totalRevenuefrom(movie: film5)



//MARK: 7.  გამოიყენეთ map, იმისთვის რომ დაბეჭდოთ ყველა ფილმის სათაურების სია ამავე ფილმების მასივიდან



let titlesOnly = films.map { $0.title }

print(titlesOnly)

// second option

titlesOnly.forEach { title in
    print(title)
}



//MARK: 8. reduce ფუნქციის გამოყენებით დაიანგარიშეთ ამ ყველა ფილმების გამოშვების საშუალო წელი.

let releaseDates = films.map { $0.releaseYear }
let averageOfRelxaseDates = releaseDates.reduce(0,+) / films.count

print("Average movie release year is \(averageOfRelxaseDates)")

//MARK: 9. შექმენით კლასი SuperHero, რომელიც შეიცავს შემდეგ ველებს:
//name სუპერ გმირის სახელი
//superPower  სუპერ ძალა
//level - PowerLevel enum-ის ტიპის,
//და allies ამავე ტიპის მოკავშირეების ჩამონათვალი,
//დაამატეთ ინიციალიზაციის და დეინიციალიზაციის მეთოდები



class SuperHero {
    var name: String
    var superPower: String
    var level: PowerLevel
    var allies: [SuperHero]
    
    init(name: String, superPower: String, level: PowerLevel, allies: [SuperHero] = []) {
        self.name = name
        self.superPower = superPower
        self.level = level
        self.allies = allies
        print("\(name) is \(level) superhero")
    }
    
    deinit {
        print("avengers lost in infinity war")
    }
    
    static func uniquePowers(_ heroes: [SuperHero]) -> [String] {
        let powers = heroes.map { $0.superPower }
        return Array(Set(powers))
    }
    
    func addAlly(_ hero: SuperHero) {
        allies.append(hero)
    }
}

//MARK: 10. შექმენით Enum PowerLevel, რომელიც მოიცავს შემდეგ დონეებს: weak, average, strong, super და დაამატეთ აღწერის მეთოდი რომელიც დააბრუნებს level-ს ტექსტური ფორმით.

enum PowerLevel {
    case weak, average, strong, `super`
    
    func description()  {
        switch self {
        case .weak:
            "weak"
        case .average:
            "average"
        case .strong:
            "strong"
        case .`super`:
            "super"
        }
    }
}

//MARK: 11  uniquePowers ყველა გმირისათვის და დააბრუნებს  უნიკალური ძალების სიას


//MARK: 12. მეთოდი addAlly დაამატებს მოკავშირეების სიას, შექმენით 2 SuperHero ობიექტი და გახადეთ ისინი მოკავშირეები.


let captainAmerica = SuperHero(name: "Steve Rogers", superPower: "Fighting", level: .super)
let ironMan = SuperHero(name: "Tony Stark", superPower: "Genious", level: .strong)

captainAmerica.addAlly(ironMan)


// 11 examples

let hero1 = SuperHero(name: "Thor", superPower: "Thunder", level: .super)
let hero2 = SuperHero(name: "Scarlett witch", superPower: "Magic", level: .strong) // hero with magic
let hero3 = SuperHero(name: "Black widow", superPower: "Fighting", level: .average)
let hero4 = SuperHero(name: "Thanos", superPower: "Wisdom", level: .strong)
let hero5 = SuperHero(name: "Loki", superPower: "Magic", level: .average) // hero with magic


let allheroes = [captainAmerica, ironMan, hero1, hero2, hero3, hero4]
let uniquePowers = SuperHero.uniquePowers(allheroes)

for power in uniquePowers {
    print("Unique power \n \(power)")
}

