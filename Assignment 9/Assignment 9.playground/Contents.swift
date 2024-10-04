import UIKit



//MARK: 1. შექმენით "Genre" ტიპის enum, რომელიც შეიცავს წიგნის ჟანრებს (მაგ: fiction, nonFiction, mystery, sciFi, biography). დაამატეთ computed property "description", რომელიც დააბრუნებს ჟანრის აღწერას.

     
enum Genre {
    case fiction , nonFiction, mystery, sciFi, biography
    
    var description : String {
        switch self {
        case .fiction:
            return "Fiction books contain stories that are not based on real events."
        case .nonFiction:
            return "Non-fiction books provide factual information and are based on real events."
        case .mystery:
            return "Mystery books involve suspenseful plots, often centered around a crime or puzzle."
        case .sciFi:
            return "Science fiction books explore futuristic concepts, science, and technology."
        case .biography:
            return "Biography books are written accounts of someone's life, highlighting their experiences and achievements."
        }
    }
}

////MARK: 2. 2. შექმენით enum "ReadingLevel" მნიშვნელობებით: beginner, intermediate, advanced. შემდეგ შექმენით პროტოკოლი "Readable" შემდეგი მოთხოვნებით:
//
//- "title: String" ფროფერთი
//
//- "author: String" ფროფერთი
//
//- "publicationYear: Int" ფროფერთი
//
//- "readingLevel: ReadingLevel" ფროფერთი
//
//- "read()" მეთოდი, რომელიც დაბეჭდავს ინფორმაციას წიგნის წაკითხვის შესახებ, მაგ: "გილოცავთ თქვენ ერთ კლიკში წაიკითხეთ წიგნი" ან რამე სხვა, მიეცით ფანტაზიას გასაქანი 🤘


enum ReadingLevel: Hashable {
    case beginner
    case intermediate
    case advanced
}

protocol Readable {
    var title: String { get }
    var author: String { get }
    var publicationYear: Int { get }
    var readingLevel: ReadingLevel { get }
    
    func read()
}


//MARK: 3 შექმენით სტრუქტურა "Book", რომელიც დააკმაყოფილებს "Readable" პროტოკოლს. დაამატეთ "genre: Genre" ფროფერთი და "description()" მეთოდი, რომელიც დაბეჭდავს სრულ ინფორმაციას წიგნზე.


struct Book: Readable {
    var title: String
    var author: String
    var publicationYear: Int
    var readingLevel: ReadingLevel
    var genre: Genre
    
    func read() {
        print("Congratulations you read \(title) written by \(author)")
    }
    
    func description() {
        print("\(title) is written by \(author) and was released in \(publicationYear)")
        print("You need to be \(readingLevel) to read \(genre)")
    }
}


//MARK: 4. შექმენით "Library" კლასი შემდეგი ფროფერთებით:
//
//   - "name: String" - ბიბლიოთეკის სახელი
//
//   - "books: [Book]" - წიგნების მასივი
//
//
//
//   დაამატეთ მეთოდები:
//
//   - "add(book: Book)" - წიგნის დამატება
//
//   - "removeBookWith(title: String)" - წიგნის წაშლა სათაურის მიხედვით
//
//   - "listBooks()" - ყველა წიგნის ჩამონათვალის დაბეჭდვა
//
//
//  გააფართოეთ “Library” კლასი “filterBooks” მეთოდით რომელიც არგუმენტად მიიღებს ქლოჟერს და დააბრუნებს ამ ქლოჟერის გამოყენებით გაფილტრულ წიგნთა მასივს.

class Library {
    var name: String
    var books: [Book]
    
    init(name: String, books: [Book] = []) {
        self.name = name
        self.books = books
    }
    
    func addBook(_ book: Book) {
        books.append(book)
    }
    
    func removeBookWith(title: String) {
        books = books.filter { $0.title != title }
    }
    
    func listBooks() {
        for book in books {
            print("The list of all books: \n\(book.title)")
        }
    }
}


extension Library {
    func filterBooks(_ closure: (([Book]) -> [Book])) -> [Book] {
        return closure(books)
    }
}



//MARK: 5. შექმენით generic ფუნქცია groupBooksByLevel<T: Readable>(_ books: [T]) -> [ReadingLevel: [T]], რომელიც დააჯგუფებს წიგნებს კითხვის დონის მიხედვით. გამოიყენეთ ეს ფუნქცია ბიბლიოთეკის წიგნებზე და დაბეჭდეთ შედეგი.

func groupBooksByLevel<T: Readable>(_ books: [T]) -> [ReadingLevel: [T]] {
    var groupedBooks = [ReadingLevel: [T]]()
    
    for book in books {
        groupedBooks[book.readingLevel, default: []].append(book)
    }
    return groupedBooks
}

