//  ViewController.swift
//  SliderGameF20


import UIKit

class ViewController: UIViewController {
  
  let game = Game()

  override func viewDidLoad() {
    super.viewDidLoad()
    game.startNewGame()
    updateLabels()
  }
  
  // Outlets
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!

  // Actions
  @IBAction func showAlert() {
    let title = game.determineTitle()
    let message = game.generateMessage()
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default,
                               handler: { action in
                                self.startNewRound()
                                self.updateLabels()
    })
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }

  @IBAction func sliderMoved(_ slider: UISlider) {
    let currentValue = lroundf(slider.value)
    game.currentValue = currentValue
  }

  @IBAction func startOver() {
    game.startNewGame()
    updateLabels()
  }
  
  private func updateLabels() {
    targetLabel.text = String(game.targetValue)
    roundLabel.text = String(game.round)
    scoreLabel.text = String(game.score)
  }
  
  private func startNewRound() {
    game.calculateScore()
    game.startNewRound()
    slider.value = Float(game.currentValue)
  }

}

