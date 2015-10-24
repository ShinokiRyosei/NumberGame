//
//  ViewController.swift
//  NumberGame
//
//  Created by ShinokiRyosei on 2015/10/24.
//  Copyright © 2015年 ShinokiRyosei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var label: UILabel!
    
    //挑戦した回数
    var count = 0
    
    //picker viewで選択したインデックス番号
    var selectedIndex = 0
    
    var numbers = [0,1,2,3,4,5,6,7,8,9]
    
    //すべての文字列のからの配列を宣言
    var answers = [Int](count: 4, repeatedValue: 0)
    var array = [String]()
    
    //ラベルをアウトプット接続
    @IBOutlet var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerView.delegate = self
        
        pickerView.dataSource = self
        
        textView.text = ""
        
        print("\(pickerView.numberOfComponents)")
        
        let a = Int(arc4random_uniform(UInt32(numbers.count)))
        answers[0] = numbers.removeAtIndex(a)
        
        let b = Int(arc4random_uniform(UInt32(numbers.count)))
        answers[1] = numbers.removeAtIndex(b)
        
        let c = Int(arc4random_uniform(UInt32(numbers.count)))
        answers[2] = numbers.removeAtIndex(c)
        
        let d = Int(arc4random_uniform(UInt32(numbers.count)))
        answers[3] = numbers.removeAtIndex(d)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //pickerに表示する列数を返すデータソースメソッド
    //（実装必須）表示列
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 4
    }
    
    //pickerに表示する行数を返すデータソースメソッド
    //(実装必須)表示個数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    //pickerに表示する値を返すデリゲートメソッド、表示内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
    
    //選択時
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }
    
    @IBAction func enter(sender: UIButton) {
        //選択されている値のインデックス番号を取得する
        var hit: Int = 0
        var blow: Int = 0
            
        
        print("************")
        count++
        print("count : \(count)")
        
        //hitとblowの判定
        for i in 0 ..< 4 {
            let selectedNumber = pickerView.selectedRowInComponent(i)
            let answer = answers[i]
            
            print("\(selectedNumber) -> \(answer)")
            
            switch (selectedNumber) {
            case answer:
                hit++ //selectedNumber == answerのとき実行される
                break
            case answers[0]:
                blow++ //selectedNumber == answer[0]のときじっこうされる
            case answers[1]:
                blow++ //selectedNumber == answer[1]のときじっこうされる
            case answers[2]:
                blow++ //selectedNumber == answer[2]のときじっこうされる
            case answers[3]:
                blow++ //selectedNumber == answer[3]のときじっこうされる
            default:
                break
                
            }
        }
        
        NSLog("\(hit)hit")
        //答えがあったらクリアと表示、違うときは現在の結果を表示
        if hit == 4 {
            label.text = "クリア！"
            label.textColor = UIColor.redColor()
            sender.enabled = false
        }else {
            label.text = "\(hit)hit! \(blow)blow"
            textView.text = "\(hit)hit! \(blow)blow!\n" + textView.text
        }
        
    }
    
}

