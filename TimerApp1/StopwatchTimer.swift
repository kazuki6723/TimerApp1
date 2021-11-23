//
//  StopwatchTimer.swift
//  TimerApp1
//
//  Created by ChibaKazuki on 11/5/21.
//

import Foundation

protocol PassTime {
    func changeTimeLabel(timeLabel: String)
}

class StopwatchTimer {
    
    private var timer: Timer?
    //秒数を数える
    private var secondCnt = 0
    //分数を数える
    private var minuteCnt = 0
    //時数を数える
    private var hourCnt = 0
    
    var delegate: PassTime?
    
    func runTimer() {
        
        if timer == nil {
            //タイマーをセット、一秒ごとにupdateCurrentTimeを呼ぶ
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: true)
        }
    }
    
    @objc private func updateLabel() {
        
        //秒のインクリメント
        secondCnt += 1
        
        if secondCnt == 60 {
            
            secondCnt = 0
            //分のインクリメント
            minuteCnt += 1
            if minuteCnt == 60 {
                
                minuteCnt = 0
                //時のインクリメント
                hourCnt += 1
                if hourCnt == 24 {
                    //24時間経ったら0に戻す
                    hourCnt = 0
                }
            }
        }
        
        //0埋めする
        let secondStr = String(format: "%02d", secondCnt)
        let minuteStr = String(format: "%02d", minuteCnt)
        let hourStr = String(format: "%02d", hourCnt)
        
        //表示する形式にする
        let timeLabel = "\(hourStr):\(minuteStr):\(secondStr)"
        
        delegate?.changeTimeLabel(timeLabel: timeLabel)
        
    }
    
    func stopTimer() {
        if timer != nil {
            
            //タイマーを止める
            timer?.invalidate()
            timer = nil
        }
    }
    
}
