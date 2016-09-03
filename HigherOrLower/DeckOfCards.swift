
import Foundation

var numberOfCards : Int = 52 //total number of cards in the deck.
var previousCard :[String] = [] //array for previous cards used.

//enum for card suits along with a simple function that returns the name of the suit. 
enum Suit: Int{
    case Diamonds = 1
    case Hearts,Spades,Clubs
    
    func simpleDescription() -> String{
        switch self {
        case .Diamonds:
            return "Diamonds"
        case .Hearts:
            return "Hearts"
        case .Spades:
            return "Spades"
        case .Clubs:
            return "Clubs"
        }
    }
}

//enum for card rank aling with a simple function that returns the name of the rank.
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String{
        switch self {
        case .Ace:
            return "Ace"
        case .Jack:
            return "Jack"
        case .Queen:
            return "Queen"
        case .King:
            return "King"
        default:
            return String(self.rawValue)
        }
    }
}

//Struct Card that takes a rank and a suit and returns a description of the card. This string will be logged in our array and so we can avoid drawing the same card again.
struct Card {
    var rank : Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

//function for assigining a random rank to our card.
func randomRank() -> Rank{
    let randomNum = Int(arc4random_uniform(13) + 1)
    let rank = Rank(rawValue: randomNum)
    
    
    return rank!
}

//function for assigining a random suit to our card.
func randomSuit() -> Suit{
    let randomNum = Int(arc4random_uniform(4) + 1)
    let suit = Suit(rawValue: randomNum)
    
    return suit!
}


