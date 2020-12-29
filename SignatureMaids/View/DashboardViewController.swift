//  DashboardViewController.swift
//  SignatureMaids
//  Created by admin on 23/12/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController{
    @IBOutlet weak var viewInner: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    let nameArr = ["TURN WO" , "QC WO", "CONTRACTOR", "TECHNICIANS", "MESSAGE"]

    override func viewDidLoad() {
            super.viewDidLoad()
        // border radius
        viewInner.layer.cornerRadius = 10
        // border
        viewInner.layer.borderWidth = 1.0
        viewInner.layer.borderColor = UIColor.lightText.cgColor
        // shadow
        viewInner.layer.shadowColor = UIColor.black.cgColor
        viewInner.layer.shadowOffset = CGSize(width: 3, height: 3)
        viewInner.layer.shadowOpacity = 0.2
        viewInner.layer.shadowRadius = 4.0
        }
    }


extension DashboardViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DummyCollectionCell", for: indexPath) as! DummyCollectionCell
        cell.viewCell.layer.cornerRadius = 10
              // border
        cell.viewCell.layer.borderWidth = 1.0
        cell.viewCell.layer.borderColor = UIColor.lightText.cgColor
              // shadow
        cell.viewCell.layer.shadowColor = UIColor.black.cgColor
        cell.viewCell.layer.shadowOffset = CGSize(width: 3, height: 3)
        cell.viewCell.layer.shadowOpacity = 0.2
        cell.viewCell.layer.shadowRadius = 4.0
        cell.titleLabel.text = nameArr[indexPath.row]
        cell.userImageView.backgroundColor = .lightText
        return cell
    }
}

extension DashboardViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Hi", message: "\(nameArr[indexPath.row])", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
      {
              // In this function is the code you must implement to your code project if you want to change size of Collection view
              let width  = (view.frame.width-20)/3
              return CGSize(width: width, height: width)
      }

       func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
             return 1.0
      }

       func collectionView(_ collectionView: UICollectionView, layout
           collectionViewLayout: UICollectionViewLayout,
                           minimumLineSpacingForSectionAt section: Int) -> CGFloat {
             return 1.0
     }
}
class DummyCollectionCell: UICollectionViewCell {
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
}







