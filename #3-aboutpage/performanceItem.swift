//
//  performanceItem.swift
//  MyApp
//
//  Created by 115-1student20 on 2026/10/18.
//

import SwiftUI

// 資料模型
struct PerformanceItem: Identifiable {
    let id = UUID()
    let title: String         // 表演名稱
    let date: String          // 表演日期
    let imageName: String     // 縮圖的 Asset 圖片名稱
    let description: String   // 詳細說明文字
    let galleryImages: [String] // 點進去後的左右滑動照片陣列
    let youtubeURL: String    // YouTube 連結
    let minutedescription: String   // 分鐘
}
