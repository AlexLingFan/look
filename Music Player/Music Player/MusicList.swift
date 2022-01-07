//
//  MusicList.swift
//  Music Player
//
//  Created by mahsun abuzeyitoğlu on 31.01.2020.
//  Copyright © 2020 mahsun abuzeyitoğlu. All rights reserved.
//

import UIKit
import FanRefresh
import SwiftUI
private let id = "id"

var songList : [String] = []
var songImage : [String] = []

var activeSong = 0

import AVFoundation
 var audioPlayer = AVAudioPlayer()
class MusicList: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var saveImageBack:((_ image: UIImage)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tableView.separatorColor = .white
        weak var weakSelf = self
        //下拉
        self.tableView.fan_header = FanRefreshHeaderDefault.headerRefreshing(refreshingBlock: {
            weakSelf?.getSong()
        })
        //不转的话，没有属性可以掉用
        let fanHeader=self.tableView.fan_header as! FanRefreshHeaderDefault
        //修改背景颜色(默认透明)
        fanHeader.backgroundColor=UIColor.yellow
        //文字与菊花之间的间距（默认20）
        fanHeader.fan_labelInsetLeft=40.0
        //修改状态字体内容（默认支持 中文，繁体中文，和英文）
        fanHeader.fan_setTitle(title: "下拉可以刷新", state: .Default)
        fanHeader.fan_setTitle(title: "松开立即刷新", state: .Pulling)
        fanHeader.fan_setTitle(title: "正在刷新数据中...", state: .Refreshing)
        //修改状态和时间显示的字体颜色和大小样式
        fanHeader.fan_stateLabel.textColor=FanRefreshColor(r: 250, g: 34, b: 43, a: 1)
        fanHeader.fan_stateLabel.font=UIFont.boldSystemFont(ofSize: 14)

        // MARK:  HeaderRefresh特有的
        //--------------------------------特有begain-----------------------------------
        //下拉时透明度自动增强（默认true）
        fanHeader.fan_automaticallyChangeAlpha=false
        //修改时间显示的字体颜色和大小样式
        fanHeader.fan_lastUpdatedTimeLabel.textColor=FanRefreshColor(r: 250, g: 34, b: 43, a: 1)

        //外部修改时间控件的显示内容（默认正确的时间，可以+，可以-）
        fanHeader.fan_lasUpdateTimeText = { ( lastUpdatTime ) in
            return "2022-01-31 24:00:00"
        }

        //添加5秒种后再次进入界面，自动下拉刷新
        //如果启用这个方式，最好启动时，直接调用 fanHeader.fan_beginRefreshing()
        fanHeader.fan_autoRefresh(thanIntervalTime: 5.0)

        navigationItem.title = "音乐列表"
        
        
        tableView.register(SongCell.self, forCellReuseIdentifier: id)
       
        getSong()
        
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 70, bottom: 0, right: 0)
//
//        let button = UIBarButtonItem(image: UIImage(named: "list"), style: .plain, target: self, action: #selector(action))
//        navigationItem.rightBarButtonItem = button
    }

    

 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        do {
            let audioPath = Bundle.main.path(forResource: songList[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            activeSong = indexPath.row
        }
        catch {
            print(error.localizedDescription)
        }
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! SongCell
        cell.textLabel?.text = songList[indexPath.row]
        cell.artistImage.image = UIImage(named: songList[indexPath.row])
        return cell
    }
    

    func getSong()  {
    
            let folderUrl = URL(fileURLWithPath: Bundle.main.resourcePath!)
            do{
                let path = try FileManager.default.contentsOfDirectory(at: folderUrl,includingPropertiesForKeys: nil,options: .skipsHiddenFiles)
                for song_ in path{
                    var songName = song_.absoluteString
                    if songName.contains(".mp3")
                    {
                        let finfString = songName.components(separatedBy: "/")
                        songName = finfString[finfString.count - 1]
                        songName = songName.replacingOccurrences(of: "%20", with: " ")
                        songName = songName.replacingOccurrences(of: ".mp3", with: "")
                        songList.append(songName)
                        print(songName)
                    }
                }
                        
                tableView.reloadData()
            }
        
            catch
            {
                print("err")
            }
        
    }
    

}
