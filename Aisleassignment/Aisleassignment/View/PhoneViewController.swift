//
//  ViewController.swift
//  Aisleassignment
//
//  Created by Dhanush S on 15/03/23.
//

import UIKit

class PhoneViewController: UIViewController, phoneViewModelDelegate {
    
    @IBOutlet weak var CountryCode: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    var phoneNumberText: String = ""
    
    var phoneViewModel : PhoneViewModel = PhoneViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneViewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        continueButton.layer.cornerRadius = 15
    }
    
    
    @IBAction func coninueButtonTapped(_ sender: Any) {
        phoneNumberText = Constants.CountryCode + (phoneNumber.text ?? "")
        phoneViewModel.PhoneNumberValidation(phoneNumber: PhoneAPIRequest(number: phoneNumberText))
    }
    
    func ValidationResults(results: PhoneAPIResponseValidationResults?) {
        if results?.error == nil && results?.success == true {
            if let otpViewController = self.storyboard?.instantiateViewController(withIdentifier: "OTPViewController") as? OTPViewController {
                otpViewController.phoneNumber = phoneNumberText
                self.navigationController?.pushViewController(otpViewController, animated: true)
            }
        } else if results?.error != nil {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: Constants.ErrorAlertTitle, message: results?.error, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: Constants.OkAlertTitle, style: .default))
                self.present(alert, animated: true)
            }
        }
    }
}