//MARK: 6. შექმენით "LibraryMember" კლასი შემდეგი ფროფერთებით:
//   - "id: Int"
//   - "name: String"
//   - "borrowedBooks: [Book]"

//   დაამატეთ მეთოდები:
//   - "borrowBook(_ book: Book, from library: Library)" - წიგნის გამოწერა ბიბლიოთეკიდან
//   - "returnBook(_ book: Book, to library: Library)" - წიგნის დაბრუნება ბიბლიოთეკაში

class LibraryMember {
    var id: Int
    var name: String
    var borrowedBooks: [Book]
    
    init(id: Int, name: String, borrowedBooks: [Book] = []) {
        self.id = id
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    
    func borrowBook(_ book: Book, from library: Library) {
        library.removeBookWith(title: book.title)
        borrowedBooks.append(book)
    }
    
    func returnBook(_ book: Book, to library: Library) {
        library.addBook(book)
        borrowedBooks = borrowedBooks.filter { $0.title != book.title }
    }
}

//MARK: 7. შექმენით მინიმუმ 5 "Book" ობიექტი და 1 "Library" ობიექტი. დაამატეთ წიგნები ბიბლიოთეკაში "add(book:)" მეთოდის გამოყენებით. შემდეგ:
//
//   - გამოიყენეთ "listBooks()" მეთოდი ყველა წიგნის ჩამოსათვლელად
//
//   - წაშალეთ ერთი წიგნი "removeBookWith(title:)" მეთოდის გამოყენებით
//
//   - გამოიყენეთ "filterBooks" მეთოდი და დაბეჭდეთ მხოლოდ ის წიგნები, რომლებიც გამოცემულია 2000 წლის შემდეგ

let book1 = Book(title: "The Catcher in the Rye", author: "J.D. Salinger", publicationYear: 1951, readingLevel: .intermediate, genre: .fiction)
let book2 = Book(title: "To Kill a Mockingbird", author: "Harper Lee", publicationYear: 1960, readingLevel: .intermediate, genre: .fiction)
let book3 = Book(title: "1984", author: "George Orwell", publicationYear: 1949, readingLevel: .advanced, genre: .sciFi)
let book4 = Book(title: "Harry Potter and the Sorcerer's Stone", author: "J.K. Rowling", publicationYear: 1997, readingLevel: .beginner, genre: .mystery)
let book5 = Book(title: "Steve Jobs", author: "Walter Isaacson", publicationYear: 2011, readingLevel: .advanced, genre: .biography)
let book6 = Book(title: "Nine stories", author: "J.D. Salinger", publicationYear: 1973, readingLevel: .beginner, genre: .fiction)

let books = [book1, book2, book3, book4, book5, book6]

let NationalLibrary = Library(name: "National library")


NationalLibrary.addBook(book1)
NationalLibrary.addBook(book2)
NationalLibrary.addBook(book3)
NationalLibrary.addBook(book4)
NationalLibrary.addBook(book5)
NationalLibrary.addBook(book6)

//printing list of books
NationalLibrary.listBooks()

let newLibrary = Library(name: "New library", books: books)

newLibrary.removeBookWith(title: "Steve Jobs")

for newbook in newLibrary.books {
    print("The remaining books are \(newbook.title)")
}


let booksSince2000 = books.filter { $0.publicationYear > 2000 }

for recent in booksSince2000 {
    print("This books are published after year 2000: \n\(recent.title)")
}


//exercise 4 example

let georgianLibrary = Library(name: "Georgian library", books: books)

let filterForThisYear = 1996
var filterdBooks = georgianLibrary.filterBooks { filteredBook in
    return filteredBook.filter { book in
        book.publicationYear > filterForThisYear
    }
}
print("Books published after 1996:")
for book in filterdBooks {
    print("\(book.title) by \(book.author)")
}

//exercise 5 example
let groupedBooks = groupBooksByLevel(georgianLibrary.books)

print("Books grouped by reading level:")
for (level, books) in groupedBooks {
    print("\(level) level:")
    for book in books {
        print("* \(book.title) by \(book.author)")
    }
}

//MARK: 8.  შექმენით მინიმუმ 2 "LibraryMember" ობიექტი. თითოეული წევრისთვის:
//- გამოიწერეთ 2 წიგნი "borrowBook(_:from:)" მეთოდის გამოყენებით
//- დააბრუნეთ 1 წიგნი "returnBook(_:to:)" მეთოდის გამოყენებით
//დაბეჭდეთ თითოეული წევრის გამოწერილი წიგნების სია

let townLibrary = Library(name: "Town Library", books: books)

let member1 = LibraryMember(id: 10032, name: "Steph")
let member2 = LibraryMember(id: 13300, name: "Lebron")

//member 1 borrowing 2 books
member1.borrowBook(book1, from: townLibrary)
member1.borrowBook(book2, from: townLibrary)



print("Member 1 borrowed books:")
for book in member1.borrowedBooks {
    print(book.title)
}

//member 2 borrowing 2 books
member2.borrowBook(book3, from: townLibrary)
member2.borrowBook(book4, from: townLibrary)

print("Member 2 borrowed books:")
for book in member2.borrowedBooks {
    print(book.title)
}

//returning a book
member1.returnBook(book1, to: townLibrary)


for book in member1.borrowedBooks {
    print("member 1 all borrowed books after returning borrowed book is:",book.title)
}


//MARK: 9.  გააფართოვეთ "Array" ტიპი, სადაც ელემენტი აკმაყოფილებს "Readable" პროტოკოლს (ანუ ამ ექსთენშენი მოცემული მეთოდები ხელმსიაწვდომი იქნება მხოლოდ [Readable] მასივისთვის), შემდეგი მეთოდებით:
//
//- "findByAuthor(_ author: String) -> [Readable]" - აბრუნებს ავტორის მიხედვით ნაპოვნ წიგნებს
//
//- "oldestBook() -> Readable?" - აბრუნებს ყველაზე ძველ წიგნს


 
extension Array where Element: Readable {
    
