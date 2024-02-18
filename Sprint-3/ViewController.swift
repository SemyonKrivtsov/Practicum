//
//  ViewController.swift
//  Sprint-3
//
//  Created by Семён Кривцов on 17.02.2024.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var historyTextView: UITextView!
        
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    // MARK: - Private property
    private var currentTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        return dateFormatter.string(from: Date())
    }
    
    private var score = 0
    private var currentScore: Int {
        set {
            if newValue < 0 {
                historyTextView.text += "\n\(currentTime): попытка уменьшить значение счётчика ниже 0"
            } else {
                score = newValue
            }
        }
        
        get {
            return score
        }
    }
    
    // MARK: - Life Cyrcle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.text = "История изменений:"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        plusButton.layer.cornerRadius = plusButton.bounds.width / 2
        minusButton.layer.cornerRadius = minusButton.bounds.width / 2
        resetButton.layer.cornerRadius = resetButton.bounds.width / 2
    }
    
    // MARK: - IBActions
    @IBAction func changeScore(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if currentScore - 1 >= 0 {
                historyTextView.text += "\n\(currentTime): значение изменено на -1"
            }
            currentScore -= 1
            
        case 1: 
            currentScore = 0
            historyTextView.text += "\n\(currentTime): значение сброшено"
            
        case 2: 
            currentScore += 1
            historyTextView.text += "\n\(currentTime): значение изменено на +1"
        default:
            currentScore = 0
        }
        
        if currentScore >= 0 {
            scoreLabel.text = String(currentScore)
        }
    }
}

