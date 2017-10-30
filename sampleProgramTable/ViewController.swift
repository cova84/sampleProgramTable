//
//  ViewController.swift
//  sampleProgramTable
//
//  Created by 小林由知 on 2017/10/30.
//  Copyright © 2017年 Yoshitomo Kobatashi. All rights reserved.
//

import UIKit


//1.プロトコルの設定（UITableViewDataSource,UITableViewDelegateの追加）
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    var proArray = ["C言語","Swift","PHP","Javascript","Ruby","Java","Python"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //2.行数の設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //okayu　１行追加したので、ここに１を足さないといけない
        return (proArray.count + 1)
    }
    
    //3.リストに表示する文字列
    //indexPath 行番号とかいろいろ入っている　セルを指定する時によく使う
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //文字列を表示するせるの取得（セルの再利用)
        //okayu indexPath.rowが0からproArray.countまで、１行ずつ設定されるメソッド
        //okayu　　　今回はindexPath.rowで切りかえしてみたけれど、セクションで分ける手もあるかも
        
        switch indexPath.row {
        case 0:
            //okayu １行目はindexPath.row=0 なので、0の時に、.textをプログラム配列の表示
            //okayu このすぐ下の行は、caseでわけなくても良いけれどヒントで出してしまったので入れておく。
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell_red", for: indexPath)
            cell1.textLabel?.text = "プログラム配列の表示"
            
            //表示したい文字の設定（セルの中には文字、画像も入る）
            cell1.textLabel?.font = UIFont(name: "AmericanTypewriter", size: 18)
            cell1.textLabel?.textColor = UIColor.white
            return cell1
            
        default:
            //okayu　２行目以降はproArrayをはめる。
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell_blue", for: indexPath)
            cell1.textLabel?.text = proArray[indexPath.row - 1]
            
            //表示したい文字の設定（セルの中には文字、画像も入る）
            cell1.textLabel?.font = UIFont(name: "AmericanTypewriter", size: 18)
            cell1.textLabel?.textColor = UIColor.white
            return cell1
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
