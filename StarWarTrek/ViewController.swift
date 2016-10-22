import UIKit

class ViewController: UIViewController {
    
    //MARK: IBOutlets - imageViews
    @IBOutlet weak var anakinImage: UIImageView!
    
    @IBOutlet weak var chewbaccaImage: UIImageView!
    
    @IBOutlet weak var hanSoloImage: UIImageView!
    
    @IBOutlet weak var lukeImage: UIImageView!
    
    @IBOutlet weak var captainKirkImage: UIImageView!
    
    @IBOutlet weak var drMcCoyImage: UIImageView!
    
    @IBOutlet weak var spockImage: UIImageView!
    
    @IBOutlet weak var uhuruImage: UIImageView!
    
    var starWarsCharacter: UIImageView!
    var starTrekCharacter: UIImageView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStarWarsGestureRecognizers()
        setupStarTrekGestureRecognizers()
    
        }
    
    func checkForFight(){
        if starWarsCharacter != nil && starTrekCharacter != nil {
            performSegue(withIdentifier: "fightSegue", sender: nil)
        }
    }
    
    func setupStarWarsGestureRecognizers(){
        let imageViews  = [anakinImage, chewbaccaImage, hanSoloImage, lukeImage]
        
            for imageview in imageViews {
                let starWarsGestureRecognizer = UITapGestureRecognizer(target: self,action: #selector(starwarsCharacterChosen))
                starWarsGestureRecognizer.numberOfTapsRequired = 1
                imageview?.addGestureRecognizer(starWarsGestureRecognizer)
            }
    }
    
    func setupStarTrekGestureRecognizers(){
        let imageViews  = [captainKirkImage, drMcCoyImage, spockImage, uhuruImage]
            for imageView in imageViews {
                let starTrekGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(starTrekCharacterChosen))
        
                starTrekGestureRecognizer.numberOfTapsRequired = 1
                imageView?.addGestureRecognizer(starTrekGestureRecognizer)
                
            }
    }
    
    func starwarsCharacterChosen(_ sender:UITapGestureRecognizer){
        if starWarsCharacter != nil {
            starWarsCharacter.layer.borderWidth = 0.0
            print("the starWarsCharacter is now : \(starWarsCharacter.tag)")
            
        }
        
        let chosenImageView = sender.view as! UIImageView
        checkForFight()
        starWarsCharacter = chosenImageView
        checkForFight()
        chosenImageView.layer.borderWidth = 2.0
        chosenImageView.layer.borderColor = UIColor.green.cgColor
        print("the chosen image view here is : \(chosenImageView.tag)")
        print("Star Wars, what?")
        
        
    }
    func starTrekCharacterChosen(_ sender:UITapGestureRecognizer){
        if starTrekCharacter != nil { starTrekCharacter.layer.borderWidth = 0.0 }
        
        let chosenImageView = sender.view as! UIImageView
        starTrekCharacter = chosenImageView
        checkForFight()
        
        chosenImageView.layer.borderWidth = 2.0
        chosenImageView.layer.borderColor = UIColor.red.cgColor
        
        print("StarTrek, what?")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fightSegue" {
        let dest = segue.destination as! DetailViewController
        dest.starWarsImage = starWarsCharacter.image
        dest.starTrekImage = starTrekCharacter.image

        }
    }
    
  }

