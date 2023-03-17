//
//  OTPViewController.swift
//  Aisleassignment
//
//  Created by Dhanush S on 16/03/23.
//

import UIKit

class OTPViewController: UIViewController, OTPViewModelDelegate {
    
    @IBOutlet weak var otpTextFiled: UITextField!
    @IBOutlet weak var PhoneNumberTextView: NSLayoutConstraint!
    @IBOutlet weak var otpContinue: UIButton!
    var phoneNumber : String?
    var otpViewModel : OTPViewModel = OTPViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        otpViewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        otpContinue.layer.cornerRadius = 15
    }
    
    @IBAction func otpContinueButtonTapped(_ sender: Any) {
        let otpText = otpTextFiled.text ?? ""
        otpViewModel.OtpValidation(otpVerify: OTPApiRequest(number: phoneNumber ?? "", otp: otpText))
    }
    
    func ValidationResults(results: OTPResponseValidationResults?) {
        if results?.AuthToken != nil {
            UserDefaults.standard.set(results?.AuthToken?.token, forKey: "AuthToken")
            DispatchQueue.main.async {
                if let aisleTabBar = self.storyboard?.instantiateViewController(withIdentifier: "AisleTabBarViewController") as? AisleTabBarViewController {
                    self.navigationController?.pushViewController(aisleTabBar, animated: true)
                }
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
