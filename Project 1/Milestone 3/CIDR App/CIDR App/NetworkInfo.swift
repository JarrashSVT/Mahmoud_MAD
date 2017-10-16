//
//  NetworkInfo.swift
//  CIDR App
//
//  Created by Mahmoud Aljarrash on 10/11/17.
//  Copyright © 2017 Mahmoud Aljarrash. All rights reserved.
//

import Foundation

class NetworkInfo
{
    var ipAddress: String?
    var maskIpAddress: String?
    var networkIpAddress: String?
    var broadcastIpAddress: String?
    var numOfHosts: Int = 0
    var numOfSubnets: Int = 0
    
    init()
    {
        
    }
    
    init(ipAddress: String, cidr: String)
    {
        self.ipAddress = ipAddress
        self.maskIpAddress = getSubnetMaskIpAddressFromCidr(cird: cidr)
        
        self.networkIpAddress = convertIpAddressIntArrToStr(ipAddress: calculateNetWorkIpAddress(
            ipAddress: convertIpAddressStrToArrayInt(ipAddress: self.ipAddress!),
            maskIpAddress: convertIpAddressStrToArrayInt(ipAddress: self.maskIpAddress!)
        ))
        
        self.broadcastIpAddress = convertIpAddressIntArrToStr(ipAddress:
            calculateBroadcastIpAddress(
                ipAddress: convertIpAddressStrToArrayInt(ipAddress: self.ipAddress!),
                maskIpAddress: convertIpAddressStrToArrayInt(ipAddress: self.maskIpAddress!)
        ))
        
        self.numOfHosts = Int(getNumOfHosts(cidr: Int(cidr)!))
        self.numOfSubnets = Int(getNumOfSubnets(cidr: Int(cidr)!))
        
    }
    
    /*
     * Usage: convert a String IP address into an array of integers 
     * Example: "10.0.0.3" --> [10, 0, 0, 3]
     * Input: String
     * Output: [Int]
     */
    func convertIpAddressStrToArrayInt(ipAddress: String) -> [Int]
    {
        var ipAddressArray = ipAddress.components(separatedBy: ".")
        var ipAddressInt = [0,0,0,0]
        for s in 0..<4
        {
            ipAddressInt[s] = Int(ipAddressArray[s])!
            //print(ipAddressInt[s])
        }
        
        return ipAddressInt
    }
    
    /*
     * Usage: convert an array of integers into a String IP address
     * Example: [10, 0, 0, 3] --> "10.0.0.3"
     * Input: [Int]
     * Output: String
     */
    func convertIpAddressIntArrToStr(ipAddress: [Int]) -> String
    {
        var ipAddressStr = String()
        
        for s in 0..<4
        {
            ipAddressStr.append(String(ipAddress[s]))
            ipAddressStr.append(".")
        }
        
        return String(ipAddressStr.characters.dropLast())
    }
    
    
    /*
     * Usage: Apply a NOT Bitwise operation an array of integers
     * Example: [192, 168, 0, 0] --> [63, 87, 255, 255]
     * Input: [Int]
     * Output: [Int]
     */
    func negateIpAddress(ipAddress: [Int]) -> [Int]
    {
        var negatedIpAddress = [0,0,0,0]
        
        for s in 0..<4
        {
            negatedIpAddress[s] = Int(~UInt8(ipAddress[s]))
        }
        
        return negatedIpAddress
        
    }
    
    /*
     * Usage: Calculate the network IP address
     * Formula: Network IP address = ( IP Address ) AND ( Mask IP Address )
     * Input: [Int]
     * Output: [Int]
     */
    func calculateNetWorkIpAddress(ipAddress: [Int], maskIpAddress: [Int]) -> [Int]
    {
        var networkIpAddress = [0,0,0,0]
        
        for s in 0..<4
        {
            networkIpAddress[s] = ipAddress[s] & maskIpAddress[s] // AND BitWise  OPs
        }
        
        return networkIpAddress
    }
    
    /*
     * Usage: Calculate the Broadcasr IP address
     * Formula: Broadcast IP address = ( IP Address ) OR ( NOT ( Mask IP Address ))
     * Input: [Int]
     * Output: [Int]
     */
    func calculateBroadcastIpAddress(ipAddress: [Int], maskIpAddress: [Int]) -> [Int]
    {
        var broadcastIpAddress = [0,0,0,0]
        
        // get the complement of the mask ip
        let notMaskIpAddress = negateIpAddress(ipAddress: maskIpAddress)
        
        for s in 0..<4
        {
            broadcastIpAddress[s] = ipAddress[s] | notMaskIpAddress[s] // OR BitWise OPs
        }
        
        return broadcastIpAddress
    }
    
    /*
     * Usage: Calculate the number of subnets
     * Formula: 2 ^ (32 - cidr)
     * Input: Int
     * Output: Int
     */
    func getNumOfSubnets(cidr: Int) -> Int
    {
        return Int(NSDecimalNumber(decimal: pow(Decimal(2), 32 - cidr)))
    }
    
    /*
     * Usage: Calculate the number of hosts
     * Formula: (2 ^ (32 - cidr)) -2
     * Input: Int
     * Output: Int
     */
    func getNumOfHosts(cidr: Int) -> Int
    {
        return getNumOfSubnets(cidr: cidr) - 2
    }
    
    /*
     * Usage: Map the cidr prefix to an IP address (it's static 1-to-1 mapping that never chanages)
     * Input: String
     * Output: String
     */
    func getSubnetMaskIpAddressFromCidr(cird: String) -> String
    {
        
        
        switch cird
        {
        case "8":
            return "255.0.0.0"
        case "9":
            return "255.128.0.0"
        case "10":
            return "255.192.0.0"
        case "11":
            return "255.224.0.0"
        case "12":
            return "255.240.0.0"
        case "13":
            return "255.248.0.0"
        case "14":
            return "255.252.0.0"
        case "15":
            return "255.254.0.0"
        case "16":
            return "255.255.0.0"
        case "17":
            return "255.255.128.0"
        case "18":
            return "255.255.192.0"
        case "19":
            return "255.255.224.0"
        case "20":
            return "255.255.240.0"
        case "21":
            return "255.255.248.0"
        case "22":
            return "255.255.252.0"
        case "23":
            return "255.255.254.0"
        case "24":
            return "255.255.255.0"
        case "25":
            return "255.255.255.128"
        case "26":
            return "255.255.255.192"
        case "27":
            return "255.255.255.224"
        case "28":
            return "255.255.255.240"
        case "29":
            return "255.255.255.248"
        case "30":
            return "255.255.255.252"
        default:
            return "0.0.0.0"
        }
    }
    
    
    
}
