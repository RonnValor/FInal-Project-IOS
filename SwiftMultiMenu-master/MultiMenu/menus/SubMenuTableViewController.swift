
import UIKit

class SubMenuTableViewController: UITableViewController {
    
    @IBAction func btnBack(_ sender: UIBarButtonItem) {
         self.dismiss(animated: false, completion: nil)
    }
    
    
     var ViewControllers: ViewController? = nil
    
    var ListOfSocialMediaItems:[String]?
    var ListOfSearchEnginestems:[String]?
    var ListOfArtificialIntelligenceItems:[String]?
    var Choice:[String]?
    
    var submenuItem: AnyObject? {
        didSet {
            configureView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configureView() {
        if submenuItem != nil {
            ListOfSocialMediaItems = ["What is the Nintendo Switch?","How does it work?",]
            ListOfSearchEnginestems = ["Controllers - How to connect"]
            ListOfArtificialIntelligenceItems = ["What games are on the Switch?","Can Indie Developers add titles to the Switch?"]
            if let submenuitem = submenuItem as? String{
                if submenuitem == "0"{
                    Choice = ListOfSocialMediaItems
                }
                if submenuitem == "1"{
                     Choice = ListOfSearchEnginestems
                }
                if submenuitem == "2"{
                     Choice = ListOfArtificialIntelligenceItems
                }
            }
           
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.ViewControllers = (controllers[controllers.count-1] as! UINavigationController).topViewController as? ViewController
        }

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Choice!.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel!.text = Choice![indexPath.row]
        cell.detailTextLabel?.text = ">>"
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "DetailView" {
            if let indexPath = tableView.indexPathForSelectedRow {
                // 6) replace code with below code until line 75
                let object = Choice![indexPath.row]
                let nav = segue.destination as! UINavigationController
                let controller = nav.topViewController as! ViewController
                controller.submenuItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                controller.navigationItem.title = Choice![indexPath.row]
            }
        }
    }
   

}
