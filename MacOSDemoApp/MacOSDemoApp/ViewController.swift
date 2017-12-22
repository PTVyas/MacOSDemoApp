//
//  ViewController.swift
//  MacOSDemoApp
//
//  Created by wos on 20/12/17.
//  Copyright © 2017 WhiteOrange Software. All rights reserved.
//

import Cocoa
import Alamofire
//import WsC

class ViewController: NSViewController {

    @IBOutlet weak var tableView:NSTableView!

    let tableViewData : NSMutableArray = []
    /*
    let tableViewData = [["imageIcon":"icon","title":"Home"],
                         ["imageIcon":"icon","title":"Action"],
                         ["imageIcon":"icon","title":"History"],
                         ["imageIcon":"icon","title":"Activity"],
                         ["imageIcon":"icon","title":"My Profile"],
                         ["imageIcon":"icon","title":"Setting"],
                         ["imageIcon":"icon","title":"Logout"]]
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self as? NSTableViewDelegate
        self.tableView.dataSource = self
        self.tableView.action = #selector(onItemClicked)
        self.tableView.selectionHighlightStyle = NSTableViewSelectionHighlightStyle.none
        
        /*
        tableViewData.add("Home")
        tableViewData.add("Action")
        tableViewData.add("History")
        tableViewData.add("My Profile")
        tableViewData.add("Setting")
        tableViewData.add("Logout")
        */
        self.tableView.reloadData()
        
        //Called WebService
        self.webServiceCalled()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func webServiceCalled()
    {
        var req = URLRequest(url: try! "https://jyapi.togglewave.com/rcci.svc/getcontacts".asURL())
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "content-type")
        //req.setValue("no-cache", forHTTPHeaderField: "cache-control")
        
        var param = NSMutableDictionary()
        param = ["mynumber": "09512468722", "apikey" : "TEST"]
        req.httpBody = try! JSONSerialization.data(withJSONObject: param)
        
        Alamofire.request(req).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                
                /*
                 //let swiftyJsonVar = JSON(json.value!)
                 if let resData = swiftyJsonVar["getcontactsResult.data"].arrayObject {
                 dicRespon = resData as! [[String:AnyObject]]
                 }
                */
                
                var dicRespon = response.result.value as! [String : AnyObject]
                var dicData = dicRespon["getcontactsResult"] as! [String : AnyObject]
                let dicObj = dicData["data"] as! NSArray
                print("dicObj: \(String(describing: dicObj))")
                
                for i in 0 ..< dicObj.count
                {
                    let obj = dicObj[i] as AnyObject
                    var strTitle1 = obj["caption"] as! String
                    let strTitle2 = obj["international_number"] as! String
                    let strTitle3 = obj["country_code"] as! String
                    //let strImageName = obj["imagebase64"] as! NSString
                    
                    strTitle1 = (strTitle1 as String) + " (" + (strTitle2 as String) + ") - " + strTitle3
                    self.tableViewData.add(strTitle1)
 
                    /*
                    //-- -- -- -- -- -- -- -->
                    var objWSContact : WsContact
                    objWSContact = WsContact.init(object: obj)
                    self.tableViewData.add(objWSContact)
                    //-- -- -- -- -- -- -- -->
                     */
                }
                self.tableView.reloadData()
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
}

extension ViewController:NSTableViewDataSource, NSTableViewDelegate{
   
    func numberOfRows(in tableView: NSTableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView?{
        /*
        var result:NSTableCellView
        result  = tableView.make(withIdentifier: (tableColumn?.identifier)!, owner: self) as! NSTableCellView
        result.textField?.stringValue = tableViewData[row][(tableColumn?.identifier)!]!
        return result
         */
        
        let result:customeCell  = tableView.make(withIdentifier: "cell", owner: self) as! customeCell
        
        result.imgLogo.image = NSImage(named:"icon")
        result.lblTitle.stringValue = tableViewData[row] as! String
        
        //let  objWS : WsContact
        //objWS = tableViewData[row] as! WsContact
        //result.lblTitle.stringValue = objWS.caption! + " (" + objWS.localNumber! + ") - " + objWS.countryCode!
        
        return result
    }
    
    func onItemClicked() {
        print("clicked row: \(tableView.clickedRow), column: \(tableView.clickedColumn)")
    }
    
    func tableView(_ tableView: NSTableView, willDisplayCell cell: Any, for tableColumn: NSTableColumn?, row: Int) {
        
        /*
        if ([[tableView selectedRowIndexes] containsIndex:row])
        {
            [cell setBackgroundColor: [NSColor yellowColor]];
        }
        else
        {
            [cell setBackgroundColor: [NSColor whiteColor]];
        }
        [aCell setDrawsBackground:YES];
         */
        
        /*
        if tableView.selectedRowIndexes.contains(row)
        {
            //(cell as AnyObject).wantsLayer = true
            (cell as AnyObject).layer??.backgroundColor = NSColor.red as! CGColor;
        }
        else {
            (cell as AnyObject).layer??.backgroundColor = NSColor.yellow as! CGColor;
            
        }
        */
    }
}

