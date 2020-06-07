//
//  ViewController.swift
//  Basis
//
//  Created by GAURAV NAYAK on 05/06/20.
//  Copyright © 2020 CaffeineDevotee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cardData : [ResponseData] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var resetButtonOutlet: UIButton!
    
    @IBAction func resetButtonAction(_ sender: UIButton) {
        self.resetButtonOutlet.isHidden = true
        self.progressLabel.text = "1/\(self.cardData.count)"
        self.collectionView.scrollToFirst()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.startActivityIndicator()
        ViewControllerService.instance.getCardData(success: { (response) in
            if response != nil && response?.data != nil && response?.data!.count ?? 0 > 0 {
                self.cardData = (response?.data)!
                self.afterResponse()
            } else {
                print("Failed")
            }
            self.stopActivityIndicator()
        }) { (error) in
            print(error ?? "Failed")
            self.stopActivityIndicator()
        }
        
    }
    
    func afterResponse() {
        self.progressLabel.text = "1/\(self.cardData.count)"
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.collectionViewLayout = CardCollectionViewLayout()
        self.collectionView.isPagingEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.reloadData()
    }
    
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cardData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        cell.messageLabel.text = self.cardData[indexPath.row].text ?? " "
        cell.updateCell()
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let count = (self.collectionView.indexPathsForVisibleItems.min()?.row ?? 0) + 1
        count == 8 ? (self.resetButtonOutlet.isHidden = false) : (self.resetButtonOutlet.isHidden = true)
        self.progressLabel.text = "\(count)/\(self.cardData.count)"
    }
}
