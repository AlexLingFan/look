import Foundation
import UIKit

class PersonPageViewController: UIViewController {

    public let kScreenHeight = UIScreen.main.bounds.size.height
    public let kScreenWidth = UIScreen.main.bounds.size.width
    var BackView = UIView.init()
    var Btn = UIButton.init()
    var uiswitch:UISwitch!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        personUI();
       
    }
    
    func personUI() {
        //定义URL对象
        let imageView = UIImageView(image:UIImage(named:"Hello"))
        imageView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 280)
        self.view.addSubview(imageView)
        
        
        Btn.frame = CGRect(x: 150, y: 300, width: 40, height: 40)
        Btn.backgroundColor = UIColor.white
        Btn.setImage(UIImage(named: ""), for: .normal)
        Btn.addTarget(self, action: #selector(HHHa), for:.touchUpInside )
        self.view.addSubview(Btn)
        
        BackView.frame = CGRect(x: 30, y: 350, width: kScreenWidth-60, height: 200)
        BackView.backgroundColor = UIColor.gray
        self.view.addSubview(BackView)
        
        
        
        uiswitch = UISwitch()
            uiswitch.frame = CGRect(x: 170, y: 90, width: 40, height: 40)
        uiswitch.isOn = true
        uiswitch.tintColor = UIColor.white
        uiswitch.onTintColor = UIColor.blue
        uiswitch.addTarget(self, action: #selector(switchDidChange), for:.touchUpInside)
            self.BackView.addSubview(uiswitch)
    
    
    
    
}

@objc func switchDidChange(){
    
    print(uiswitch.isOn)
    if (uiswitch.isOn == true){
        
        uiswitch.isOn = true
        print("sdjabfj")
        
    }
      else{
        let  alertController =  UIAlertController (title:  "系统提示" ,
                                 message:  "静音模式下，所有语音提示将被取消，可能会影响使用体验。确定修改？" , preferredStyle: .alert)
        let  cancelAction =  UIAlertAction (title:  "否" , style: .cancel, handler: { [self]action  in  uiswitch.isOn = true  })
                 let  okAction =  UIAlertAction (title:  "是" , style: . default , handler: {
                     action  in
                     print ( "点击了确定" )
                 })
                 alertController.addAction(cancelAction)
                 alertController.addAction(okAction)
                 self .present(alertController, animated:  true , completion:  nil )
        
    }
}
@objc func HHHa(){
    
    
    
}
override  func  didReceiveMemoryWarning() {
         super .didReceiveMemoryWarning()
     }

   
}

