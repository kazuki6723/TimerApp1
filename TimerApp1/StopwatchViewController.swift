//
//  StopwatchViewController.swift
//  TimerApp1
//
//  Created by 千葉和貴 on 2021/05/05.
//

import UIKit

class StopwatchViewController: UIViewController, PassTime {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    private let stopwatchT = StopwatchTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //labelに表示する文字を等幅にする
        label.font = .monospacedDigitSystemFont(ofSize: 30, weight: .medium)
        label.text = "00:00:00"
        
        //delegateを登録
        stopwatchT.delegate = self
    }
    
    @IBAction func startAction(_ sender: Any) {
        //buttonのタイトルでタイマーをスタートさせたり、止める。
        if startButton.titleLabel?.text == "start" {
            
            startButton.setTitle("stop", for: .normal)
            stopwatchT.runTimer()
        } else {
            startButton.setTitle("start", for: .normal)
            stopwatchT.stopTimer()
        }

    }
    
    func changeTimeLabel(timeLabel: String) {
        label.text = timeLabel
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
