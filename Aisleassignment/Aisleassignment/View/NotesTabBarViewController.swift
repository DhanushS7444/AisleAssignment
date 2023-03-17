//
//  NotesTabBarViewController.swift
//  Aisleassignment
//
//  Created by Dhanush S on 17/03/23.
//

import UIKit

class NotesTabBarViewController: UIViewController, NotesViewDelegate {
    
    
    var notesViewModel : NotesViewModel = NotesViewModel()
    var notesData: NotesAPIResponse? = nil
    @IBOutlet weak var NotesHeaderLabel: UILabel!
    @IBOutlet weak var PeronalMessageSubHeaderLabel: UILabel!
    @IBOutlet weak var SelectedImageView: UIImageView!
    @IBOutlet weak var NameAndAge: UILabel!
    @IBOutlet weak var premiumMember: UILabel!
    @IBOutlet weak var imagev2: UIImageView!
    @IBOutlet weak var imageV1: UIImageView!
    @IBOutlet weak var upgradeButton: UIButton!
    @IBOutlet weak var interestedInyou: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        notesViewModel.notesDelegate = self
        notesViewModel.getNotesData()
    }
    
    func getDataNotes(results: NotesAPIResponse) {
        self.notesData = results
        
        let name = notesData?.likes.profiles[0].firstName
        var imageDataPNg = getImageData(urlString: (notesData?.likes.profiles[0].avatar)!)
        DispatchQueue.main.async {
            self.NameAndAge.text = name
            self.SelectedImageView.image = UIImage(data: imageDataPNg as! Data)
        }
       
    }
    
    func getImageData(urlString: String?) -> NSData {
        let imageURLFromParse = NSURL(string : (urlString)!)
        let imageData = NSData(contentsOf: imageURLFromParse! as URL)
        return imageData!
    }
    
}























class DiscoverTabBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
}

class ProfileTabBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

class MatchesTabBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
