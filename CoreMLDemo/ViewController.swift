//
//  ViewController.swift
//  CoreMLDemo
//
//  Created by Yvan Gauthier on 02/08/2024.
//

import CoreML
import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(imageView)
    }
    private func analyzeImage(image: UIImage?){
       guard let buffer = image?.resize(size: CGSize(width: 224, height: 224))?
        .getCVPixelBuffer()else{
           return
       }
        
        do{
            let config = MLModelConfiguration()
            let model = try GoogLeNetPlaces(configuration: config)
            let input = GoogLeNetPlacesInput(sceneImage: buffer)
        }
        catch {
            
        }
    }

}

