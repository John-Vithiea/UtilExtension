//
//  FileManagerExtension.swift
//  SwiftExtensionUtilities
//
//  Created by Vithiea-MacPro on 5/8/20.
//  Copyright © 2020 John-Vithiea. All rights reserved.
//

import Foundation

extension FileManager {
    // MARK: Cached directory
    
    /// Creates a file and writes its content then save into cache directory.
    /// - Parameters:
    ///   - filename: A name of file to save.
    ///   - content: String of text to write.
    /// - Returns: A boolean value that indicates whether the contents are written successful.
    ///
    /// This function is returnable. It is possible if you want to call this function without a receiver. If contents are failed to written, It will return false and log the error message in console.
    @discardableResult
    public func cachesFile(_ filename: String, content: String) -> Bool {
        do {
            let path = self.getCachedPathForFile(filename)
            try content.write(toFile: path.path, atomically: true, encoding: String.Encoding.utf8)
            return self.setDateModified(Date(), fileAtPath: self.getCachedPathForFile(filename).path)
        } catch(let error) {
            print("error = \(error.localizedDescription)")
            return false
        }
    }
    
    /// Retrieves contents of a file inside cache directory.
    /// - Parameter filename: A name of file to read its content.
    /// - Returns: A string of contents from given name of file.
    public func getContentsOfCachedFile(_ filename:String) -> String {
        return self.getContentsOfFileAtPath(self.getCachedPathForFile(filename))
    }
    
    /// Retrieves a path of cache directory with a file name.
    /// - Parameter filename: A name of file to append with cache directory
    /// - Returns: A url of path of cache directory with a given file name.
    public func getCachedPathForFile(_ filename: String) -> URL{
        return self.getCachePath().appendingPathComponent(filename)
    }
    
    /// Retrievse a path of cache directory
    /// - Returns: A url of path of cache directory without file name
    public func getCachePath() -> URL {
        var documentDirectory = self.urls(for: .documentDirectory, in: .userDomainMask).first
        documentDirectory = documentDirectory!.appendingPathComponent("Caches", isDirectory: true)
        if self.fileExists(atPath: documentDirectory!.path) {
            return documentDirectory!
        }else{
            // create cached directory when not available
            try! self.createDirectory(atPath: documentDirectory!.path, withIntermediateDirectories: true, attributes: nil)
            return documentDirectory!
        }
    }
    
    
    // MARK: Given directory
    
    /// Retrieves contents of file from a given path.
    /// - Parameter path: A path of directory with file name to read.
    /// - Returns: A string of contents from the given path.
    public func getContentsOfFileAtPath(_ path: URL) -> String {
        do {
            return try String(contentsOf: path, encoding: .utf8)
        } catch (let error) {
            print("error read file = \(error)")
            return ""
        }
    }
    
    
    // MARK: File Attributes
    
    /// Sets date modified of file with given date at specified path.
    /// - Parameters:
    ///   - date: A date of modify file to set.
    ///   - fileAtPath: A path of directory with file name to sets date.
    /// - Returns: A boolean value indicates whether the date is written successful.
    ///
    /// This function is returnable. It is possible if you want to call this function without a receiver. If the date is failed to set, It will return false and log the error message in console.
    ///
    @discardableResult
    public func setDateModified(_ date: Date, fileAtPath: String) -> Bool {
        do {
            let attr = [FileAttributeKey.modificationDate:date]
            try self.setAttributes(attr, ofItemAtPath: fileAtPath)
            return true
        } catch(let error){
            print("error while set file datemodifed = \(error)")
            return false
        }
    }
    
    /// Retrieves the date modified of file at specified path.
    /// - Parameter path: A path of directory with file name to get date.
    /// - Returns: A string of date with format "yyyy-MM-dd-HH-mm:ss"
    public func dateModifiedOfFileAtPath(_ path:String) -> String {
        do {
            let attr = try self.attributesOfItem(atPath: path)
            let date = attr[FileAttributeKey.modificationDate] as! Date
            
            return date.toString(format: "yyyy-MM-dd-HH-mm:ss")
        } catch(let error) {
            return error.localizedDescription
        }
    }
    
    /// Deletes a file at specified path.
    /// - Parameter path: A path of directory with file name to delete.
    /// - Returns: A boolean value that indicates whether the file is deleted successful.
    ///
    /// This function is returnable. It is possible if you want to call this function without a receiver. If the file is failed to delete, It will return false and log the error message in console.
    ///
    @discardableResult
    public func deletedFile(path:String) -> Bool {
        do {
            if self.fileExists(atPath: path) {
                try self.removeItem(atPath: path)
                return true
            }
        } catch(let error){
            print ("error while delete file \(error)")
            return false
        }
        return false
    }

}
