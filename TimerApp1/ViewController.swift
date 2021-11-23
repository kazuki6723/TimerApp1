//
//  ViewController.swift
//  TimerApp1
//
//  Created by 千葉和貴 on 2021/05/04.
//

import UIKit
import AMNowClockView

class ViewController: UIViewController {

    @IBOutlet weak var txtYear: UITextField!
    @IBOutlet weak var txtWeekday: UITextField!
    @IBOutlet weak var txtHour: UITextField!
    @IBOutlet weak var clockView: AMNowClockView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timerStart()
    }

    private func timerStart() {
        let timer = Timer(timeInterval: 1, target: self, selector: #selector(timerCheck), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .default)
    }
    
    @objc private func timerCheck() {
        let date = NSDate()
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let weekdayArray = ["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"]
        
        let year = calendar?.component(.year, from: date as Date)
        let month = calendar?.component(.month, from: date as Date)
        let day = calendar?.component(.day, from: date as Date)
        let weekday = calendar?.component(.weekday, from: date as Date)
        let hour = calendar?.component(.hour, from: date as Date)
        let minute = calendar?.component(.minute, from: date as Date)
        let second = calendar?.component(.second, from: date as Date)
                        
        let hourLabel = String(format: "%02d", hour!)
        let minuteLabel = String(format: "%02d", minute!)
        let secondLabel = String(format: "%02d", second!)
        txtHour.text = "\(hourLabel):\(minuteLabel):\(secondLabel)"
        editTextField(textField: txtHour, size: 60.0)

        let yearLabel = String(year!)
        let monthLabel = String(format: "%02d", month!)
        let dayLabel = String(format: "%02d", day!)
        txtYear.text = "\(yearLabel)年\(monthLabel)月\(dayLabel)日"
        editTextField(textField: txtYear, size: 20.0)
        
        let dayOfTheWeek = weekdayArray[weekday! - 1]
        txtWeekday.text = dayOfTheWeek
        editTextField(textField: txtWeekday, size: 20.0)
    }

    func editTextField(textField: UITextField, size: CGFloat) {
        textField.font = UIFont.monospacedDigitSystemFont(ofSize: size, weight: .medium)
        textField.borderStyle = .none
        textField.textAlignment = .center
        textField.isEnabled = false
    }
    
}

