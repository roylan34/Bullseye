//
//  ViewController.swift
//  Bullseye
//
//  Created by Roelan Eroy on 8/2/20.
//  Copyright © 2020 Roe Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   var sliderValue: Int = 25;
   var targetValue: Int = 0;
   var score = 0;
   var round = 0;
   
   @IBOutlet weak var slider: UISlider!
   @IBOutlet weak var targetLabel: UILabel!
   @IBOutlet weak var scoreLabel: UILabel!
   @IBOutlet weak var roundLabel: UILabel!
   
    override func viewDidLoad() {
      super.viewDidLoad();
      let rounded = slider.value.rounded();
          sliderValue = Int(rounded);
      startNewGame();
      
      //Customize slider
      let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
      slider.setThumbImage(thumbImageNormal, for: .normal);
      
      let thumbImageHighlight = #imageLiteral(resourceName: "SliderThumb-Highlighted");
      slider.setThumbImage(thumbImageHighlight, for: .highlighted);
      
      let insets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20);
      
      
      let trackLeftImage = UIImage(named: "SliderTrackLeft")!;
      let tractLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets);
      slider.setMinimumTrackImage(tractLeftResizable, for: .normal);
      
      let trackRightImage = UIImage(named: "SliderTrackRight")!;
      let tractRightResizable = trackRightImage.resizableImage(withCapInsets: insets);
        slider.setMaximumTrackImage(tractRightResizable, for: .normal);
    }

   @IBAction func showHitMeAlert(){
      var points: Int;
      
      points = abs(targetValue - sliderValue);
      score += points;
   
      let title: String;
      if(points < 5){
         title = "Perfect!"
         points += 100;
      } else if( points < 10){
         title = "Almost had it!";
          points += 50;
      }
      else{
         title = "Try next time";
      }
      
      let message = "Your ponts: \(points)";
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let action = UIAlertAction(title: "OK", style: .default,  handler: { _ in self.startNewRound() } )
      
      alert.addAction(action)
      
      present(alert, animated: true, completion: nil)
   }
   
   @IBAction func sliderMoved(_ slider: UISlider){
      let rounded = slider.value.rounded()
      sliderValue = Int(rounded);
   }
   
   func startNewRound(){
      targetValue = Int.random(in: 1...100);
      sliderValue = 50;
      slider.value = Float(sliderValue)
      updateLabels();
   }
   
   func updateLabels(){
      targetLabel.text = String(targetValue);
      scoreLabel.text = String(score);
      round += 1;
      roundLabel.text = String(round);
   }
   
   @IBAction func startNewGame(){
      score = 0;
      round = 0;
      startNewRound();
   }
}

