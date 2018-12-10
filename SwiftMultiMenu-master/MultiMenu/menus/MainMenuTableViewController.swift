
import UIKit

class MainMenuTableViewController: UITableViewController {

    var subMenuTableViewController: SubMenuTableViewController? = nil
    
    var ListOfMenu:[String]?
    var ListOfSubMenu:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ListOfMenu = ["Nintendo Switch","How it works", "Switch Games - FAQ"]
        ListOfSubMenu = ["0","1", "2"]
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.subMenuTableViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? SubMenuTableViewController
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListOfMenu!.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel!.text = ListOfMenu![indexPath.row]
        cell.detailTextLabel?.text = ">>"
        return cell
        
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSubMenu" {
            if let indexPath = tableView.indexPathForSelectedRow {
                // 6) replace code with below code until line 75
                let object = ListOfSubMenu![indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! SubMenuTableViewController
                controller.submenuItem = object as AnyObject
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                controller.navigationItem.title = ListOfMenu![indexPath.row]
            }
        }
    }
    

}
