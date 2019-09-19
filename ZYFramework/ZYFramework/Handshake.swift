//
//  Handshake.swift
//  ZYFramework
//
//  Created by Zübeyir Yayıkçı on 19.09.2019.
//  Copyright © 2019 Zübeyir Yayıkçı. All rights reserved.
//

import Foundation
import NetworkExtension

public class Handshake {
    private init() {}
    
    public static func Ping() -> String {
        let message = "Your Wifi IP Address is \(getAddress(for: .wifi) ?? "Not Found")\nYour Cellular IP Address is \(getAddress(for: .cellular) ?? "Not Found")"
        return message
    }
    
    public static func Pong() -> String {
        return "Pong..."
    }
    
    enum Network: String {
        case wifi = "en0"
        case cellular = "pdp_ip0"
        // ... case ipv4 = "ipv4"
        // ... case ipv6 = "ipv6"
        
    }
    
    private static func getAddress(for network: Network) -> String? {
        var address: String?
        
        // Get list of all interfaces on the local machine:
        var ifaddr: UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else { return nil }
        guard let firstAddr = ifaddr else { return nil }
        
        // For each interface ...
        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ifptr.pointee
            
            // Check for IPv4 or IPv6 interface:
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                // Check interface name:
                let name = String(cString: interface.ifa_name)
                if name == network.rawValue {
                    // Convert interface address to a human readable string:
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                &hostname, socklen_t(hostname.count),
                                nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostname)
                }
            }
        }
        freeifaddrs(ifaddr)
        
        return address
    }
}
