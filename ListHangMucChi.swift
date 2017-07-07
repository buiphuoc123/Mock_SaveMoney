//
//  ListHangMucChi.swift
//  Money_Save
//
//  Created by Bui Phuoc on 7/7/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import Foundation
import UIKit

class ListHangMucChi
{
    //bien ngay trong 1 tuan
    var name: String
    var image: UIImage
    //bien events chua cac su kien trong 1 ngay
    var hangmucchi: [HangMucChi]
    
    init(name: String, image: String, hangmuc: [HangMucChi])
    {
        self.name = name
        if let img = UIImage(named: imageName) {
            image = img
        } else {
            image = UIImage(named: "default")!
        }
        hangmucchi = hangmuc
    }
    
    class func listHangMuc() -> [ListHangMucChi]
    {
        return [self.Anuong(), self.Dichvusinhhoat(), self.Dilai(), self.Concai(), self.Trangphuc(), self.Hieuhi(), self.Suckhoe(), self.Nhacua(),self.Huongthu(), self.Phattrien()]
    }
   
    private class func Anuong() -> ListHangMucChi
    {
        var hangmuc = [HangMucChi]
        hangmuc.append(HangMucChi(titled: "Cafe", imageName: "cafe"))
        hangmuc.append(HangMucChi(titled: "Đi chợ/siêu thị", imageName: "dicho"))
        hangmuc.append(HangMucChi(titled: "Ăn tiệm", imageName: "antiem"))
        
        return ListHangMucChi(name: "Ăn uống", image: "anuong", hangmuc: hangmuc)
        
       
        
    }
    private class func Dichvusinhhoat() -> ListHangMucChi
    {
        var hangmuc = [HangMucChi]
        hangmuc.append(HangMucChi(titled: "Điện", imageName: "dien"))
        hangmuc.append(HangMucChi(titled: "Nước", imageName: "nuoc"))
        hangmuc.append(HangMucChi(titled: "Internet", imageName: "internet"))
        //
        hangmuc.append(HangMucChi(titled: "Gas", imageName: "gas"))
        hangmuc.append(HangMucChi(titled: "Truyền hình", imageName: "truyenhinh"))
        hangmuc.append(HangMucChi(titled: "Điện thoại di động", imageName: "dienthoai"))
        //
        hangmuc.append(HangMucChi(titled: "Điện thoại cố định", imageName: "dienthoainha"))
        hangmuc.append(HangMucChi(titled: "Thuê người giúp việc", imageName: "giupviec"))
        
        return ListHangMucChi(name: "Dịch vụ sinh hoạt", image: "dvsinhhoat", hangmuc: hangmuc)
        
        
    }
    //
    private class func Dilai() -> ListHangMucChi
    {
        var hangmuc = [HangMucChi]
        hangmuc.append(HangMucChi(titled: "Xăng xe", imageName: "xangxe"))
        hangmuc.append(HangMucChi(titled: "Bảo hiểm xe", imageName: "baohiem"))
        hangmuc.append(HangMucChi(titled: "Sữa chữa, bảo dưỡng xe", imageName: "suaxe"))
        //
        hangmuc.append(HangMucChi(titled: "Gửi xe", imageName: "guixe"))
        hangmuc.append(HangMucChi(titled: "Rửa xe", imageName: "ruaxe"))
        hangmuc.append(HangMucChi(titled: "Taxi/thuê xe", imageName: "taxi"))
        //
        
        
        return ListHangMucChi(name: "Đi lại", image: "dilai", hangmuc: hangmuc)
        
        
    }
    //
    private class func Concai() -> ListHangMucChi
    {
        var hangmuc = [HangMucChi]
        hangmuc.append(HangMucChi(titled: "Học phí", imageName: "hocphi"))
        hangmuc.append(HangMucChi(titled: "Sách vở", imageName: "sachvo"))
        hangmuc.append(HangMucChi(titled: "Sữa", imageName: "sua"))
        //
        hangmuc.append(HangMucChi(titled: "Đồ chơi", imageName: "dochoi"))
        hangmuc.append(HangMucChi(titled: "Tiền tiêu vặt", imageName: "tientieuvat"))
        
