
import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var CardLabel: UILabel!
    @IBOutlet weak var PreviousLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var HighButton: UIButton!
    @IBOutlet weak var LowButton: UIButton!
    @IBOutlet weak var RetryButton: UIButton!
    
    @IBOutlet weak var CardImage: UIImageView!
    @IBOutlet weak var RankImage: UIImageView!
    
    
    //Create card that has a random rank and random suit assigned.
    var test = Card(rank: randomRank(), suit: randomSuit())
    
    //Createing a Instance of card to store the previous card drawn on start up assigning any value
    var lastCard = Card(rank: Rank.Ace, suit: Suit.Clubs)
    
    //number for comparing if the answer selected was correct or wrong.
    var checkNumber: Int = 0
    
    //Score based off correct answer
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Setting Retry button to be hidden
        RetryButton.hidden = true
        
        //Assigning the descriptions to the labels
        CardLabel.text = test.simpleDescription()
        previousCard.append(test.simpleDescription())
        
        //remove 1 card from the total number of cards
        numberOfCards -= 1
        
        //Label for score
        ScoreLabel.text = "\(score) out of 51 correct"
        
        //assigning a random background colour from the array in ColourModel.swift
        let randomColour = ColourModel().getRandomColour()
        
        view.backgroundColor = randomColour
        
        //setting the card image for both the suit and the rank
        changeCardImage(test.suit, rank: test.rank)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Function for drawing a new card.
    func drawCard(){
        
        //assigning last card to the current instance of test before setting a new rank and suit.
        lastCard = test
        test = Card(rank: randomRank(), suit: randomSuit())
        
        //check doubles function
        checkDoubles()
        
        CardLabel.text = test.simpleDescription()
        
        //adding the previous card array
        previousCard.append(test.simpleDescription())
        numberOfCards -= 1
        
        cardsRemaining()
        
        
        PreviousLabel.text = "Previous Cards: \(previousCard[previousCard.count - 2])"
        
    }
    
    //function that checks if the new version of our card has already been drawn
    func checkDoubles(){
        
        var isDouble = true
        
        //if our new card has already been drawn and if our previousCard array, assign test a new rank and suit.
        while isDouble == true {
            if previousCard.contains(test.simpleDescription()){
                test = Card(rank: randomRank(), suit: randomSuit())
            } else {
                isDouble = false
            }
        }
        
    }
    
    //when we run out of cards the high and low buttons are hidden and the retry is unhidden
    func cardsRemaining() {
        if numberOfCards == 0 {
            HighButton.hidden = true
            LowButton.hidden = true
            RetryButton.hidden = false
        }
    }
    
    //function that compares the rank and returns an Int value used to compare with checkNumber.
    func compareRank(rankA: Rank, rankB: Rank) -> Int{
        let valueA = rankA.rawValue
        let valueB = rankB.rawValue
        
        if valueA > valueB {
            return 1
        } else if valueA < valueB  {
            return 2
        } else {
            return 3
        }
    }
    
    //function for refilling the deck, clearing the array and resetting buttons
    func refillDeck(){
        numberOfCards = 52
        previousCard.removeAll()
        lastCard = Card(rank: Rank.Ace, suit: Suit.Diamonds)
        PreviousLabel.text = ("?")
        
        CardLabel.text = test.simpleDescription()
        previousCard.append(test.simpleDescription())
        numberOfCards -= 1
        changeCardImage(test.suit, rank: test.rank)
        
        HighButton.hidden = false
        LowButton.hidden = false
        
        score = 0
        ScoreLabel.text = "\(score) out of 51 correct"
    }
    
    //function for changing the image of the rank and suit.
    func changeCardImage(suit: Suit, rank: Rank){
        
        // using the rawValue of both suit and rank -1 (the reason for -1 is due to the image array startin at 0 and the rawValue of both suit and rank start at 1.
        let imageSuit = suit.rawValue - 1
        let imageRank = rank.rawValue - 1
        
        CardImage.image = (suitImage[imageSuit])
        RankImage.image = (rankImage[imageRank])
    }
    
    
    @IBAction func HigherButton() {
        
        if numberOfCards > 0 {
            
            
            drawCard()
            changeCardImage(test.suit, rank: test.rank)
            
            checkNumber = compareRank(test.rank, rankB: lastCard.rank)
            
            
            if checkNumber == 1 || checkNumber == 3 {
                view.backgroundColor = UIColor(red: 85/255.0, green: 176/255.0, blue: 112/255.0, alpha: 1.0)
                score += 1
                ScoreLabel.text = "\(score) out of 51 correct"
            } else {
                view.backgroundColor = UIColor(red: 223/255.0, green: 86/255.0, blue: 94/255.0, alpha: 1.0)
            }
        }
    }
    
    @IBAction func LowerButton() {
        
        drawCard()
        changeCardImage(test.suit, rank: test.rank)
        
        checkNumber = compareRank(test.rank, rankB: lastCard.rank)
        
        
        if checkNumber == 2 || checkNumber == 3{
            view.backgroundColor = UIColor(red: 85/255.0, green: 176/255.0, blue: 112/255.0, alpha: 1.0)
            score += 1
            ScoreLabel.text = "\(score) out of 51 correct"
        } else {
            view.backgroundColor = UIColor(red: 223/255.0, green: 86/255.0, blue: 94/255.0, alpha: 1.0)
        }
        
    }
    
    @IBAction func RestartButton() {
        RetryButton.hidden = true
        
        refillDeck()
    }
    
    

}

    