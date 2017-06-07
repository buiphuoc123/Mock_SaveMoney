//
//  MucLine.swift
//  Money_Save
//
//  Created by Cntt04 on 6/7/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import Foundation
import UIKit

class MucLine
{
    var day: String         //các ngày trong tuần
    var events: [Muc]     //các sự kiện trong ngày
    
    init(daysOfWeek: String, includeEvents: [Muc])
    {
        day = daysOfWeek
        events = includeEvents
    }
    
    class func eventLines() -> [MucLine]
    {
        return [self.Monday(), self.Tuesday(), self.Wednesday(), self.Thusday(), self.Friday(), self.Saturday(), self.Sunday()]
    }
    
    private class func Monday() -> MucLine
    {
        var events = [Muc]()
        
        events.append(Muc(titled: "Reading Books", description: "Đọc thật nhiều sách!"))
        events.append(Muc(titled: "Going to school", description: "Go to school to learn English"))
        events.append(Muc(titled: "Doing homeworks", description: "So much homework to complete"))
        
        return MucLine(daysOfWeek: "Monday", includeEvents: events)
        //các sự kiện cho ngày Thứ Hai
    }
    
    private class func Tuesday() -> MucLine
    {
        var events = [Muc]()
        
        events.append(Muc(titled: "Reading Comics", description: "Read One Piece, Naruto"))
        events.append(Muc(titled: "Going to New Star", description: "Go to New Star to learn CCNA"))
        
        return MucLine(daysOfWeek: "Tuesday", includeEvents: events)
        //các sự kiện cho ngày Thứ Ba
    }
    
    private class func Wednesday() -> MucLine
    {
        var events = [Muc]()
        
        events.append(Muc(titled: "Visit a friend", description: "Go to Bien Hoa City to meet a friend"))
        events.append(Muc(titled: "Have lunch", description: "Have lunch at Lotte Mart Pham Van Thuan"))
        events.append(Muc(titled: "Repair PC", description: "Repair girlfriend's Personal Computer"))
        events.append(Muc(titled: "Sleep", description: "Go to bed after a long day"))
        
        return MucLine(daysOfWeek: "Wednesday", includeEvents: events)
        //các sự kiện cho ngày Thứ Tư
    }
    
    private class func Thusday() -> MucLine
    {
        var events = [Muc]()
        
        events.append(Muc(titled: "Have breakfast", description: "Have a breakfast with bread"))
        events.append(Muc(titled: "Going to school", description: "Go to school to learn Operating System"))
        events.append(Muc(titled: "Backup Website", description: "Back up company's website"))
        
        return MucLine(daysOfWeek: "Thusday", includeEvents: events)
        //các sự kiện cho ngày Thứ Năm
    }
    
    private class func Friday() -> MucLine
    {
        var events = [Muc]()
        
        events.append(Muc(titled: "Friend's Wedding", description: "Linh's Wedding at Queen Plaza"))
        events.append(Muc(titled: "Buy something", description: "Go to Co.op Mart to buy something"))
        
        return MucLine(daysOfWeek: "Friday", includeEvents: events)
        //các sự kiện cho ngày Thứ Sáu
    }
    
    private class func Saturday() -> MucLine
    {
        var events = [Muc]()
        
        events.append(Muc(titled: "Go to HCMUTE", description: "Go to HCMUTE to learn iOS Dev"))
        events.append(Muc(titled: "Meeting", description: "Online meeting with Boss"))
        events.append(Muc(titled: "Watch Movie", description: "Go to CGV cinema to watch Spiderman"))
        
        return MucLine(daysOfWeek: "Saturday", includeEvents: events)
        //các sự kiện cho ngày Thứ Bảy
    }
    
    private class func Sunday() -> MucLine
    {
        var events = [Muc]()
        
        events.append(Muc(titled: "Sleep 'n Sleep", description: "Sleep to 12:00pm"))
        events.append(Muc(titled: "Take a shower", description: "Take a shower at Paradise"))
        events.append(Muc(titled: "Have dinner", description: "Have dinner with my honney"))
        
        return MucLine(daysOfWeek: "Sunday", includeEvents: events)
        //các sự kiện cho ngày Chủ Nhật
    }
}