        //
        
        return ListHangMucChi(name: "Con cái", image: "concai", hangmuc: hangmuc)
        
    }
    //
    private class func Trangphuc() -> ListHangMucChi
    {
        var hangmuc = [HangMucChi]
        hangmuc.append(HangMucChi(titled: "Quần áo", imageName: "quanao"))
        hangmuc.append(HangMucChi(titled: "Giày dép", imageName: "giaydep"))
        hangmuc.append(HangMucChi(titled: "Phụ kiện khác", imageName: "phukienkhac"))
        
        
        //
        
        return ListHangMucChi(name: "Trang phục", image: "trangphuc", hangmuc: hangmuc)
        
    }
    //
    private class func Hieuhi() -> ListHangMucChi
    {
        var hangmuc = [HangMucChi]
        hangmuc.append(HangMucChi(titled: "Cưới xin", imageName: "cuoixin"))
        hangmuc.append(HangMucChi(titled: "Ma chay", imageName: "machay"))
        hangmuc.append(HangMucChi(titled: "Thăm hỏi", imageName: "thamhoi"))
        hangmuc.append(HangMucChi(titled: "Biếu tặng", imageName: "bieutang"))
        
        //
        
        return ListHangMucChi(name: "Hiếu hỉ", image: "hieuhi", hangmuc: hangmuc)
        
    }
    //
    private class func Suckhoe() -> ListHangMucChi
    {
        var hangmuc = [HangMucChi]
        hangmuc.append(HangMucChi(titled: "Khám chữa bệnh", imageName: "khambenh"))
        hangmuc.append(HangMucChi(titled: "Thuốc men", imageName: "thuocmen"))
        hangmuc.append(HangMucChi(titled: "Thể thao", imageName: "thethao"))
        
        //
        
        return ListHangMucChi(name: "Sức khoẻ", image: "suckhoe", hangmuc: hangmuc)
        
    }
    //
    private class func Nhacua() -> ListHangMucChi
    {
        var hangmuc = [HangMucChi]
        hangmuc.append(HangMucChi(titled: "Mua sắm đồ đạc", imageName: "muasamdodac"))
        hangmuc.append(HangMucChi(titled: "Sữa chữa nhà cửa", imageName: "suachua"))
        hangmuc.append(HangMucChi(titled: "Thuê nhà", imageName: "thuenha"))
        
        //
        
        return ListHangMucChi(name: "Nhà cửa", image: "nhacua", hangmuc: hangmuc)
        
    }
    //
    private class func Huongthu() -> ListHangMucChi
    {
        var hangmuc = [HangMucChi]
        hangmuc.append(HangMucChi(titled: "Vui chơi", imageName: "vuichoi"))
        hangmuc.append(HangMucChi(titled: "Du lịch", imageName: "dulich"))
        hangmuc.append(HangMucChi(titled: "Làm đẹp", imageName: "lamdep"))
        hangmuc.append(HangMucChi(titled: "Mỹ phẩm", imageName: "mypham"))
        //
        
        return ListHangMucChi(name: "Hưởng thụ", image: "huongthu", hangmuc: hangmuc)
        
    }
    //
    private class func Phattrien() -> ListHangMucChi
    {
        var hangmuc = [HangMucChi]
        hangmuc.append(HangMucChi(titled: "Học hành", imageName: "hochanh"))
        hangmuc.append(HangMucChi(titled: "Giao lưu - Quan hệ", imageName: "giaoluu"))
        
        //
        
        return ListHangMucChi(name: "Phát triển bản thân", image: "phattrien", hangmuc: hangmuc)
        
    }
}
