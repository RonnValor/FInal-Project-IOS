
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblShow: UILabel!
    
    @IBOutlet weak var txtShow: UITextField!

    var submenuItem:  String!
    
    
    @IBAction func btnBack(_ sender: UIButton) {
         self.dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(submenuItem)
        lblShow.text = "The selected item is: \(submenuItem!)"

    }


}

