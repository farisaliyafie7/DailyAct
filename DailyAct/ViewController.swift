//
//  ViewController.swift
//  DailyAct
//
//  Created by Faris Ali Yafie on 02/03/20.
//  Copyright © 2020 Faris Ali Yafie. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var workTimeButton: UIButton!
    @IBOutlet weak var studyTimeButton: UIButton!
    @IBOutlet weak var exerciseButton: UIButton!
    @IBOutlet weak var hangoutButton: UIButton!
    @IBOutlet weak var restTimeButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    
    @IBOutlet weak var workTimeLabel: UILabel!
    @IBOutlet weak var studyTimeLabel: UILabel!
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var hangoutLabel: UILabel!
    @IBOutlet weak var restTimeLabel: UILabel!
    
//     set color
    let greenColor  = UIColor.green
    let redColor    = UIColor.red
    let blackColor  = UIColor.black
    let whiteColor  = UIColor.white
    
//    set image
    let pauseImage      = UIImage(named: "pause")
    let workImage       = UIImage(named: "work")
    let studyImage      = UIImage(named: "study")
    let exerciseImage   = UIImage(named: "train")
    let hangoutImage    = UIImage(named: "hangout")
    let restImage       = UIImage(named: "sleep")

//     set var timer, counter and clock to all button
    var timer = Timer()
    var counter:[String:Int]    = ["work" : 0, "study" : 0, "exercise" : 0, "hangout" : 0, "rest" : 0]
    var second:[String:Int]     = ["work" : 0, "study" : 0, "exercise" : 0, "hangout" : 0, "rest" : 0]
    var minute:[String:Int]     = ["work" : 0, "study" : 0, "exercise" : 0, "hangout" : 0, "rest" : 0]
    var hour:[String:Int]       = ["work" : 0, "study" : 0, "exercise" : 0, "hangout" : 0, "rest" : 0]
    
//     var for result activity
    var resultCondition : [String] = ["Poor", "Good", "Over"]
    var result : [String:String] = ["work" : "", "study" : "", "exercise" : "", "hangout" : "", "rest" : ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         Do any additional setup after loading the view.
        imageView.image = pauseImage
        
//         set corner for all image and button
//        image
        imageView.layer.cornerRadius = 5
//         blue button
        resetButton.layer.cornerRadius = 5
        pauseButton.layer.cornerRadius = 5
        resultButton.layer.cornerRadius = 5
//        red button
        workTimeButton.layer.cornerRadius = 5
        studyTimeButton.layer.cornerRadius = 5
        exerciseButton.layer.cornerRadius = 5
        hangoutButton.layer.cornerRadius = 5
        restTimeButton.layer.cornerRadius = 5
        
    }

    
    @IBAction func buttonPressed(_ sender: UIButton){
//        stop timer
        timer.invalidate()
//         call timer to count up
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerON), userInfo: nil, repeats: true)
        
//        normalization button
        workTimeButton.setTitleColor(whiteColor, for : .normal)
        workTimeButton.backgroundColor = redColor
        studyTimeButton.setTitleColor(whiteColor, for : .normal)
        studyTimeButton.backgroundColor = redColor
        exerciseButton.setTitleColor(whiteColor, for : .normal)
        exerciseButton.backgroundColor = redColor
        hangoutButton.setTitleColor(whiteColor, for : .normal)
        hangoutButton.backgroundColor = redColor
        restTimeButton.setTitleColor(whiteColor, for : .normal)
        restTimeButton.backgroundColor = redColor

        switch sender {
            case workTimeButton:
                imageView.image = workImage
                workTimeButton.setTitleColor(blackColor, for : .normal)
                workTimeButton.backgroundColor = greenColor
                stateLabel.text = "State : Working"
            case studyTimeButton:
                imageView.image = studyImage
                studyTimeButton.setTitleColor(blackColor, for: .normal)
                studyTimeButton.backgroundColor = greenColor
                stateLabel.text = "State : Studying"
            case exerciseButton:
                imageView.image = exerciseImage
                exerciseButton.setTitleColor(blackColor, for: .normal)
                exerciseButton.backgroundColor = greenColor
                stateLabel.text = "State : Training"
            case hangoutButton:
                imageView.image = hangoutImage
                hangoutButton.setTitleColor(blackColor, for: .normal)
                hangoutButton.backgroundColor = greenColor
                stateLabel.text = "State : Hanging Out"
            case restTimeButton:
                imageView.image = restImage
                restTimeButton.setTitleColor(blackColor, for: .normal)
                restTimeButton.backgroundColor = greenColor
                stateLabel.text = "State : Sleeping"
            default:
                print("pause buttonPressed")
                imageView.image = pauseImage
                stateLabel.text = "State : Do nothing"
//                stop timer
                timer.invalidate()
        }
        
    }
    
