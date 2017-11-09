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
    
    //パラメーターの設定と表示
    //サンプリング周波数
    @IBOutlet weak var samp: NSTextField!
    @IBAction func sampling(_ sender: NSSlider) {
        samp.stringValue = String(format: "%.0f",sender.doubleValue)
    }
    @IBOutlet weak var samplingOut: NSSlider!
    @IBAction func sampact(_ sender: Any) {
        samplingOut.stringValue = String((sender as AnyObject).doubleValue)
    }
    //フレーム周期
    @IBOutlet weak var flame: NSTextField!
    @IBAction func flamePriod(_ sender: NSSlider) {
        flame.stringValue = String(format: "%.0f",sender.doubleValue)
    }
    @IBOutlet weak var flamePriodOut: NSSlider!
    @IBAction func flameact(_ sender: Any) {
        flamePriodOut.stringValue = String((sender as AnyObject).doubleValue)
    }
    //オールパス値
    @IBOutlet weak var alp: NSTextField!
    @IBAction func allPass(_ sender: NSSlider) {
        alp.stringValue = String(format: "%.2f",sender.doubleValue)
    }
    @IBOutlet weak var allPassOut: NSSlider!
    @IBAction func alpact(_ sender: Any) {
        allPassOut.stringValue = String((sender as AnyObject).doubleValue)
    }
    //ポストフィルター係数
    @IBOutlet weak var pc: NSTextField!
    @IBAction func postfiltering(_ sender: NSSlider) {
        pc.stringValue = String(format: "%.2f",sender.doubleValue)
    }
    @IBOutlet weak var postfilteringOut: NSSlider!
    @IBAction func pcact(_ sender: Any) {
        postfilteringOut.stringValue = String((sender as AnyObject).doubleValue)
    }
    //速さ
    
    @IBOutlet weak var ts: NSTextField!
    @IBAction func talkSpeed(_ sender: NSSlider) {
        ts.stringValue = String(format: "%.2f",sender.doubleValue)
    }
    @IBOutlet weak var talkSpeedOut: NSSlider!
    @IBAction func tsact(_ sender: Any) {
        talkSpeedOut.stringValue = String((sender as AnyObject).doubleValue)
    }
    //追加ハーフトーン
    @IBOutlet weak var ah: NSTextField!
    @IBAction func addHalfTone(_ sender: NSSlider) {
        ah.stringValue = String(format: "%.0f",sender.doubleValue)
    }
    @IBOutlet weak var addHalfToneOut: NSSlider!
    @IBAction func ahact(_ sender: Any) {
        addHalfToneOut.stringValue = String((sender as AnyObject).doubleValue)
    }
    //有声/無声 境界値
    @IBOutlet weak var vunv: NSTextField!
    @IBAction func voiceUnvoice(_ sender: NSSlider) {
        vunv.stringValue = String(format: "%.1f",sender.doubleValue)
    }
    @IBOutlet weak var voiceUnvoiceOut: NSSlider!
    @IBAction func vunvact(_ sender: Any) {
        voiceUnvoiceOut.stringValue = String((sender as AnyObject).doubleValue)
    }
    //スペクトラム系列内変動重み
    @IBOutlet weak var ws: NSTextField!
    @IBAction func weightSpectrum(_ sender: NSSlider) {
        ws.stringValue = String(format: "%.2f",sender.doubleValue)
    }
    @IBOutlet weak var weightSpectrumOut: NSSlider!
    @IBAction func wsact(_ sender: Any) {
        weightSpectrumOut.stringValue = String((sender as AnyObject).doubleValue)
    }
    //F0系列内変動の重み
    @IBOutlet weak var wf: NSTextField!
    @IBAction func weightF0(_ sender: NSSlider) {
        wf.stringValue = String(format: "%.2f",sender.doubleValue)
    }
    @IBOutlet weak var weightF0Out: NSSlider!
    @IBAction func wfact(_ sender: Any) {
        weightF0Out.stringValue = String((sender as AnyObject).doubleValue)
    }
    //オーディオバッファーサイズ
    @IBOutlet weak var absize: NSTextField!
    @IBAction func audioBuffSize(_ sender: NSSlider) {
        absize.stringValue = String(format: "%.0f",sender.doubleValue)
    }
    @IBOutlet weak var audioBuffSizeOut: NSSlider!
    @IBAction func absizeact(_ sender: Any) {
        audioBuffSizeOut.stringValue = String((sender as AnyObject).doubleValue)
    }
    
    //既定値に戻すボタン実装
    @IBAction func defaultValue(_ sender: Any) {
        samp.stringValue = "48000"
        samplingOut.stringValue = "48000"
        flame.stringValue = "240"
        flamePriodOut.stringValue = "240"
        alp.stringValue = "0.55"
        allPassOut.stringValue = "0.55"
        pc.stringValue = "0.0"
        postfilteringOut.stringValue = "0.0"
        ts.stringValue = "1.0"
        talkSpeedOut.stringValue = "1.0"
        ah.stringValue = "0"
        addHalfToneOut.stringValue = "0"
        vunv.stringValue = "0.5"
        voiceUnvoiceOut.stringValue = "0.5"
        ws.stringValue = "1.0"
        weightSpectrumOut.stringValue = "1.0"
        wf.stringValue = "1.0"
        weightF0Out.stringValue = "1.0"
        absize.stringValue = "0"
        audioBuffSizeOut.stringValue = "0"
    }
    
    //beth既定値ボタン実装
    @IBAction func bethJpn(_ sender: Any) {
        samp.stringValue = "48000"
        samplingOut.stringValue = "48000"
        flame.stringValue = "240"
        flamePriodOut.stringValue = "240"
        alp.stringValue = "0.59"
        allPassOut.stringValue = "0.59"
        pc.stringValue = "0.0"
        postfilteringOut.stringValue = "0.0"
        ts.stringValue = "0.88"
        talkSpeedOut.stringValue = "0.88"
        ah.stringValue = "-2"
        addHalfToneOut.stringValue = "-2"
        vunv.stringValue = "0.2"
        voiceUnvoiceOut.stringValue = "0.2"
        ws.stringValue = "1.0"
        weightSpectrumOut.stringValue = "1.0"
        wf.stringValue = "0.83"
        weightF0Out.stringValue = "0.83"
        absize.stringValue = "0"
        audioBuffSizeOut.stringValue = "0"
    }
    
    //beth英語既定値ボタン実装
    @IBAction func bethEng(_ sender: Any) {
        samp.stringValue = "48000"
        samplingOut.stringValue = "48000"
        flame.stringValue = "240"
        flamePriodOut.stringValue = "240"
        alp.stringValue = "0.55"
        allPassOut.stringValue = "0.55"
        pc.stringValue = "0.0"
        postfilteringOut.stringValue = "0.0"
        ts.stringValue = "1.0"
        talkSpeedOut.stringValue = "1.0"
        ah.stringValue = "4.0"
        addHalfToneOut.stringValue = "4.0"
        vunv.stringValue = "0.2"
        voiceUnvoiceOut.stringValue = "0.2"
        ws.stringValue = "1.0"
        weightSpectrumOut.stringValue = "1.0"
        wf.stringValue = "1.2"
        weightF0Out.stringValue = "1.2"
        absize.stringValue = "0"
        audioBuffSizeOut.stringValue = "0"
    }
    
    
    
    @IBOutlet weak var textBox: NSTextField!
    
    //日本語音声作成ボタン実装
    @IBAction func txtCreate(_ sender: Any) {
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
        let shelContent = "#!/bin/bash\n\ncd /Users/admin/Desktop\n/usr/local/bin/open_jtalk \\\n-x /usr/local/share/open_jtalk/open_jtalk_dic_utf_8-1.10 \\\n-m /usr/local/share/hts_voice/MMDAgent_Example-1.7/Voice/mei/mei_normal.htsvoice \\\n-s \(samp.stringValue) \\\n-p \(flame.stringValue) \\\n-a \(alp.stringValue) \\\n-b \(pc.stringValue) \\\n-r \(ts.stringValue) \\\n-fm \(ah.stringValue) \\\n-u \(vunv.stringValue) \\\n-jm \(ws.stringValue) \\\n-jf \(wf.stringValue) \\\n-z \(absize.stringValue) \\\n-ow out.wav \\\nsample1.txt"
        if let aaa = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.desktopDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first {
            let myPath = URL(fileURLWithPath: aaa).appendingPathComponent(shel)
            do { //ファイルへの書き込み
                try shelContent.write(to: myPath, atomically: false, encoding: String.Encoding.utf8)
            } catch { }
        }
        
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
    
    //英語音声作成ボタン実装
    @IBAction func engCreate(_ sender: Any) {
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
        let shelContent = "#!/bin/bash\n\ncd /Users/admin/Desktop\n/usr/local/bin/flite_hts_engine \\\n-m /usr/local/share/hts_voice/hts_voice_cmu_us_arctic_slt-1.06/cmu_us_arctic_slt.htsvoice \\\n-s \(samp.stringValue) \\\n-p \(flame.stringValue) \\\n-a \(alp.stringValue) \\\n-b \(pc.stringValue) \\\n-r \(ts.stringValue) \\\n-fm \(ah.stringValue) \\\n-u \(vunv.stringValue) \\\n-jm \(ws.stringValue) \\\n-jf \(wf.stringValue) \\\n-z \(absize.stringValue) \\\n-ow out.wav \\\nsample1.txt"
        if let aaa = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.desktopDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first {
            let myPath = URL(fileURLWithPath: aaa).appendingPathComponent(shel)
            do { //ファイルへの書き込み
                try shelContent.write(to: myPath, atomically: false, encoding: String.Encoding.utf8)
            } catch { }
        }
        
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
    }
    
    
    //Play(音声再生)
    var ap : AVAudioPlayer!
    
    @IBAction func play(_ b1: NSButton) {
        ap.play()
    }
    
    @IBAction func pause(_ sender: NSButton) {
        ap.pause()
    }
    
    @IBAction func stop(_ sender: NSButton) {
        ap.stop()
        ap.currentTime = 0
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

