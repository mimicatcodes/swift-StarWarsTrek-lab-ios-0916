import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var starWarsImageView: UIImageView!

    @IBOutlet weak var starTrekImageView: UIImageView!
    
    var starWarsImage: UIImage!
    var starTrekImage: UIImage!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        starTrekImageView.image = starTrekImage
        starWarsImageView.image = starWarsImage
        setPanGestureRecognizer()
    }
    
    func setPanGestureRecognizer(){
        let views = [ starWarsImageView, starTrekImageView ]
        
        for view in views {
            
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(draggingView))
            
        view?.addGestureRecognizer(panGestureRecognizer)
        }
    }
    
    func draggingView(_ sender: UIPanGestureRecognizer){
        let point = sender.location(in: view)
        let draggedView = sender.view!
        draggedView.center = point
        print(point)
    
    }


}
