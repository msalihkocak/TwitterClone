//
//  HomeDatasourceController.swift
//  TwitterClone
//
//  Created by Mehmet Salih Koçak on 18.11.2018.
//  Copyright © 2018 Mehmet Salih Koçak. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasourceController: DatasourceController{
    
    let errorLabel:UILabel = {
        let label = UILabel()
        label.text = "Sorry for inconvinience but something just went wrong!!!"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .collectionViewBackground
        
        view.addSubview(errorLabel)
        errorLabel.fillSuperview()
        self.errorLabel.isHidden = true
        
        setupNavBarItems()
        Service.shared.fetchHomeFeed { (home, error) in
            if let error = error{
                print(error.localizedDescription)
                self.errorLabel.isHidden = false
                return
            }
            self.errorLabel.isHidden = true
            self.datasource = home
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1{
            let cell = collectionView.cellForItem(at: indexPath) as? TweetCell
            cell?.link = self
        }
        return estimateRowHeight(at: indexPath)
    }
    
    private func estimateRowHeight(at indexPath:IndexPath) -> CGSize{
        let size = CGSize(width: view.frame.width - 88, height: .infinity)
        let attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15)]
        
        if let user = datasource?.item(indexPath) as? User {
            
            let estimatedFrame = NSString(string: user.bio).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }else if let tweet = datasource?.item(indexPath) as? Tweet{
            
            let estimatedFrame = NSString(string: tweet.message).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 220)
        }else{
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return section == 0 ? CGSize(width: view.frame.width, height: 45) : .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return section == 0 ? CGSize(width: view.frame.width, height: 56) : .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    // Variables for image zooming operations
    var startingFrame: CGRect?
    var blackBackgroundView: UIView?
    var startingImageView:UIImageView?
}
