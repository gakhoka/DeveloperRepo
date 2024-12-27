//
//  RiddleExamples.swift
//  Assignment 35
//
//  Created by Giorgi Gakhokidze on 27.12.24.
//

import Foundation

struct RiddleManager {
    func loadCategories() -> [RiddleCategory] {
        return [
            RiddleCategory(name: "TV Shows", riddles: [
                Riddle(emojis: "👮‍♂️🚓🔫💼", answers: ["Breaking Bad", "Sherlock", "Dexter", "Narcos"], reward: 15, level: 1, hint: "A crime drama", correctAnswer: "Sherlock"),
                Riddle(emojis: "🧙‍♂️💍⚔️🌍", answers: ["Lord of the Rings", "Game of Thrones", "Stranger Things", "The Witcher"], reward: 20, level: 2, hint: "Fantasy epic", correctAnswer: "Lord of the Rings"),
                Riddle(emojis: "👑💍⚔️🐉", answers: ["House of Cards", "Game of Thrones", "Breaking Bad", "The Crown"], reward: 25, level: 3, hint: "Royal intrigue and dragons", correctAnswer: "Game of Thrones"),
                Riddle(emojis: "👨‍🍳🍕🍔🍟", answers: ["Top Chef", "Hell's Kitchen", "Kitchen Nightmares", "MasterChef"], reward: 18, level: 4, hint: "Cooking competition", correctAnswer: "MasterChef"),
                Riddle(emojis: "👩‍🚀🌌🚀🛸", answers: ["The Mandalorian", "Lost in Space", "Space Force", "Star Trek"], reward: 22, level: 5, hint: "Space adventures", correctAnswer: "Star Trek"),
                Riddle(emojis: "🏠🛋️👨‍👩‍👧‍👦💑", answers: ["How I Met Your Mother", "Big Bang Theory", "Friends", "The Office"], reward: 16, level: 6, hint: "Sitcom about a group of friends", correctAnswer: "Friends"),
                Riddle(emojis: "🧟‍♂️💀🍳🔪", answers: ["Stranger Things", "The 100", "The Walking Dead", "Dexter"], reward: 20, level: 7, hint: "Zombie apocalypse", correctAnswer: "The Walking Dead"),
                Riddle(emojis: "🐍📚👓🧙‍♂️", answers: ["The Witcher", "Stranger Things", "Harry Potter", "Game of Thrones"], reward: 18, level: 8, hint: "A magical world", correctAnswer: "Harry Potter"),
                Riddle(emojis: "🔬💡🧑‍🔬📡", answers: ["Stranger Things", "Fringe", "The X-Files", "Big Bang Theory"], reward: 19, level: 9, hint: "Sci-fi sitcom", correctAnswer: "Big Bang Theory"),
                Riddle(emojis: "💀⚖️🔪🔍", answers: ["Sherlock", "True Detective", "Dexter", "The Mentalist"], reward: 25, level: 10, hint: "A serial killer with a twist", correctAnswer: "Dexter")
            ]),

            
            RiddleCategory(name: "Holidays", riddles: [
                Riddle(emojis: "🎄🎁❄️⛄", answers: ["Hanukkah", "Christmas", "New Year's Eve", "Thanksgiving"], reward: 15, level: 1, hint: "A holiday with a tree and gifts", correctAnswer: "Christmas"),
                Riddle(emojis: "🎃👻🕸️🍬", answers: ["Valentine's Day", "Halloween", "Christmas", "Easter"], reward: 20, level: 2, hint: "Spooky fun and costumes", correctAnswer: "Halloween"),
                Riddle(emojis: "🍴🍗🍰🎉", answers: ["Halloween", "Easter", "Thanksgiving", "Christmas"], reward: 18, level: 3, hint: "A holiday with turkey", correctAnswer: "Thanksgiving"),
                Riddle(emojis: "💘🌹❤️🎁", answers: ["Easter", "Mother's Day", "Valentine's Day", "Christmas"], reward: 12, level: 4, hint: "A holiday for lovers", correctAnswer: "Valentine's Day"),
                Riddle(emojis: "🍾🎉🕛🎆", answers: ["Fourth of July", "New Year's Eve", "Christmas", "Halloween"], reward: 25, level: 5, hint: "Celebrate at midnight", correctAnswer: "New Year's Eve"),
                Riddle(emojis: "🐰🥚🌸💐", answers: ["Christmas", "Valentine's Day", "Easter", "Thanksgiving"], reward: 20, level: 6, hint: "A holiday with bunnies and eggs", correctAnswer: "Easter"),
                Riddle(emojis: "🇺🇸🎆🍔🥤", answers: ["Memorial Day", "Fourth of July", "Labor Day", "New Year's Eve"], reward: 30, level: 7, hint: "A holiday with fireworks and BBQs", correctAnswer: "Fourth of July"),
                Riddle(emojis: "🌹🍽️💐🛍️", answers: ["Easter", "Mother's Day", "Christmas", "Valentine's Day"], reward: 15, level: 8, hint: "A holiday for moms", correctAnswer: "Mother's Day"),
                Riddle(emojis: "🌍🌱🌳💚", answers: ["Earth Day", "Christmas", "Halloween", "New Year's Eve"], reward: 18, level: 9, hint: "A holiday to celebrate nature", correctAnswer: "Earth Day"),
                Riddle(emojis: "🎶🎆🎤🎉", answers: ["Christmas", "New Year's Eve", "Halloween", "Easter"], reward: 22, level: 10, hint: "A holiday with songs and countdowns", correctAnswer: "New Year's Eve")
            ]),
            
            
            RiddleCategory(name: "Holidays", riddles: [
                Riddle(emojis: "🎄🎁❄️⛄", answers: ["Christmas", "Hanukkah", "Thanksgiving", "New Year's Eve"], reward: 15, level: 1, hint: "A holiday with a tree and gifts", correctAnswer: "Christmas"),
                Riddle(emojis: "🎃👻🕸️🍬", answers: ["Halloween", "Easter", "Christmas", "Valentine's Day"], reward: 20, level: 2, hint: "Spooky fun and costumes", correctAnswer: "Halloween"),
                Riddle(emojis: "🍴🍗🍰🎉", answers: ["Thanksgiving", "Christmas", "Easter", "Halloween"], reward: 18, level: 2, hint: "A holiday with turkey", correctAnswer: "Thanksgiving"),
                Riddle(emojis: "💘🌹❤️🎁", answers: ["Valentine's Day", "Christmas", "Easter", "Mother's Day"], reward: 12, level: 1, hint: "A holiday for lovers", correctAnswer: "Valentine's Day"),
                Riddle(emojis: "🍾🎉🕛🎆", answers: ["New Year's Eve", "Christmas", "Fourth of July", "Halloween"], reward: 25, level: 3, hint: "Celebrate at midnight", correctAnswer: "New Year's Eve"),
                Riddle(emojis: "🐰🥚🌸💐", answers: ["Easter", "Christmas", "Thanksgiving", "Valentine's Day"], reward: 20, level: 2, hint: "A holiday with bunnies and eggs", correctAnswer: "Easter"),
                Riddle(emojis: "🇺🇸🎆🍔🥤", answers: ["Fourth of July", "New Year's Eve", "Labor Day", "Memorial Day"], reward: 30, level: 4, hint: "A holiday with fireworks and BBQs", correctAnswer: "Fourth of July"),
                Riddle(emojis: "🌹🍽️💐🛍️", answers: ["Mother's Day", "Valentine's Day", "Easter", "Christmas"], reward: 15, level: 2, hint: "A holiday for moms", correctAnswer: "Mother's Day"),
                Riddle(emojis: "🌍🌱🌳💚", answers: ["Earth Day", "Christmas", "New Year's Eve", "Halloween"], reward: 18, level: 3, hint: "A holiday to celebrate nature", correctAnswer: "Earth Day"),
                Riddle(emojis: "🎶🎆🎤🎉", answers: ["New Year's Eve", "Christmas", "Easter", "Halloween"], reward: 22, level: 3, hint: "A holiday with songs and countdowns", correctAnswer: "New Year's Eve")
            ]),

            
            RiddleCategory(name: "Anime", riddles: [
                Riddle(emojis: "🐍⚔️👑", answers: ["Naruto", "One Piece", "Attack on Titan", "Bleach"], reward: 10, level: 1, hint: "Ninjas and powerful chakra", correctAnswer: "Naruto"),
                Riddle(emojis: "🍥🎣💀", answers: ["Bleach", "Dragon Ball Z", "Hunter x Hunter", "One Piece"], reward: 15, level: 2, hint: "Soul Reapers and spirits", correctAnswer: "Bleach"),
                Riddle(emojis: "🌍👽🚀", answers: ["Space Dandy", "Attack on Titan", "Cowboy Bebop", "Trigun"], reward: 20, level: 3, hint: "Bounty hunters in space", correctAnswer: "Cowboy Bebop"),
                Riddle(emojis: "⚡🦸‍♂️💡", answers: ["My Hero Academia", "One Punch Man", "Death Note", "Naruto"], reward: 25, level: 4, hint: "Heroic powers and students", correctAnswer: "My Hero Academia"),
                Riddle(emojis: "🐉🔥👑", answers: ["Dragon Ball Z", "Fullmetal Alchemist", "Attack on Titan", "Naruto"], reward: 30, level: 5, hint: "Super Saiyans and powerful fights", correctAnswer: "Dragon Ball Z"),
                Riddle(emojis: "🦇🧛‍♂️💀", answers: ["Tokyo Ghoul", "Vampire Knight", "Attack on Titan", "Tokyo Revengers"], reward: 40, level: 6, hint: "Monsters and dark themes", correctAnswer: "Tokyo Ghoul"),
                Riddle(emojis: "💍⚔️🌍", answers: ["Lord of the Rings", "Fullmetal Alchemist", "Attack on Titan", "Naruto"], reward: 50, level: 7, hint: "Alchemy and the pursuit of a philosopher’s stone", correctAnswer: "Fullmetal Alchemist"),
                Riddle(emojis: "🧑‍🎤🎸🎤", answers: ["Nodame Cantabile", "Your Lie in April", "Beck", "K-On!"], reward: 60, level: 8, hint: "Music and emotional storytelling", correctAnswer: "Your Lie in April"),
                Riddle(emojis: "🧠💻🕵️‍♂️", answers: ["Death Note", "Code Geass", "Naruto", "Steins;Gate"], reward: 70, level: 9, hint: "Smart tactics and a notebook", correctAnswer: "Death Note"),
                Riddle(emojis: "⚔️👑🐉", answers: ["Attack on Titan", "Game of Thrones", "Berserk", "The Seven Deadly Sins"], reward: 80, level: 10, hint: "Epic battles and dragons", correctAnswer: "Berserk")
            ]),

            RiddleCategory(name: "Websites", riddles: [
                Riddle(emojis: "🔍🌐📚", answers: ["Google", "Yahoo", "Bing", "DuckDuckGo"], reward: 10, level: 1, hint: "A search engine giant", correctAnswer: "Google"),
                
                Riddle(emojis: "🛒💳💻", answers: ["Amazon", "Ebay", "Shopify", "AliExpress"], reward: 15, level: 2, hint: "An e-commerce platform", correctAnswer: "Amazon"),
                
                Riddle(emojis: "🐦💬", answers: ["Twitter", "Reddit", "Instagram", "Facebook"], reward: 20, level: 3, hint: "A social media platform known for short posts", correctAnswer: "Twitter"),
                
                Riddle(emojis: "📸🎨", answers: ["Instagram", "Pinterest", "Flickr", "500px"], reward: 25, level: 4, hint: "A photo sharing platform", correctAnswer: "Instagram"),
                
                Riddle(emojis: "📚📝", answers: ["Wikipedia", "Quora", "Medium", "StackOverflow"], reward: 30, level: 5, hint: "A user-generated online encyclopedia", correctAnswer: "Wikipedia"),
                
                Riddle(emojis: "🎥📱🖥️", answers: ["YouTube", "Vimeo", "Dailymotion", "Twitch"], reward: 20, level: 6, hint: "A platform for video sharing", correctAnswer: "YouTube"),
                
                Riddle(emojis: "🖥️💻📧", answers: ["Gmail", "Outlook", "Yahoo Mail", "ProtonMail"], reward: 18, level: 7, hint: "A popular email service provider", correctAnswer: "Gmail"),
                
                Riddle(emojis: "🎮👾🌐", answers: ["Twitch", "Steam", "Epic Games", "YouTube Gaming"], reward: 25, level: 8, hint: "A platform for live streaming video games", correctAnswer: "Twitch"),
                
                Riddle(emojis: "🏠🖥️🌐", answers: ["HomePage", "Website", "Landing Page", "Portal"], reward: 15, level: 9, hint: "The main page of a website", correctAnswer: "HomePage"),
                
                Riddle(emojis: "🖥️🌐🔍", answers: ["Website", "Webpage", "Homepage", "Search Engine"], reward: 15, level: 10, hint: "A collection of pages on the internet", correctAnswer: "Website")
            ]),

            
            
            RiddleCategory(name: "Books", riddles: [
                Riddle(emojis: "📚📖🧙‍♂️💍", answers: ["The Lord of the Rings", "Harry Potter", "The Hobbit", "The Silmarillion"], reward: 20, level: 1, hint: "Epic fantasy tale", correctAnswer: "The Lord of the Rings"),
                
                Riddle(emojis: "🦄🌟✨📖", answers: ["Harry Potter", "The Chronicles of Narnia", "Percy Jackson", "The Wizard of Oz"], reward: 15, level: 2, hint: "Magical world of wizards", correctAnswer: "Harry Potter"),
                
                Riddle(emojis: "👑⚔️🛡️📚", answers: ["A Game of Thrones", "Lord of the Rings", "The Witcher", "The Name of the Wind"], reward: 25, level: 3, hint: "Political intrigue and dragons", correctAnswer: "A Game of Thrones"),
                
                Riddle(emojis: "🧛‍♂️🦇🌕📖", answers: ["Dracula", "Twilight", "Interview with the Vampire", "The Vampire Chronicles"], reward: 18, level: 4, hint: "Vampires and gothic horror", correctAnswer: "Dracula"),
                
                Riddle(emojis: "🕵️‍♂️🔍💼📖", answers: ["Sherlock Holmes", "The Girl with the Dragon Tattoo", "The Secret Adversary", "Murder on the Orient Express"], reward: 15, level: 5, hint: "Famous detective stories", correctAnswer: "Sherlock Holmes"),
                
                Riddle(emojis: "🍎🔴💀📖", answers: ["Snow White", "Red Riding Hood", "Beauty and the Beast", "Cinderella"], reward: 10, level: 6, hint: "Fairy tale with a poisoned apple", correctAnswer: "Snow White"),
                
                Riddle(emojis: "🦁👑🌍📖", answers: ["The Lion King", "The Jungle Book", "The Chronicles of Narnia", "The Wizard of Oz"], reward: 20, level: 7, hint: "Animals and fantasy kingdom", correctAnswer: "The Chronicles of Narnia"),
                
                Riddle(emojis: "🎩🐇⏰📖", answers: ["Alice in Wonderland", "Peter Pan", "The Wizard of Oz", "Through the Looking Glass"], reward: 12, level: 8, hint: "A fantastical journey through a rabbit hole", correctAnswer: "Alice in Wonderland"),
                
                Riddle(emojis: "🏞️👣⛺📖", answers: ["Into the Wild", "The Call of the Wild", "The Road", "Wild"], reward: 18, level: 9, hint: "Adventure in the wilderness", correctAnswer: "Into the Wild"),
                
                Riddle(emojis: "🚢🏝️💔📖", answers: ["Robinson Crusoe", "Treasure Island", "Moby Dick", "The Odyssey"], reward: 25, level: 10, hint: "A stranded sailor’s survival", correctAnswer: "Robinson Crusoe")
            ]),

            RiddleCategory(name: "Jobs", riddles: [
                Riddle(emojis: "👨‍⚕️💉🩺🏥", answers: ["Doctor", "Nurse", "Surgeon", "Paramedic"], reward: 20, level: 1, hint: "Healthcare profession", correctAnswer: "Doctor"),
                
                Riddle(emojis: "👩‍🏫📚🖋️🏫", answers: ["Teacher", "Professor", "Tutor", "Principal"], reward: 15, level: 2, hint: "Works in a classroom", correctAnswer: "Teacher"),
                
                Riddle(emojis: "💻👨‍💻📱🔧", answers: ["Software Developer", "Engineer", "Programmer", "Web Developer"], reward: 25, level: 3, hint: "Works with code and technology", correctAnswer: "Software Developer"),
                
                Riddle(emojis: "🚓👮‍♂️🔒💼", answers: ["Police Officer", "Security Guard", "Detective", "Sheriff"], reward: 18, level: 4, hint: "Law enforcement job", correctAnswer: "Police Officer"),
                
                Riddle(emojis: "👩‍🍳🍳🍽️🔥", answers: ["Chef", "Cook", "Baker", "Sous Chef"], reward: 20, level: 5, hint: "Works with food in a kitchen", correctAnswer: "Chef"),
                
                Riddle(emojis: "💼👨‍💼📊🖥️", answers: ["Business Analyst", "Manager", "Consultant", "Project Manager"], reward: 15, level: 6, hint: "Works with data and strategies", correctAnswer: "Business Analyst"),
                
                Riddle(emojis: "🏗️🛠️👷‍♂️🧱", answers: ["Construction Worker", "Engineer", "Architect", "Builder"], reward: 12, level: 7, hint: "Works in construction", correctAnswer: "Construction Worker"),
                
                Riddle(emojis: "🎥🎬🍿📽️", answers: ["Director", "Actor", "Producer", "Cinematographer"], reward: 18, level: 8, hint: "Works in the movie industry", correctAnswer: "Director"),
                
                Riddle(emojis: "✈️🛫👩‍✈️🌍", answers: ["Pilot", "Flight Attendant", "Air Traffic Controller", "Ground Crew"], reward: 25, level: 9, hint: "Works with air travel", correctAnswer: "Pilot"),
                
                Riddle(emojis: "👩‍🔬🧪🔬⚗️", answers: ["Scientist", "Chemist", "Biologist", "Physicist"], reward: 20, level: 10, hint: "Works in a laboratory", correctAnswer: "Scientist")
            ]),

            
            
            RiddleCategory(name: "Food", riddles: [
                Riddle(emojis: "🍕🍴🧀🍅", answers: ["Pizza", "Burger", "Pasta", "Lasagna"], reward: 10, level: 1, hint: "Italian food", correctAnswer: "Pizza"),
                
                Riddle(emojis: "🍔🍟🥤🍔", answers: ["Burger", "Hotdog", "Sandwich", "Wrap"], reward: 12, level: 2, hint: "Fast food", correctAnswer: "Burger"),
                
                Riddle(emojis: "🍎🥧🍏🍴", answers: ["Apple Pie", "Apple", "Peach", "Pear"], reward: 15, level: 3, hint: "Dessert with apples", correctAnswer: "Apple Pie"),
                
                Riddle(emojis: "🍫🍬🍪🍭", answers: ["Chocolate", "Candy", "Gummy Bears", "Lollipop"], reward: 10, level: 4, hint: "Sweet treat", correctAnswer: "Chocolate"),
                
                Riddle(emojis: "🥗🍅🥒🥬", answers: ["Salad", "Soup", "Casserole", "Stir-fry"], reward: 12, level: 5, hint: "Healthy dish", correctAnswer: "Salad"),
                
                Riddle(emojis: "🍔🥓🍳🥯", answers: ["Burger", "Steak", "Fries", "Sandwich"], reward: 18, level: 6, hint: "Grilled food", correctAnswer: "Burger"),
                
                Riddle(emojis: "🍋🥤🍹🍊", answers: ["Lemonade", "Juice", "Coke", "Soda"], reward: 15, level: 7, hint: "Citrus drink", correctAnswer: "Lemonade"),
                
                Riddle(emojis: "🌭🍞🥨🍔", answers: ["Hot Dog", "Sandwich", "Burrito", "Taco"], reward: 10, level: 8, hint: "Popular street food", correctAnswer: "Hot Dog"),
                
                Riddle(emojis: "🍩☕🥐🍪", answers: ["Donut", "Croissant", "Muffin", "Bagel"], reward: 12, level: 9, hint: "Breakfast treat", correctAnswer: "Donut"),
                
                Riddle(emojis: "🍓🍰🍏🥧", answers: ["Strawberry Cake", "Fruit Cake", "Cheesecake", "Apple Cake"], reward: 20, level: 10, hint: "Dessert with fruit", correctAnswer: "Strawberry Cake")
            ]),

            RiddleCategory(name: "Cities", riddles: [
                Riddle(emojis: "🗽🌆🏙🎶", answers: ["New York", "Paris", "London"], reward: 15, level: 1, hint: "Famous city in the USA", correctAnswer: "New York"),
                Riddle(emojis: "🕌🌆🛍️🌟", answers: ["Dubai", "Cairo", "Moscow"], reward: 18, level: 2, hint: "City with tallest building", correctAnswer: "Dubai"),
                Riddle(emojis: "🎡🌃🎢🎠", answers: ["Chicago", "London", "Paris"], reward: 10, level: 3, hint: "City with a big Ferris wheel", correctAnswer: "London"),
                Riddle(emojis: "🐯🇨🇳🏯🎎", answers: ["Beijing", "Shanghai", "Hong Kong"], reward: 20, level: 4, hint: "Capital city of China", correctAnswer: "Beijing"),
                Riddle(emojis: "🌉🏙🚲🍽", answers: ["San Francisco", "Seattle", "Los Angeles"], reward: 15, level: 5, hint: "City with the Golden Gate Bridge", correctAnswer: "San Francisco"),
                Riddle(emojis: "🏰🎠🗼🎨", answers: ["Paris", "Madrid", "Vienna"], reward: 18, level: 6, hint: "City of romance", correctAnswer: "Paris"),
                Riddle(emojis: "🌊🌴🏝🍹", answers: ["Miami", "Los Angeles", "Hawaii"], reward: 20, level: 7, hint: "Beach city in Florida", correctAnswer: "Miami"),
                Riddle(emojis: "⛷🏞🏔️❄️", answers: ["Zurich", "Moscow", "Tokyo"], reward: 25, level: 8, hint: "City famous for skiing", correctAnswer: "Zurich"),
                Riddle(emojis: "🗼🇫🇷🍷🎨", answers: ["Paris", "Rome", "Berlin"], reward: 12, level: 9, hint: "City with the Eiffel Tower", correctAnswer: "Paris"),
                Riddle(emojis: "🏙🌉🗽🚕", answers: ["New York", "San Francisco", "Chicago"], reward: 15, level: 10, hint: "Big apple", correctAnswer: "New York")
            ])
        ]
    }
}
