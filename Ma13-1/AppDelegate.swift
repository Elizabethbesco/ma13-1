//
//  AppDelegate.swift
//  Ma13-1
//
//  Created by Nakayama Shigeru on 2016/11/17.
//  Copyright © 2016年 Nakayama Shigeru. All rights reserved.
//
import Cocoa
import Foundation
import AVFoundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, AVAudioPlayerDelegate {
    @IBOutlet weak var window: NSWindow!
    var ap : AVAudioPlayer!
    @IBOutlet weak var textBox: NSTextField!
    
    //パラメーターの設定と表示
    @IBOutlet weak var samp, flame, alp, pc, ts, ah, vunv, ws, wf, absize: NSTextField!
    @IBOutlet weak var sampling, flamePriod, allPass, postfiltering, talkSpeed, addHalfTone, voiceUnvoice, weightSpectrum, weightF0, audioBuffSize : NSSlider!

    //サンプリング周波数

    @IBAction func sampling(_ sender: NSSlider) {
        samp.stringValue = String(format: "%.0f",sender.doubleValue)
    }
    @IBAction func samp(_ sender: Any) {
        sampling.stringValue = String((sender as AnyObject).doubleValue)
    }
    //フレーム周期
    @IBAction func flamePriod(_ sender: NSSlider) {
        flame.stringValue = String((sender as AnyObject).doubleValue)
    }
    @IBAction func flame(_ sender: Any) {
        flamePriod.stringValue = String((sender as AnyObject).doubleValue)
    }
    //オールパス値
    @IBAction func allPass(_ sender: NSSlider) {
        alp.stringValue = String(format: "%.2f",sender.doubleValue)
    }
    @IBAction func alp(_ sender: Any) {
        allPass.stringValue = String((sender as AnyObject).doubleValue)
    }
    //ポストフィルター係数
    @IBAction func postfiltering(_ sender: NSSlider) {
        pc.stringValue = String(format: "%.2f",sender.doubleValue)
    }
    @IBAction func pc(_ sender: Any) {
        postfiltering.stringValue = String((sender as AnyObject).doubleValue)
    }
    //速さ
    @IBAction func talkSpeed(_ sender: NSSlider) {
        ts.stringValue = String(format: "%.2f",sender.doubleValue)
    }
    @IBAction func ts(_ sender: Any) {
        talkSpeed.stringValue = String((sender as AnyObject).doubleValue)
    }
    //追加ハーフトーン
    @IBAction func addHalfTone(_ sender: NSSlider) {
        ah.stringValue = String(format: "%.0f",sender.doubleValue)
    }
    @IBAction func ah(_ sender: Any) {
        addHalfTone.stringValue = String((sender as AnyObject).doubleValue)
    }
    //有声/無声 境界値
    @IBAction func voiceUnvoice(_ sender: NSSlider) {
        vunv.stringValue = String(format: "%.1f",sender.doubleValue)
    }
    @IBAction func vunv(_ sender: Any) {
        voiceUnvoice.stringValue = String((sender as AnyObject).doubleValue)
    }
    //スペクトラム系列内変動重み
    @IBAction func weightSpectrum(_ sender: NSSlider) {
        ws.stringValue = String(format: "%.2f",sender.doubleValue)
    }
    @IBAction func ws(_ sender: Any) {
        weightSpectrum.stringValue = String((sender as AnyObject).doubleValue)
    }
    //F0系列内変動の重み
    @IBAction func weightF0(_ sender: NSSlider) {
        wf.stringValue = String(format: "%.2f",sender.doubleValue)
    }
    @IBAction func wf(_ sender: Any) {
        weightF0.stringValue = String((sender as AnyObject).doubleValue)
    }
    //オーディオバッファーサイズ
    @IBAction func audioBuffSize(_ sender: NSSlider) {
        absize.stringValue = String(format: "%.0f",sender.doubleValue)
    }
    @IBAction func absize(_ sender: Any) {
        audioBuffSize.stringValue = String((sender as AnyObject).doubleValue)
    }
    
    //既定値に戻すボタン実装
    @IBAction func defaultButton(_ sender: NSButton) {
        var defaultparam:[String:[String:String]] = [
            "既定値" : ["samp": "48000", "flame": "240","alp": "0.55","pc": "0.0","ts": "1.0","ah": "0","vunv": "0.5","ws": "1.0","wf": "1.0","absize": "0"],
            "ベス日本語既定値" : ["samp": "48000", "flame": "240","alp": "0.59","pc": "0.0","ts": "0.88","ah": "-2.0","vunv": "0.2","ws": "1.0","wf": "0.83","absize": "0"],
            "ベス英語既定値" : ["samp": "48000", "flame": "240","alp": "0.55","pc": "0.0","ts": "1.0","ah": "4.0","vunv": "0.2","ws": "1.0","wf": "1.2","absize": "0"]
        ]
        switch sender.title {
        case "既定値":
            samp.stringValue = defaultparam["既定値"]!["samp"]!
            sampling.stringValue = defaultparam["既定値"]!["samp"]!
            flame.stringValue = defaultparam["既定値"]!["flame"]!
            flamePriod.stringValue = defaultparam["既定値"]!["flame"]!
            alp.stringValue = defaultparam["既定値"]!["alp"]!
            allPass.stringValue = defaultparam["既定値"]!["alp"]!
            pc.stringValue = defaultparam["既定値"]!["pc"]!
            postfiltering.stringValue = defaultparam["既定値"]!["pc"]!
            ts.stringValue = defaultparam["既定値"]!["ts"]!
            talkSpeed.stringValue = defaultparam["既定値"]!["ts"]!
            ah.stringValue = defaultparam["既定値"]!["ah"]!
            addHalfTone.stringValue = defaultparam["既定値"]!["ah"]!
            vunv.stringValue = defaultparam["既定値"]!["vunv"]!
            voiceUnvoice.stringValue = defaultparam["既定値"]!["vunv"]!
            ws.stringValue = defaultparam["既定値"]!["ws"]!
            weightSpectrum.stringValue = defaultparam["既定値"]!["ws"]!
            wf.stringValue = defaultparam["既定値"]!["wf"]!
            weightF0.stringValue = defaultparam["既定値"]!["wf"]!
            absize.stringValue = defaultparam["既定値"]!["absize"]!
            audioBuffSize.stringValue = defaultparam["既定値"]!["absize"]!
            break
        case "ベス日本語既定値":
            samp.stringValue = defaultparam["ベス日本語既定値"]!["samp"]!
            sampling.stringValue = defaultparam["ベス日本語既定値"]!["samp"]!
            flame.stringValue = defaultparam["ベス日本語既定値"]!["flame"]!
            flamePriod.stringValue = defaultparam["ベス日本語既定値"]!["flame"]!
            alp.stringValue = defaultparam["ベス日本語既定値"]!["alp"]!
            allPass.stringValue = defaultparam["ベス日本語既定値"]!["alp"]!
            pc.stringValue = defaultparam["ベス日本語既定値"]!["pc"]!
            postfiltering.stringValue = defaultparam["ベス日本語既定値"]!["pc"]!
            ts.stringValue = defaultparam["ベス日本語既定値"]!["ts"]!
            talkSpeed.stringValue = defaultparam["ベス日本語既定値"]!["ts"]!
            ah.stringValue = defaultparam["ベス日本語既定値"]!["ah"]!
            addHalfTone.stringValue = defaultparam["ベス日本語既定値"]!["ah"]!
            vunv.stringValue = defaultparam["ベス日本語既定値"]!["vunv"]!
            voiceUnvoice.stringValue = defaultparam["ベス日本語既定値"]!["vunv"]!
            ws.stringValue = defaultparam["ベス日本語既定値"]!["ws"]!
            weightSpectrum.stringValue = defaultparam["ベス日本語既定値"]!["ws"]!
            wf.stringValue = defaultparam["ベス日本語既定値"]!["wf"]!
            weightF0.stringValue = defaultparam["ベス日本語既定値"]!["wf"]!
            absize.stringValue = defaultparam["ベス日本語既定値"]!["absize"]!
            audioBuffSize.stringValue = defaultparam["ベス日本語既定値"]!["absize"]!
            break
        case "ベス英語既定値":
            samp.stringValue = defaultparam["ベス英語既定値"]!["samp"]!
            sampling.stringValue = defaultparam["ベス英語既定値"]!["samp"]!
            flame.stringValue = defaultparam["ベス英語既定値"]!["flame"]!
            flamePriod.stringValue = defaultparam["ベス英語既定値"]!["flame"]!
            alp.stringValue = defaultparam["ベス英語既定値"]!["alp"]!
            allPass.stringValue = defaultparam["ベス英語既定値"]!["alp"]!
            pc.stringValue = defaultparam["ベス英語既定値"]!["pc"]!
            postfiltering.stringValue = defaultparam["ベス英語既定値"]!["pc"]!
            ts.stringValue = defaultparam["ベス英語既定値"]!["ts"]!
            talkSpeed.stringValue = defaultparam["ベス英語既定値"]!["ts"]!
            ah.stringValue = defaultparam["ベス英語既定値"]!["ah"]!
            addHalfTone.stringValue = defaultparam["ベス英語既定値"]!["ah"]!
            vunv.stringValue = defaultparam["ベス英語既定値"]!["vunv"]!
            voiceUnvoice.stringValue = defaultparam["ベス英語既定値"]!["vunv"]!
            ws.stringValue = defaultparam["ベス英語既定値"]!["ws"]!
            weightSpectrum.stringValue = defaultparam["ベス英語既定値"]!["ws"]!
            wf.stringValue = defaultparam["ベス英語既定値"]!["wf"]!
            weightF0.stringValue = defaultparam["ベス英語既定値"]!["wf"]!
            absize.stringValue = defaultparam["ベス英語既定値"]!["absize"]!
            audioBuffSize.stringValue = defaultparam["ベス英語既定値"]!["absize"]!
            break
        default :
            break
        }
    }
    


    
    //日本語音声作成ボタン実装
    @IBAction func createButton(_ sender: NSButton) {
        func wavCreate(shelText:String){
            //テキストファイル出力
            let fn = "sample1.txt"
            let t = textBox.stringValue
            if let d = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.desktopDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first {
                let p = URL(fileURLWithPath: d).appendingPathComponent(fn)
                do { //ファイルへの書き込み
                    try t.write(to: p, atomically: false, encoding: String.Encoding.utf8)
                } catch { }
            }
            //シェルスクリプト出力(パラメーターの設定)
            let shel = "OpenJTalk.sh"
            if let aaa = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.desktopDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first {
                let myPath = URL(fileURLWithPath: aaa).appendingPathComponent(shel)
                do { //ファイルへの書き込み
                    try shelText.write(to: myPath, atomically: false, encoding: String.Encoding.utf8)
                } catch { }
                
            // Create a Task instance
            let task = Process()
            
            // Set the task parameters
            task.launchPath = "/usr/bin/env"
            task.arguments = ["/Users/admin/Desktop/OpenJTalk.sh"]
            
            // Create a Pipe and make the task
            // put all the output there
            let pipe = Pipe()
            task.standardOutput = pipe
            
            // Launch the task
            task.launch()
            task.waitUntilExit()
            }
        }
        
        switch sender.title{
        case "日本語音声作成":
            let jpnShel = "#!/bin/bash\n\ncd /Users/admin/Desktop\n/usr/local/bin/open_jtalk \\\n-x /usr/local/share/open_jtalk/open_jtalk_dic_utf_8-1.10 \\\n-m /usr/local/share/hts_voice/MMDAgent_Example-1.7/Voice/mei/mei_normal.htsvoice \\\n-s \(samp.stringValue) \\\n-p \(flame.stringValue) \\\n-a \(alp.stringValue) \\\n-b \(pc.stringValue) \\\n-r \(ts.stringValue) \\\n-fm \(ah.stringValue) \\\n-u \(vunv.stringValue) \\\n-jm \(ws.stringValue) \\\n-jf \(wf.stringValue) \\\n-z \(absize.stringValue) \\\n-ow out.wav \\\nsample1.txt"
            wavCreate(shelText:jpnShel)
            let s = "/Users/admin/Desktop/out.wav"
            ap = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: s))
            ap.delegate = self
            break
        case "英語音声作成":
            let engShel = "#!/bin/bash\n\ncd /Users/admin/Desktop\n/usr/local/bin/flite_hts_engine \\\n-m /usr/local/share/hts_voice/hts_voice_cmu_us_arctic_slt-1.06/cmu_us_arctic_slt.htsvoice \\\n-s \(samp.stringValue) \\\n-p \(flame.stringValue) \\\n-a \(alp.stringValue) \\\n-b \(pc.stringValue) \\\n-r \(ts.stringValue) \\\n-fm \(ah.stringValue) \\\n-u \(vunv.stringValue) \\\n-jm \(ws.stringValue) \\\n-jf \(wf.stringValue) \\\n-z \(absize.stringValue) \\\n-ow out.wav \\\nsample1.txt"
            wavCreate(shelText:engShel)
            let s = "/Users/admin/Desktop/out.wav"
            ap = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: s))
            ap.delegate = self
            break
        default:
            break
        }
    }
    
    
    //Play(音声再生)
    @IBAction func play(_ sender: NSButton) {
        switch sender.title{
        case "再生":
            ap.play()
            break
        case "一時停止":
            ap.pause()
            break
        case "停止":
            ap.stop()
            ap.currentTime = 0
            break
        default:
            break
        }
    }
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let s = "/Users/admin/Desktop/out.wav"
        ap = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: s)) //パスでオーディオプレイヤー取得
        ap.delegate = self //オーディオプレイヤーのデリゲート設定
    }
    
    //音楽が再生し終わると呼ばれ、成功ならsuccessfullyはture,失敗ならfalseとなる
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) { }
    //音楽が再生中にデコードエラーerrorが発生すると呼ばれる
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) { }
    
    func applicationWillTerminate(_ aNotification: Notification) { }
    
    
    
}

