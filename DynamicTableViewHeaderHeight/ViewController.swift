//
//  ViewController.swift
//  DynamicTableViewHeaderHeight
//
//  Created by Echo Innovate IT on 7/5/18.
//  Copyright © 2018 Echo Innovate IT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Variable Declaration
    
    /* TableView */
    @IBOutlet weak var tblView: UITableView!
    
    /* Local Variable */
    var objList:[String] = [String]()
    var strTitle = "Any Swift variable is either a constant or not. Not to be confused with the type of the variable, such as Float or Int, constants and variables are just ways to describe terms that hold a value which can change (are mutable), and constants that can not be changed."
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        objList.append("Any Swift variable is either a constant or not. Not to be confused with the type of the variable, such as Float or Int, constants and variables are just ways to describe terms that hold a value which can change (are mutable), and constants that can not be changed.")
        
        objList.append("In general, you should always default to using the let keyword, unless you know you need a var keyword. This leads to code that is ultimately safer.")
        
        objList.append("In Swift, there is also the concept of the optional. An optional is just a variable that can be nil, null, or otherwise not set to any value. In general, you can think of any variable in most other programming languages as being an optional. The “optionality” of a variable is declared by appending a question mark (?) on to the end of the type name in a type annotation. So continuing the example above, where we know age and name will always be set, we might want to add another variable that could be nil, because it is possible that it just isn’t present. Let’s use favoriteColor as an example. Many people have a favorite color, but it’s possible someone doesn’t, or we just don’t have the data. We would declare this variable as an optional, and not assign it to any value.")
        
        objList.append(" When we pass around optional variables and interact with them, we’re really working with a container that may or may not have anything inside of it. Similar to our gift, the optional must be unwrapped before it can be used.")
        
        objList.append("Declaring our optional with no value is valid Swift and will compile just fine.")
        
        objList.append("we have a basic Array, which is of type [String]. The square brackets indicate that this is an array of String objects, rather than just being a single String.")
        
        objList.append("Dictionaries are able to store values based on a key, typically the key is of type String, but it could actually be many different Swift types.")
        
        // Dynamic Height
        tblView.estimatedRowHeight = 150;
        tblView.rowHeight = UITableViewAutomaticDimension;
        
        // Dynamic Height
        tblView.estimatedSectionHeaderHeight  = 77.0;
        tblView.sectionHeaderHeight = UITableViewAutomaticDimension;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - TableView Delegate

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let nibContents = Bundle.main.loadNibNamed("HeaderCellView", owner: self, options: nil)
        
        let headerView = nibContents?.last as! HeaderCellView
        
        headerView.title.text = strTitle
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return objList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TableCell! = tableView.dequeueReusableCell(withIdentifier: "TableCell") as? TableCell
        
        cell.desc.text = objList[indexPath.row];
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        strTitle = objList[indexPath.row]
        
        tblView.reloadData()
    }
}
