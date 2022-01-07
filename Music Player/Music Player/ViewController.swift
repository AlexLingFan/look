import Foundation
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    public let labelT1 = UILabel()
    public let labelT2 = UILabel()
    
    public let kScreenHeight = UIScreen.main.bounds.size.height
    public let kScreenWidth = UIScreen.main.bounds.size.width
    var lable:UILabel? = UILabel.init()
    var textFiled:UITextField? = UITextField.init()
    var button:UIButton? = UIButton.init()
    
    var labelKeep = UILabel()
    
    var labelCount = UILabel.init()
    var labelPwd = UILabel.init()
    
    let textfieldCount = UITextField()
    let textfieldPwd = UITextField()
    
    let buttonSubmit = UIButton.init()
    
    
    var timer = Timer()
    var window: UIWindow?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 隐藏首页的导航栏 true 有动画
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        baseUI();
        
    }
    
    func baseUI(){
        
        //  父视图
        let layerView = UIView()
        layerView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
        layerView.alpha = 1
        //  strokeCode
        let borderLayer1  = CALayer()
        borderLayer1.frame = layerView.bounds
        borderLayer1.borderColor = UIColor(red: 0.44, green: 0.44, blue: 0.44, alpha: 1).cgColor
        layerView.layer.borderWidth = 1
        layerView.layer.addSublayer(borderLayer1)
        //  fillCode
        let bgLayer1 = CALayer()
        bgLayer1.frame = layerView.bounds
        bgLayer1.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1).cgColor
        layerView.layer.addSublayer(bgLayer1)
        self.view.addSubview(layerView)
        
        //  Welcome to China
        labelKeep.text = "Welcome to China"
        labelKeep.frame = CGRect(x: 40, y: 60, width: kScreenWidth - 100, height: 21)
        labelKeep.textColor = UIColor.white
//        labelKeep.font = UIFont(name:"Athelas", size:26)
        labelKeep .font = UIFont(name:"Zapfino",size:24)
        layerView.addSubview(labelKeep)
        
        //  横线视图
        let layerView4 = UIView()
        layerView4.frame = CGRect(x: 40, y: labelKeep.frame.origin.y + 31, width: 295, height: 1)
        layerView4.alpha = 1
        //  fillCode
        let bgLayer4 = CALayer()
        bgLayer4.frame = layerView4.bounds
        bgLayer4.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        layerView4.layer.addSublayer(bgLayer4)
        layerView.addSubview(layerView4)
        
        //  子视图
        let layerView2 = UIView()
        layerView2.frame = CGRect(x: (self.view.frame.size.width-304)/2, y: 160, width: 304, height: 234)
        layerView2.alpha = 1
        //  fillCode
        let bgLayer2 = CALayer()
        bgLayer2.frame = layerView2.bounds
        bgLayer2.backgroundColor = UIColor(red: 0.44, green: 0.44, blue: 0.44, alpha: 1).cgColor
        layerView2.layer.addSublayer(bgLayer2)
        //  shadowCode
        layerView2.layer.shadowRadius = 6
        layerView2.layer.shadowOffset = CGSize(width: 0, height: 3)
        //shadow.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        self.view.addSubview(layerView2)
        
        //  账号
        labelCount.text = "账号:"
        labelCount.frame = CGRect(x: 38, y: 20, width: 49, height: 12)
        labelCount.font = UIFont(name:"Avenir Next", size:12)
        layerView2.addSubview(labelCount)          //在父视图的基础上添加子视图
        
        //  账号输入框
        textfieldCount.frame = CGRect(x: (layerView2.frame.size.width-228)/2, y: labelCount.frame.origin.y + 12+5, width: 228, height: 48)
        textfieldCount.placeholder = "    手机号/邮箱"
        textfieldCount.setValue(NSNumber(value: 20), forKey: "paddingLeft")
        textfieldCount.alpha = 1
        textfieldCount.delegate = self
        textfieldCount.returnKeyType = UIReturnKeyType.done
        textfieldCount.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        textfieldCount.layer.borderWidth = 0.5
        textfieldCount.layer.borderColor = UIColor.white.cgColor
        layerView2.addSubview(textfieldCount)     //在父视图的基础上添加子视图
        
        //  密码
        labelPwd.text = "密码:"
        labelPwd.frame = CGRect(x: 38, y: textfieldCount.frame.origin.y + 65, width: 31, height: 12)
        labelPwd.font = UIFont(name:"Avenir Next", size:12)
        layerView2.addSubview(labelPwd)
        //  密码输入框
        textfieldPwd.frame = CGRect(x: (layerView2.frame.size.width-228)/2, y: labelPwd.frame.origin.y + 12+5, width: 228, height: 48)
        textfieldPwd.placeholder = " "
        textfieldPwd.setValue(NSNumber(value: 20), forKey: "paddingLeft")
        textfieldPwd.alpha = 1
        textfieldPwd.delegate = self
        textfieldPwd.returnKeyType = UIReturnKeyType.done
        textfieldPwd.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        textfieldPwd.layer.borderWidth = 0.5
        textfieldPwd.layer.borderColor = UIColor.white.cgColor
        layerView2.addSubview(textfieldPwd)
        
        // 登录按钮
        buttonSubmit.frame = CGRect(x: (self.view.frame.size.width-198)/2, y: layerView2.frame.origin.y + 260, width: 198, height: 58)
//        buttonSubmit.setBackgroundImage(UIImage(named:"SUBMIT"), for: .normal)
        buttonSubmit.setTitle("登录", for:.normal)
        buttonSubmit.setTitleColor(UIColor.black, for: .normal) //普通状态下文字的颜色
        buttonSubmit.setTitleColor(UIColor.black, for: .highlighted) //触摸状态下文字的颜色
        buttonSubmit.setTitleColor(UIColor.black, for: .disabled) //禁用状态下文字的颜色
        buttonSubmit.backgroundColor = UIColor.white
        buttonSubmit.addTarget(self,action:#selector(doSubmit), for: .touchUpInside)
        layerView.addSubview(buttonSubmit)
    }
    
    
    // 登录方法
    @objc func doSubmit(){
        if textfieldCount.text != "" && textfieldPwd.text != "" {
            let home = MainTabBarController.init()
            self.navigationController?.pushViewController(home, animated: true)
        } else if textfieldCount.text == "" {
            showMsgbox(_message: "请输入帐号")
            return
        } else if textfieldPwd.text == "" {
            showMsgbox(_message: "请输入密码")
            return
        }
      
        
        print("是否觉得惊悚的")
    }
    
    // 撤销输入键盘方法
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfieldCount.resignFirstResponder()
        textfieldPwd.resignFirstResponder()
            return true
    }
    
    func showMsgbox(_message: String, _title: String = "提示"){
            
        let alert = UIAlertController(title: _title, message: _message, preferredStyle: UIAlertController.Style.alert)
            let btnOK = UIAlertAction(title: "好的", style: .default, handler: nil)
            alert.addAction(btnOK)
            self.present(alert, animated: true, completion: nil)
            
        }
}