//          Select and counter timer activity
    @objc func timerON(){
//          start counter
//          input counter value to clock/timer activity
        switch greenColor {
        case workTimeButton.backgroundColor:
            counter["work"]! += 1
            second["work"] = counter["work"]!%60
            minute["work"] = (counter["work"]!/60)%60
            hour["work"] = (counter["work"]!/3600)%24
        case studyTimeButton.backgroundColor:
            counter["study"]! += 1
            second["study"] = counter["study"]!%60
            minute["study"] = (counter["study"]!/60)%60
            hour["study"] = (counter["study"]!/3600)%24
        case exerciseButton.backgroundColor:
            counter["exercise"]! += 1
            second["exercise"] = counter["exercise"]!%60
            minute["exercise"] = (counter["exercise"]!/60)%60
            hour["exercise"] = (counter["exercise"]!/3600)%24
        case hangoutButton.backgroundColor:
            counter["hangout"]! += 1
            second["hangout"] = counter["hangout"]!%60
            minute["hangout"] = (counter["hangout"]!/60)%60
            hour["hangout"] = (counter["hangout"]!/3600)%24
        case restTimeButton.backgroundColor:
            counter["rest"]! += 1
            second["rest"] = counter["rest"]!%60
            minute["rest"] = (counter["rest"]!/60)%60
            hour["rest"] = (counter["rest"]!/3600)%24
        default:
            print("pause countUp")
        }
        
        // display clock value to right label
        workTimeLabel.text = "\(hour["work"]!) h \(minute["work"]!) m \(second["work"]!) s"
        studyTimeLabel.text = "\(hour["study"]!) h \(minute["study"]!) m \(second["study"]!) s"
        exerciseLabel.text = "\(hour["exercise"]!) h \(minute["exercise"]!) m \(second["exercise"]!) s"
        hangoutLabel.text = "\(hour["hangout"]!) h \(minute["hangout"]!) m \(second["hangout"]!) s"
        restTimeLabel.text = "\(hour["rest"]!) h \(minute["rest"]!) m \(second["rest"]!) s"
    }
    
//     reset all status
    @IBAction func resetPressed(_ sender: UIButton){
        
//         notification in console
        print("reset task")
        
//         Set up Pop Up or alertController
        let alertController = UIAlertController(title: "Reset", message: "Are you sure?", preferredStyle: .alert)
        
//         set up action
        let yesAction = UIAlertAction(title: "Yes", style: .default){_ in
//            stop timer
            self.timer.invalidate()
            self.counter = ["work" : 0, "study" : 0, "exercise" : 0, "hangout" : 0, "rest" : 0]
            self.second = ["work" : 0, "study" : 0, "exercise" : 0, "hangout" : 0, "rest" : 0]
            self.minute = ["work" : 0, "study" : 0, "exercise" : 0, "hangout" : 0, "rest" : 0]
            self.hour = ["work" : 0, "study" : 0, "exercise" : 0, "hangout" : 0, "rest" : 0]
            self.result = ["work" : "", "study" : "", "exercise" : "", "hangout" : "", "rest" : ""]
//            normalization button and label
            self.imageView.image = self.pauseImage
            self.workTimeButton.setTitleColor(self.whiteColor, for : .normal)
            self.workTimeButton.backgroundColor = self.redColor
            self.studyTimeButton.setTitleColor(self.whiteColor, for : .normal)
            self.studyTimeButton.backgroundColor = self.redColor
            self.exerciseButton.setTitleColor(self.whiteColor, for : .normal)
            self.exerciseButton.backgroundColor = self.redColor
            self.hangoutButton.setTitleColor(self.whiteColor, for : .normal)
            self.hangoutButton.backgroundColor = self.redColor
            self.restTimeButton.setTitleColor(self.whiteColor, for : .normal)
            self.restTimeButton.backgroundColor = self.redColor
            self.workTimeLabel.text  = "0 h 0 m 0 s"
            self.studyTimeLabel.text = "0 h 0 m 0 s"
            self.exerciseLabel.text  = "0 h 0 m 0 s"
            self.hangoutLabel.text   = "0 h 0 m 0 s"
            self.restTimeLabel.text  = "0 h 0 m 0 s"
            self.stateLabel.text     = "State : Do nothing"
        }
        
        let noAction = UIAlertAction(title: "No", style: .cancel)
        
//         add action
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        
//         Present Pop Up
        present(alertController, animated: true)
    }
    
