
import Foundation
import GameKit

struct ColourModel {
    let colours = [
        UIColor(red: 90/255.0, green: 187/255.0, blue: 181/255.0, alpha: 1.0), //teal color
        UIColor(red: 222/255.0, green: 171/255.0, blue: 66/255.0, alpha: 1.0), //yellow color
        UIColor(red: 239/255.0, green: 130/255.0, blue: 100/255.0, alpha: 1.0), //orange color
        UIColor(red: 77/255.0, green: 75/255.0, blue: 82/255.0, alpha: 1.0), //dark color
        UIColor(red: 105/255.0, green: 94/255.0, blue: 133/255.0, alpha: 1.0), //purple color
        UIColor(red: 255/255.0, green: 159/255.0, blue: 246/255.0, alpha: 1.0), //pink color
        UIColor(red: 170/255.0, green: 143/255.0, blue: 193/255.0, alpha: 1.0) //purplish pink color
        
    ]
    
    func getRandomColour() -> UIColor{
        let randomNumber = GKRandomSource.sharedRandom().nextIntWithUpperBound(colours.count)
        
        return colours[randomNumber]
    }
}