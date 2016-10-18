//
//  colorTableViewController.swift
//  AC3.2Unit2FinalAssessment
//
//  Created by Kadell on 10/6/16.
//  Copyright © 2016 Kadell. All rights reserved.
//

import UIKit

class colorTableViewController: UITableViewController {

    var crayons = [Crayon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        for c in crayolaColors {
            if let crayon = Crayon(fromDict: c) {
                crayons.append(crayon)
            }
        }
      
    }
    
    func getColors(for indexPath:IndexPath)->UIColor{
                let red = Float(crayons[indexPath.row].red)
                let blue = Float(crayons[indexPath.row].blue)
                let green = Float(crayons[indexPath.row].green)
                return UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: 1.0)
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      return self.crayons.count
        //return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifer = "colorTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer, for: indexPath) as! colorTableViewCell

        let color = self.crayons[indexPath.row].name
        cell.colorLabel.text = color
        cell.backgroundColor = getColors(for: indexPath)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedColors = crayons[indexPath.row]
        performSegue(withIdentifier: "segueForView" , sender: selectedColors)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let tapped = sender as? colorTableViewCell {
            
        if segue.identifier == "segueForView" {
            
                
            let viewController = segue.destination as! ViewController
            let cellIndexPath = self.tableView.indexPath(for: tapped)!
            let selectedColor = crayons[cellIndexPath.row]
            viewController.viewColor = selectedColor
//                viewController.viewColor = colorRow
            
            
    }
    }
    }

}
