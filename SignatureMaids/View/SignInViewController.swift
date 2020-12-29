//  ViewController.swift
//  SignatureMaids
//  Created by admin on 21/12/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate{
    weak var parallaxHeaderView: UIView?
    @IBOutlet weak var txtEmailId: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    var signInViewModel = SignInViewModel()
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var btnRemember: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtPassword.delegate = self
        txtEmailId.delegate = self
    }
    
    func isEntriesValid() -> Bool {
        let signInDetails = SignInData(UserEmail: txtEmailId.text ?? "", UserPassWord: txtPassword.text ?? "")
        return signInViewModel.validateEntries(data: signInDetails, viewController: self)
    }
    // MARK:- Sign-In Action
    
    @IBAction func actRememberPassword(_ sender: Any) {
        if let myButtonImage = btnRemember.image(for: .normal),
            let buttonAppuyerImage = UIImage(named: "unchecked.png"),
            myButtonImage.pngData() == buttonAppuyerImage.pngData()
        {
            btnRemember.setImage(UIImage(named: "checked.png"), for: .normal)
        } else {
            btnRemember.setImage(UIImage(named: "unchecked.png"), for: .normal)
        }
    }
    
    /*
     @description : Method is being used to validate entries in textfields
     @Parameters: N/A
     @return : Bool
     @author:Chetu India
     @Date:21 Dec 2020
     */
    @IBAction func actSignIn(_ sender: Any) {
        if(isEntriesValid()){
           let rootVC = UIStoryboard(name: SMConstant.StoryBoardIdentifiers.kStoryboardMain, bundle: nil).instantiateViewController(withIdentifier: SMConstant.ViewControllerIdentiFiers.DashboardViewController) as! DashboardViewController
               self.view.window?.rootViewController = rootVC
            
           /* let token = AppSharedData.sharedData.deviceToken
            WKDataManager.password  = txtPassword.text ?? ""
            let userLoginParam = LoginUserParam(UserEmail:txtEmailId.text ?? "",UserPassWord:txtPassword.text ?? "", DeviceId: token ?? "")
            let signInViewModel = SignInViewModel()
            self.showHUD(progressLabel: "")
            signInViewModel.signInUserServiceCall(loginUserParameters: userLoginParam, serviceType: .resgisterUser) {  (responseArray, error,statusCode) in
                self.dismissHUD(isAnimated: true)
                if statusCode == 200 {
                    WKUtility.alertContoller(title: WKUtility.localized(key: "smSuccessUper"),message: WKUtility.localized(key: "smLoginSuccess"),
                                             actionTitleFirst: WKUtility.localized(key: "smOk"), actionTitleSecond: "", firstActoin: #selector(self.moveToViewDashBoardScreen), secondAction: nil,controller: self)
                    
                }else if(statusCode == 201){
                    self.txtPassword.text = ""
                    self.txtEmailId.text = ""
                    WKUtility.alertContoller(title: WKUtility.localized(key: "smMessage"),
                                             message: WKUtility.localized(key: "smLoginValidation"),
                                             actionTitleFirst: WKUtility.localized(key: "smOk"),
                                             actionTitleSecond: "",
                                             firstActoin: nil, secondAction: nil,
                                             controller: self)
                    
                }else {
                    self.txtPassword.text = ""
                    WKUtility.alertContoller(title: WKUtility.localized(key: "smMessage"),
                                             message: WKUtility.localized(key: "smLoginFailed"),
                                             actionTitleFirst: WKUtility.localized(key: "smOk"),
                                             actionTitleSecond: "",
                                             firstActoin: nil, secondAction: nil,
                                             controller: self)
                    
                }
            } */
        }
    }
  
    func textFieldDidBeginEditing(_ textField: UITextField) {
            self.animateViewMoving(up: true, moveValue: 100)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
            self.animateViewMoving(up: false, moveValue: 100)
    }

    func animateViewMoving (up:Bool, moveValue :CGFloat){
//        let movementDuration:TimeInterval = 0.3
//        let movement:CGFloat = ( up ? -moveValue : moveValue)
//        UIView.begin( "animateView", context: nil)
//        UIView.setAnimationsEnabled(true)
//        UIView.setAnimationDuration(movementDuration )
//        self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
//        UIView.commitAnimations()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                 view.endEditing(true)
    }
    @objc func moveToViewDashBoardScreen(){
        self.txtPassword.text = ""
        self.txtEmailId.text = ""
    }
}





