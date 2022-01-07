import Foundation
import UIKit
class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置系统默认的蓝色
        self.tabBar.tintColor = UIColor(red: 0/255, green:169/255, blue:169/255, alpha:1)
        addNormalTabbar()
    }
    // MARK: -FirstNormalTabba 第一种常用的tabbar
    /**
     优点可以拿到单独子控制器 做相应的设置
     */
    func addNormalTabbar() {
        //这里针对updateVc 改变其背景色
        let updateVc = HomePageViewController.init()
        updateVc.view.backgroundColor = UIColor.red
        setupOneChildViewController(title: "播放", image: "icon_update", seletedImage: "icon_update_sel", controller: HomePageViewController.init())
        setupOneChildViewController(title: "收藏", image: "icon_find", seletedImage: "icon_find_sel", controller: MusicList.init())
        setupOneChildViewController(title: "我的", image: "icon_book", seletedImage: "icon_book_sel", controller: PersonPageViewController.init())
    }
    fileprivate func  setupOneChildViewController(title: String,image: String,seletedImage: String,controller: UIViewController){
        controller.tabBarItem.title = title
        controller.title = title
        //这里设置背景色 是每一个vc设置的都一样
        controller.view.backgroundColor = UIColor.white
        controller.tabBarItem.image = UIImage.init(named: image)
        controller.tabBarItem.selectedImage = UIImage.init(named: seletedImage)
        let naviController = UINavigationController.init(rootViewController: controller)
        addChild(naviController)
    }
}
