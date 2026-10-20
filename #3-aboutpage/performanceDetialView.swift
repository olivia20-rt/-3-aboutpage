//
//  performanceDetialView.swift
//  MyApp
//
//  Created by Olivia on 2026/10/18.
//

import SwiftUI

struct PerformanceDetailView: View {
    let item: PerformanceItem
    @State private var currentIndex = 0
    @Environment(\.openURL) var openURL //加入這個環境變數，用來開啟外部網址

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                // 1. 頂部標題與日期
                VStack(alignment: .leading, spacing: 6) {
                    HStack(alignment: .center, spacing: 8) {
                        Text(item.title)
                            .font(.system(size: 26, weight: .bold))
                            .foregroundColor(.primary)
                            .fixedSize(horizontal: false, vertical: true)

                        Spacer()

                        Image(systemName: "sparkles")
                            .font(.system(size: 20))
                            .foregroundColor(.yellow)
                    }

                    Text(item.date)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.secondary)
                }
                // 2. 上方橫式大圖
                GeometryReader { geometry in
                    let standardWidth = max(geometry.size.width, 0)

                    Image(item.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: standardWidth, height: 220)
                        .clipped()
                }
                .frame(height: 220)
                .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 5)
                // 3. 文字說明區 + 分隔線
                VStack(alignment: .leading, spacing: 16) {
                    Text(item.description)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.primary.opacity(0.85))
                        .lineSpacing(6)

                    Divider()
                        .background(Color.secondary.opacity(0.3))
                }
                // 4. 底部精彩回顧
                VStack(alignment: .leading, spacing: 10) {
                    // 標題與右側張數小標籤
                    HStack(alignment: .center) {
                        Text("精彩回顧")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.primary)

                        Spacer()

                        Text("\(item.galleryImages.count) PHOTOS")
                            .font(.system(size: 10, weight: .semibold))
                            .foregroundColor(.secondary.opacity(0.8))
                    }

                    //獨立的浮動照片卡片
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 14) {
                            ForEach(item.galleryImages, id: \.self) {
                                imageName in
                                Image(imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 175, height: 115)  // 卡片尺寸
                                    .clipped()
                                    .cornerRadius(0)  // 卡片圓角
                                    //每一張照片獨立的陰影
                                    .shadow(
                                        color: .black.opacity(0.12),
                                        radius: 8,
                                        x: 0,
                                        y: 4
                                    )
                            }
                        }
                        .padding(.horizontal, 2)
                        .padding(.vertical, 8)
                    }

                    .frame(maxWidth: .infinity)
                    .padding(.top, 2)
                }
                // 5. YouTube 連結按鈕（支援真實點擊跳轉網址）
                Button(action: {
                    //點擊時，把字串網址轉換成 URL，並透過 openURL 打開它
                    if let url = URL(string: item.youtubeURL) {
                        openURL(url)
                    }
                }) {
                    HStack(spacing: 12) {
                        // YouTube 紅色小圖示
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.red)
                                .frame(width: 32, height: 32)

                            Image(systemName: "play.fill")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                        }

                        // 文字與備註區塊
                        VStack(alignment: .leading, spacing: 3) {
                            Text("觀看完整表演影片 (YouTube)")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.primary)

                            Text(item.minutedescription)
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        Image(systemName: "arrow.up.right")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.secondary)
                    }
                    .padding(16)
                    .background(.ultraThinMaterial)
                    .cornerRadius(14)
                    .shadow(color: .black.opacity(0.04), radius: 8, x: 0, y: 4)
                }

                Spacer().frame(height: 40)
            }
            .padding(.horizontal, 24) //統一在最外層的主 VStack 加上左右 24 邊距，讓底下所有子元件乖乖排在同一個軌道裡
        }

        .background(Color(.systemGroupedBackground))
        .navigationBarTitleDisplayMode(.inline)
    }
}
