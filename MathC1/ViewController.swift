//
//  ViewController.swift
//  MathC1
//
//  Created by NguyenDucBien on 11/14/16.
//  Copyright © 2016 NguyenDucBien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lbl_p1: UILabel!
    
    @IBOutlet weak var lbl_p2: UILabel!
    
    @IBOutlet weak var btn_b1: UIButton!
    
    @IBOutlet weak var btn_b2: UIButton!
    
    @IBOutlet weak var btn_b3: UIButton!
    
    @IBOutlet weak var lbl_time: UILabel!
    
    @IBOutlet weak var lbl_pheptinh: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRandom()
        

        
    }
    
    
    
    @IBAction func btn_action(sender: UIButton) {
        setRandom()
//    let timer = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: #selector(setRandom), userInfo: nil, repeats: true)
    
    }
    
    func setRandom(){
        
        //Lay ra 2 so ngau nhien
        let random1 = Int(arc4random_uniform(8)) + 1         //random so tu 0-8 cong them 1 nen khoang random se la 1-8
        let random2 = Int(arc4random_uniform(8)) + 1
        print("\(random1) \(random2)")
        
        //        let cong: String = "+"
        //        let tru: String = "-"
        //        let nhan: String = "X"
        //        let chia: String = "/"
        
        let pheptinh = Int(arc4random_uniform(4))
        if(pheptinh == 0){
            lbl_pheptinh.text = "+"
        }
        else if(pheptinh == 1)
        {
            lbl_pheptinh.text = "-"
        }
        else if(pheptinh == 2)
        {
            lbl_pheptinh.text = "X"
        }
        else
        {
            lbl_pheptinh.text = "/"
        }
        
        //Hien thi 2 so ngau nhien len view
        lbl_p1.text = String(random1)
        lbl_p2.text = String(random2)
        setResult(random1, randomB: random2)
        
        
        
    }
    
    
    func setResult(randomA: Int, randomB: Int)
    {
        var kq = 0
        
        if(lbl_pheptinh.text == "+")
        {
            kq = sum(randomA, p2: randomB)
        }
        else if(lbl_pheptinh.text == "-")
        {
            kq = tru(randomA, p2: randomB)
        }
        else if(lbl_pheptinh.text == "X")
        {
            kq = nhan(randomA, p2: randomB)
        }
        else
        {
            kq = chia(randomA, p2: randomB)
        }
        setHienThi(kq)
        
    }
    func setHienThi(kq: Int)
    {
        
        let randomViTri = Int(arc4random_uniform(3))
        
        if(randomViTri == 0)
        {
            btn_b1.setTitle(String(kq),forState: .Normal)
            btn_b3.setTitle(String("1"), forState: .Normal)
        }
        else if(randomViTri == 1)
        {
            btn_b2.setTitle(String(kq),forState: .Normal)
            btn_b3.setTitle(String("2"), forState: .Normal)
        }
        else
        {
            btn_b3.setTitle(String(kq),forState: .Normal)
            btn_b1.setTitle(String("3"), forState: .Normal)
        }
    }
    
}


//Tinh toan
func sum(p1: Int, p2: Int) -> Int
{
    return p1 + p2;
}
func tru(p1: Int, p2: Int) -> Int
{
    return p1 - p2;
}
func nhan(p1: Int, p2: Int) -> Int
{
    return p1 * p2;
}
func chia(p1: Int, p2: Int) -> Int
{
    return p1 / p2;
}










