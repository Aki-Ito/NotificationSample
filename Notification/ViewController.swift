//
//  ViewController.swift
//  Notification
//
//  Created by 伊藤明孝 on 2023/06/03.
//

import UIKit
//TODO: 追加
import NotificationCenter

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //TODO: 追加
    @IBAction func addNotification(){
        let datePickerTime = datePicker.date
        
        let notificationTitle: String = "通知のタイトル"
        let calendar: Calendar = Calendar.current
        //MARK: datePickerから取得した日付や時間を反映する(今回は時間と分のみ)
        let trigger: UNCalendarNotificationTrigger = UNCalendarNotificationTrigger(dateMatching: calendar.dateComponents([.hour, .minute], from: datePickerTime), repeats: false)
        
        // MARK: 通知の中身を設定
        let content: UNMutableNotificationContent = UNMutableNotificationContent()
        content.title = notificationTitle
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        // MARK: 通知のリクエストを作成
        let request: UNNotificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        // MARK: 通知のリクエストを実際に登録する
        UNUserNotificationCenter.current().add(request) { (error: Error?) in
            // エラーが存在しているかをif文で確認している
            if error != nil {
                // MARK: エラーが出た時の処理をかく
                print("error")
            } else {
                // MARK: 成功した時の処理をかく
                print("success")
            }
        }
        
        
    }
    
    
}

