//
//  ViewController.swift
//  2B Or Not 2B
//
//  Created by Eremej Sumcenko on 04.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let NOT_2B = "NOT_2B"
    let IS_2B = "IS_2B"
    
    //var score = 0
    
    @IBOutlet weak var contestImage: UIImageView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setNextRandomImage()
        
        scoreLabel.text = "0"
    }
    
    func getImages() -> [UIImage: String] {
        return [
            #imageLiteral(resourceName: "pngaaa.com-680791"): NOT_2B,
            #imageLiteral(resourceName: "pngaaa.com-2631538"): NOT_2B,
            #imageLiteral(resourceName: "pngaaa.com-2337893"): NOT_2B,
            #imageLiteral(resourceName: "pngaaa.com-2631468"): NOT_2B,
            #imageLiteral(resourceName: "pngaaa.com-2631420"): NOT_2B,
            #imageLiteral(resourceName: "pngaaa.com-2631488"): IS_2B,
            #imageLiteral(resourceName: "yande.re 739992 sample heels leotard nier_automata tagme thighhighs yorha_no.2_type_b"): IS_2B,
            #imageLiteral(resourceName: "pngaaa.com-2631594"): IS_2B,
        ]
    }
    
    func setScore(isRight: Bool) {
        var score = Int(scoreLabel.text!)!
        if isRight {
            score += 1
        }
        scoreLabel.text = String(score)
    }
    
    func setNextRandomImage() {
        let currentImage = contestImage.image
        var nextImage: UIImage?
        
        repeat {
            nextImage = getImages().randomElement()?.key
        } while (nextImage!.isEqual(currentImage))
        
        contestImage.image = nextImage
    }
    
    func checkIS2B(image: UIImage?) -> Bool {
        if image == nil {
            return false
        }
        return getImages()[image!] == IS_2B
    }

    @IBAction func onPositiveTouch(_ sender: UIButton) {
        print(checkIS2B(image: contestImage.image))
        
        setScore(isRight: checkIS2B(image: contestImage.image))
        setNextRandomImage()
    }
    
    @IBAction func onNegativeTouch(_ sender: UIButton) {
        print(!checkIS2B(image: contestImage.image))

        setScore(isRight: !checkIS2B(image: contestImage.image))
        setNextRandomImage()
    }
    
    
}

