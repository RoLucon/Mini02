//
//  SideQuestViewController.swift
//  Mini02
//
//  Created by Rogerio Lucon on 24/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class SideQuestViewController: UIViewController {
    
    @IBOutlet weak var cancelaBtt: UIButton!
    @IBOutlet weak var okBtt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelaBtt.backgroundColor = .clear
        cancelaBtt.layer.cornerRadius = 14
        cancelaBtt.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        okBtt.backgroundColor = .clear
        okBtt.layer.cornerRadius = 14
        okBtt.layer.maskedCorners = [.layerMaxXMaxYCorner]
        
        let bordaOk = bordaSuperior()
        
        let bordaCancela = bordaSuperior()
        
        let bordaLateral = UIView(frame: .init(x: cancelaBtt.frame.size.width, y: 0, width: 1, height: cancelaBtt.frame.size.height))
        bordaLateral.backgroundColor = .lightGray
        
        cancelaBtt.addSubview(bordaLateral)
        cancelaBtt.addSubview(bordaCancela)
        okBtt.addSubview(bordaOk)
    }
    
    func bordaSuperior() -> UIView {
        let borda = UIView(frame: .init(x: 0, y: -1, width: cancelaBtt.frame.size.width, height: 1))
        borda.backgroundColor = .lightGray
        return borda
    }
    
    @IBAction func confirma(_ sender: Any) {
        pedePermissao()
        print("Confirma")
    }
    
    @IBAction func cancela(_ sender: Any) {
        print("Cancela")
    }
    
    func pedePermissao(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){
            granted, error in print("Permission Granted")
        }
    }
    
    static func notificacao(){
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings(completionHandler: {settings in
            switch settings.authorizationStatus{
            case .authorized, .provisional:
                geraNotificacao()
                print("Autorizado")
            case .denied, .notDetermined:
                print("Negada ou indefinida")
            @unknown default:
                print("Deault")
            }
        })
    }
    
    static func geraNotificacao(){
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: Date.init(timeIntervalSinceNow: 60))
        print(dateComponents)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = "Side Quests"
        content.body = "Hey as side quests ja estao prontas, vamos experimentar?"
        content.badge = 1
        
        let request = UNNotificationRequest(identifier: "Notificaçao", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
