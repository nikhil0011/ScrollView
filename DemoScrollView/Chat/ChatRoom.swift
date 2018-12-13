//
//  ChatRoom.swift
//  DemoScrollView
//
//  Created by Admin on 8/6/18.
//  Copyright © 2018 demo. All rights reserved.
//
import UIKit

class ChatRoom: NSObject {
    //1
    var inputStream: InputStream!
    var outputStream: OutputStream!
    
    //2
    var username = ""
    
    //3
    let maxReadLength = 4096
    func setupNetworkCommunication() {
        // 1
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?
        
        // 2
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault,
                                           "localhost" as CFString,
                                           80,
                                           &readStream,
                                           &writeStream)
        inputStream = readStream!.takeRetainedValue()
        outputStream = writeStream!.takeRetainedValue()
        inputStream.schedule(in: .current, forMode: .commonModes)
        outputStream.schedule(in: .current, forMode: .commonModes)
        inputStream.open()
        outputStream.open()
    }
}
