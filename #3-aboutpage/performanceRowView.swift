//
//  performanceRowView.swift
//  MyApp
//
//  Created by 115-1student20 on 2026/10/18.
//

import SwiftUI

// 重複的表演長條元件：左邊放縮圖，右邊放標題與日期
struct PerformanceRowView: View {
    let item: PerformanceItem

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center, spacing: 18) {
                // 1. 左側固定大小的長方形圖片
                Image(item.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 80)
                    .clipped()

                // 2. 右側文字區塊（標題在上、日期在下）
                VStack(alignment: .leading, spacing: 6) {
                    // 表演名稱（主標題放大加粗）
                    Text(item.title)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.primary)
                        .lineLimit(2) //設定文字最多兩行
                        .multilineTextAlignment(.leading) //如果分兩行則要對其左側

                    // 日期
                    Text(item.date)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.secondary)
                }

                Spacer()

                // 3. 右側的箭頭
                Image(systemName: "chevron.right")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.secondary.opacity(0.5))
            }
            .padding(.vertical, 16)

            // 4. 項目之間細分隔線
            Divider()
                .background(Color.primary.opacity(0.15))
        }
    }
}
