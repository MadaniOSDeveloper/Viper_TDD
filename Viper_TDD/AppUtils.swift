//
//  AppUtils.swift
//  Viper_TDD
//
//  Created by Madan on 18/03/19.
//  Copyright © 2019 TCS. All rights reserved.
//

import UIKit

/* Show Progress Indicator */
func showProgressIndicator(view:UIView){
    
    view.isUserInteractionEnabled = false
    
    // Create and add the view to the screen.
    let progressIndicator = ProgressIndicator(text: "Please wait..Loading")
    progressIndicator.tag = GlobalConstants.PROGRESS_INDICATOR_VIEW_TAG
    view.addSubview(progressIndicator)
    
}

/* Hide progress Indicator */
func hideProgressIndicator(view:UIView){
    
    view.isUserInteractionEnabled = true
    
    if let viewWithTag = view.viewWithTag(GlobalConstants.PROGRESS_INDICATOR_VIEW_TAG) {
        viewWithTag.removeFromSuperview()
    }
    
}

func downloadImage(imageLink: String, cellImage: UIImageView){
    DispatchQueue.global().async {
        let data = try? Data(contentsOf: URL(string: imageLink)!)
        if let data = data{
            print(data)
            let dImage = UIImage(data: data)!
            DispatchQueue.main.async {
                cellImage.image  = dImage
            }
            
        }else{
            //print("URL does not exists")
        }
    }
}
