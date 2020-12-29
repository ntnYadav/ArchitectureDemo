//  Logger.swift
//  AppLogs
//  Created by Chetu on 21/12/20.
//  Copyright © 2020 Chetu. All rights reserved.
//

import Foundation
import UIKit

open class LoggerFile {
    /**
     @Description :- It is a simple singletons using a static type property, which is guaranteed to be lazily initialized only once, even when accessed across multiple threads simultaneously:
     @Author : Nitin Yadav
     @Para: No parameter
     @ Returns: return
     @Date     : 21 Dec  2020
     */
    static let sharedInstance = LoggerFile()
    private init () {}
    static var dateFormat = "yyyy-MM-dd hh:mm:ssSSS"
    
    /**
     @Description :- Date is a struct that belongs to the Foundation framework.It represents a specific point in time independent of any calendar or time zone.Date structure bridges to the NSDate class.It provides methods for creating dates. It DOES NOT do anything related to date format or conversion between string and date..
     @Author : Nitin Yadav
     @Parameters:
     @!key: Stirng
     @ Returns: return
     @Date     : 21 Dec  2020
     */
    
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    
    let deviceDetails = "\(UIDevice.current.name)\t" + "\(UIDevice.current.model)\t" + "\(UIDevice.current.systemName)\t" + "\(UIDevice.current.systemVersion)"
    
    func DebugLogs(className: String,methodName: String, debugLogs: String) {
        let detailedLogs = "\(Date().toString())\t \(deviceDetails)\t \(className)\t \(methodName)\t \(debugLogs)\n"
        writeToFile(message: detailedLogs)
    }
    
    /**
     @Description :-This method getting a string(Json string) with append to the text file. It is also used the File Manager and also check the file existing or not.
     @Author : Nitin Yadav
     @Parameters: No parameter
     @!key: Message ; No String
     @ Returns: No return
     @Date     : 21 Dec  2020
     */
    func writeToFile(message: String) {
        let fileURL = getDocumentsDirectory().appendingPathComponent("Logs.txt")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: fileURL.path) {
            let existingLogs = readLogFromDisk()
            let logsToWrite = "\(existingLogs)\t\n \(message)"
            do {
                try logsToWrite.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
            } catch {
                print("Some error occur")
            }
        } else {
            do {
                try message.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
            } catch {
                print("Some error occur")
            }
        }
        
    }
    
    func readLogFromDisk() -> String {
        let fileURL = getDocumentsDirectory().appendingPathComponent("Logs.txt")
        do {
            let logs = try String(contentsOf: fileURL, encoding: .utf8)
            return logs
        } catch {
            print("Some error occur")
            return ""
        }
    }
    
    /**
     @Description :- You can read and write the file  there without worrying about colliding with other. This is called the user's document directory and the code to find the user's document directoryisnot very memorable, so i neasarly alway use this helpful function.Path to the log files on the client device
     @Author : Nitin Yadav
     @Parameters: No parameter
     @!key: No String 
     @ Returns: return type string
     @Date     : 21 Dec  2020
     */
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func deleteLogsFromDisk() {
        
        let fileURL = getDocumentsDirectory().appendingPathComponent("Logs.txt")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: fileURL.path) {
            do {
                try fileManager.removeItem(atPath: fileURL.path)
            } catch {
                print("Error while removing file at path \(fileURL.path)")
            }
        } else { print("No file exists") }
    }
}

/**
 @Description :- Create an extension for Date
 @Author : Nitin Yadav
 @Parameters:
 @!key: String
 @ Returns: return type string
 @Date     : 21 Dec  2020
 */
extension Date {
    func toString() -> String {
        return LoggerFile.dateFormatter.string(from: self as Date)
    }
}