    func findByAuthor(_ author: String) -> [Readable] {
        return self.filter { $0.author == author }
    }
    
    func oldestBook() -> Readable? {
        return self.min { $0.publicationYear < $1.publicationYear }
    }
}

let findByAuthor = books.findByAuthor("George Orwell")

print("Book by author is")
for book in findByAuthor {
    print(book.title)
}

if let oldestBook = books.oldestBook() {
    print("The oldest book is \(oldestBook.title) published in \(oldestBook.publicationYear).")
}

//MARK: 10 შექმენით "EBook" სტრუქტურა, რომელიც დააკმაყოფილებს "Readable" პროტოკოლს და დაამატეთ "fileSize: Double" ფროფერთი.

//  გამოიყენეთ "extension", რომ დაამატოთ "printDetails()" მეთოდი, რომელიც დაბეჭდავს ელექტრონული წიგნის დეტალებს.
//
//  შექმენით მინიმუმ 2 "EBook" ობიექტი და გამოიძახეთ "printDetails()" მეთოდი თითოეულისთვის.


struct EBook: Readable {
    var title: String
    var author: String
    var publicationYear: Int
    var readingLevel: ReadingLevel
    var fileSize: Double
    
    func read() {
        print("you have read \(title)")
    }
}

extension EBook {
    func printDetails() {
        print("EBook Title: \(title)")
        print("Author: \(author)")
        print("Publication Year: \(publicationYear)")
        print("Reading Level: \(readingLevel)")
        print("File Size: \(fileSize) MB")
    }
}


let ebook1 = EBook(title: "New world", author: "Jack", publicationYear: 2000, readingLevel: .advanced, fileSize: 12.1)
let ebook2 = EBook(title: "Old world", author: "Nick", publicationYear: 2012, readingLevel: .intermediate, fileSize: 144.2)

ebook1.printDetails()

//MARK: 11  შექმენით ჯენერიკ ფუნქცია "findMostFrequent<T: Hashable>(_ array: [T]) -> T?", რომელიც იპოვის და დააბრუნებს მასივში ყველაზე ხშირად გამეორებულ ელემენტს. თუ რამდენიმე ელემენტი თანაბრად ხშირად მეორდება, დააბრუნეთ პირველი მათგანი.

extension Array where Element: Hashable {
    func findMostFrequent<T: Hashable>(_ array: [T]) -> T? {
        var mostFrequent = [T: Int]()
        array.map { mostFrequent[$0, default: 0] += 1 }
        return mostFrequent.max{ $0.value < $1.value }?.key
    }
}
let array = [1, 3, 4, 4, 4, 4, 4, 5, 6, 6, 6, 6, 3, 22, 2, 2, 2]

if let frequent = array.findMostFrequent(array) {
    print("The most frequent number is:", frequent )
}

//MARK: 12. შექმენით მასივი, რომელიც შეიცავს ყველა წიგნის ავტორს მე-7 დავალებაში შექმნილი ბიბლიოთეკიდან.

//გამოიძახეთ "findMostFrequent" ფუნქცია ამ მასივზე, რათა იპოვოთ ყველაზე პოპულარული ავტორი.
//დაბეჭდეთ შედეგი: "ბიბლიოთეკაში ყველაზე პოპულარული ავტორი არის: [ავტორის სახელი]".

let bookAuthors = books.map { $0.author }

if let frequentAuthor = bookAuthors.findMostFrequent(bookAuthors) {
    print("The most frequent author is:",frequentAuthor)
}



