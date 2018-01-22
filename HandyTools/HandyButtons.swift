//
//  FormButtonDetails.swift
//  HandyTools
//
//  Created by Poonam Pandey on 22/01/18.
//


import UIKit


class HandyButtons: UITableViewController {
    
    var numberOfButtons = 3
    
    var handyButtons:Array<HTButtons> = Array()
    
    
    func fillArrayWithButtons (){
        for i in 1...numberOfButtons{
            if i % 2 == 0 {
                handyButtons += [HTButtons.init("Apple ", 1, 1,  90)]
            }
            else if i % 3 == 0 {
                handyButtons += [HTButtons.init("Yahoo ", 2, 2,  90)]
            }
            else {
                handyButtons += [HTButtons.init("Google ", 3, 3,  90)]
            }
        }
        
    }
    
    
    func sortHandyButtons (){
        handyButtons =  handyButtons.sorted(by: { $0.myorder < $1.myorder })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.fillArrayWithButtons()
        self.sortHandyButtons ()
        
        
        tableView.register(UINib(nibName: "HBTypeFirst" , bundle: nil), forCellReuseIdentifier: "HBTypeFirstCellId")
        tableView.register(UINib(nibName: "HBTypeSecond" , bundle: nil), forCellReuseIdentifier: "HBTypeSecondCellId")
        tableView.register(UINib(nibName: "HBTypeThird" , bundle: nil), forCellReuseIdentifier: "HBTypeThirdCellId")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return handyButtons.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellInfo = handyButtons[indexPath.row]
        return CGFloat(cellInfo.myheight)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellInfo = handyButtons[indexPath.row]
    
        
        if (cellInfo.mytype == 1){
            let   cell = tableView.dequeueReusableCell(withIdentifier: "HBTypeFirstCellId", for: indexPath) as! HBTypeFirst
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapOnMe(_:)))
            cell.baseView.tag = indexPath.row
            cell.baseView.addGestureRecognizer(tap)
            return cell
        } else if (cellInfo.mytype == 2){
            let   cell = tableView.dequeueReusableCell(withIdentifier: "HBTypeSecondCellId", for: indexPath) as! HBTypeSecond
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapOnMe(_:)))
            cell.baseView.tag = indexPath.row
            cell.baseView.addGestureRecognizer(tap)
            return cell
        } else {
            let   cell = tableView.dequeueReusableCell(withIdentifier: "HBTypeThirdCellId", for: indexPath) as! HBTypeThird
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapOnMe(_:)))
            cell.baseView.tag = indexPath.row
            cell.baseView.addGestureRecognizer(tap)
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // do nothing here
    }
   
    @objc func tapOnMe(_ sender: UITapGestureRecognizer) {
        
        let baseView = sender.view
        let index = baseView?.tag
        let cellInfo = handyButtons[index!]
        
       showAlert(cellInfo.mylabel)
        
    }
    
    func showAlert (_ message:String){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

    
}

