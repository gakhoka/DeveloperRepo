import UIKit

//MARK: 1. შექმენით FoodGroup Enum, რომელიც მოიცავს: fruit, vegetable, protein, dairy, grain ჩამონათვალს.

enum FoodGroup {
    case fruit, vegetable, protein, dairy, grain
}

//MARK: 2. შექმენით enum ProductStatus (გაყიდულია, ხელმისაწვდლომია ქეისებით)

enum ProductStatus {
    case sold
    case available
}

//MARK: 3. შექმენით სტრუქტურა Product რომელიც შეიცავს ცვლადებს: name, category(FoodGroup), price, info(რომელიც ფასის და სახელის ინფოს მოგვაწვდის), ფასდაკლება, მასა, კალორია100გრამზე, ProductStatus ცვლადი ფუნქციები: ფადაკლებული ფასის ჩვენება, ყიდვა, გამოითვალე კალორია მასაზე დაყრდნობით.


struct Product {
    var name: String
    var category: FoodGroup
    var price: Double
    var discount: Double
    var weight: Double
    var caloriesPerHundredGrams: Double
    var status: ProductStatus
    
    
    var info: String {
        "\(name) ფასი არის \(price)"
    }
    
    
    func discountedPrice() -> Double {
        price - (price * (discount / 100))
    }
    
    mutating func buyProduct() {
        switch status {
        case .available:
            status = .sold
            print("\(name) ხელმისაწვდომია!")
        case .sold:
            print("\(name) გაყიდულია.")
        }
    }
    
    func calculateCalories() -> Double {
        caloriesPerHundredGrams / 100 * weight
    }
}

var newFood = Product(name: "Almond", category: FoodGroup.fruit, price: 33, discount: 20, weight: 2, caloriesPerHundredGrams: 3040, status: .available)

print(newFood.info)

print("ამ საჭმელს აქვს \(newFood.calculateCalories()) კალორია")

newFood.buyProduct()

print("ფასდაკლებული ფასია \(newFood.discountedPrice())")

newFood.buyProduct()



//MARK: 4 .შექმენით მასივი პროდუქტებით სადაც მინიმუმ 15 პროდუქტი გექნებათ.



var products: [Product] = [
    Product(name: "ვაშლი", category: .fruit, price: 2.0, discount: 5.0, weight: 300, caloriesPerHundredGrams: 52, status: .available),
    Product(name: "ბანანი", category: .fruit, price: 3.5, discount: 10.0, weight: 200, caloriesPerHundredGrams: 89, status: .available),
    Product(name: "გოგრა", category: .vegetable, price: 4.0, discount: 10.0, weight: 500, caloriesPerHundredGrams: 26, status: .available),
    Product(name: "კარტოფილი", category: .vegetable, price: 2.0, discount: 7.0, weight: 1000, caloriesPerHundredGrams: 77, status: .available),
    Product(name: "ქათმის ხორცი", category: .protein, price: 12.0, discount: 20.0, weight: 800, caloriesPerHundredGrams: 239, status: .sold),
    Product(name: "კვერცხი", category: .protein, price: 0.5, discount: 24.0, weight: 60, caloriesPerHundredGrams: 155, status: .available),
    Product(name: "რძე", category: .dairy, price: 1.2, discount: 22.0, weight: 1000, caloriesPerHundredGrams: 42, status: .available),
    Product(name: "ყველი", category: .dairy, price: 7.0, discount: 5.0, weight: 250, caloriesPerHundredGrams: 402, status: .available),
    Product(name: "პური", category: .grain, price: 1.5, discount: 10.0, weight: 500, caloriesPerHundredGrams: 265, status: .available),
    Product(name: "ბროკოლი", category: .vegetable, price: 3.5, discount: 14.0, weight: 1000, caloriesPerHundredGrams: 350, status: .sold),
    Product(name: "მარწყვი", category: .fruit, price: 5.0, discount: 25.0, weight: 300, caloriesPerHundredGrams: 32, status: .available),
    Product(name: "სტაფილო", category: .vegetable, price: 2.5, discount: 24.0, weight: 400, caloriesPerHundredGrams: 41, status: .available),
    Product(name: "პომიდორი", category: .vegetable, price: 3.5, discount: 24.0, weight: 500, caloriesPerHundredGrams: 18, status: .available),
    Product(name: "თევზი", category: .protein, price: 10.0, discount: 15.0, weight: 600, caloriesPerHundredGrams: 206, status: .available),
    Product(name: "შვრია", category: .grain, price: 4.0, discount: 23.0, weight: 500, caloriesPerHundredGrams: 389, status: .available)
]

//MARK: 5. მიღებული მასივისგან შექმენით ახალი მასივი სადაც მხოლოდ პროდუქტის name იქნება ჩამოწერილი

let productNames = products.map { $0.name }
print(productNames)


//MARK: 6 . თავდაპირველი მასივის ელემენტები დაალაგეთ ფასის ზრდადობის მიხედვით.

let sortedByPrice = products.sorted { $0.price < $1.price }

for product in sortedByPrice {
    print("\(product.name) ღირს \(product.price) ლარი")
}

//MARK: 7. რენდომ (1)კატეგორიის ყველა პროდუქტის სტატუსი შეცვალეთ ხელმისაწვდომიდან გაყიდულზე.


products = products.map { product in
    var newProduct = product
    if newProduct.category == .vegetable {
        newProduct.status = .sold
        print("\(newProduct.name) არის \(newProduct.status)")
    }
    return newProduct
}



//MARK: 8. გაიგეთ ყველა იმ პროდუქტის ერთეულის ჯამური ღირებულება რომელიც ხელმისაწვდომია.


let totalAvailableValue = products
    .filter { $0.status == .available }
    .reduce(0.0) { $0 + $1.price }

print("ყველა ხელმისაწვდომი პროდუქტის ჯამური ღირებულებაა \(totalAvailableValue)")

//MARK: 9. შექმენით ფუნქცია რომელიც მიიღებს პროდუქტების მასივს და დააბრუნებს dictionary-ს სადაც key იქნება კატეგორიის სახელწოდება და value იქნება იმ პროდუქტების მასივი რომლებიც შეესაბამება მოცემულ კატეგორიას.

func categorize(products: [Product]) -> [FoodGroup: [Product]] {
    let newProduct = products.reduce(into: [FoodGroup: [Product]]()) { result, product in
        result[product.category, default: []].append(product)
    }
    print(newProduct)
    return newProduct
}

let categorizedProducts = categorize(products: products)

for (category, products) in categorizedProducts {
    print("კატეგორია: \(category)")
    for product in products {
        print(" - \(product.name)")
    }
}