//     display activity result
    @IBAction func resultPressed(_ sender: UIButton){
//         notification in console
            print("display activity result")
        
//      begin : calculate result
//      work : poor = less 8 hours, over = more 12 hours
        if hour["work"]! < 8 {
            result["work"] = resultCondition[0]
        }else if hour["work"]! >= 8 && hour["work"]! < 12 || hour["work"]! == 12  && minute["work"]! == 0 && minute["work"]! == 0{
            result["work"] = resultCondition[1]
        }else{
            result["work"] = resultCondition[2]
        }
        
//      study : poor = less 2 hours, over = more 6 hours
        if hour["study"]! < 2 {
            result["study"] = resultCondition[0]
        }else if hour["study"]! >= 2 && hour["study"]! < 6 || hour["study"]! == 6 && minute["study"]! == 0 && second["study"]! == 0 {
            result["study"] = resultCondition[1]
        }else{
            result["study"] = resultCondition[2]
        }
        
//      exercise : poor = less 30 minutes, over = more 2 hours
        if hour["exercise"]! < 1 && minute["exercise"]! < 30 {
            result["exercise"] = resultCondition[0]
        }else if hour["exercise"]! == 0 && minute["exercise"]! >= 30 || hour["exercise"]! == 1 || hour["exercise"]! == 2  && minute["exercise"]! == 0 && minute["exercise"]! == 0{
            result["exercise"] = resultCondition[1]
        }else{
            result["exercise"] = resultCondition[2]
        }
        
//      hangout : poor = less 1 hours, over = more 3 hours
        if hour["hangout"]! < 1 {
            result["hangout"] = resultCondition[0]
        }else if hour["hangout"]! >= 1 && hour["hangout"]! < 3 || hour["hangout"]! == 3  && minute["hangout"]! == 0 && minute["hangout"]! == 0{
            result["hangout"] = resultCondition[1]
        }else{
            result["hangout"] = resultCondition[2]
        }
        
//      rest : poor = less 6 hours, over = more 8 hours
        if hour["rest"]! < 6 {
            result["rest"] = resultCondition[0]
        }else if hour["rest"]! >= 6 && hour["rest"]! < 8 || hour["rest"]! == 8  && minute["rest"]! == 0 && minute["rest"]! == 0{
            result["rest"] = resultCondition[1]
        }else{
            result["rest"] = resultCondition[2]
        }
//      end : calculate result

//      Set up Pop Up or alertController
        let alertController = UIAlertController(title: "Your Result", message:
            "Work Time : \(result["work"]!)\nStudy Time : \(result["study"]!)\nExercise Time : \(result["exercise"]!)\nHangout Time : \(result["hangout"]!)\nRest Time : \(result["rest"]!)",
            preferredStyle: .alert)
            
//      set up action
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        
//      add action
        alertController.addAction(okAction)
            
//      Present Pop Up
        present(alertController, animated: true)
        
        
    }
}

