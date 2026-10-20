import SwiftUI

// 1. 上方大合照封面 (CoverHeaderView)
struct CoverHeaderView: View {
    var body: some View {
        ZStack(alignment: .center) {
            //大圖與文字
            Image("background")
                .resizable()
                .scaledToFill()
                .frame(height: 270)
                .blur(radius: 1.5)
                .clipped()
                .overlay(
                    // 半透明暗色遮罩
                    LinearGradient(
                        colors: [.black.opacity(0.35), .black.opacity(0.45)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            VStack(spacing: 2) {
                Text(" 旗雨知晴")
                    .font(.custom("ChenYuluoyan-Thin-Monospaced", size: 70))
                    .foregroundColor(.white)
                    .tracking(8)
                    .shadow(color: .black.opacity(0.5), radius: 4, x: 0, y: 2)
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

// 2. 主畫面 (ContentView)
struct ContentView: View {
    let performances: [PerformanceItem] = [

        PerformanceItem(
            title: "校慶晚會",
            date: "2023.12.01",
            imageName: "校晚三",
            description: "主題《Anthea》 ，我們以旗、槍、飄扇等道具結合舞蹈，展現出鬱金香的優雅姿態。",
            galleryImages: ["校晚三", "校晚一", "校晚二"],
            youtubeURL: "https://youtu.be/xkHzeHyLhg4?si=aJLCK60mi3uVkZNN",
            minutedescription: "北一旗隊"

        ),
        PerformanceItem(
            title: "120週年校慶",
            date: "2023.12.12",
            imageName: "校慶一",
            description: "高二的首場大型演出。此次也與日本橘高校進行交流，留下難能可貴的國際同臺記憶。",
            galleryImages: ["校慶一", "校慶二", "校慶三", "校慶四"],
            youtubeURL: "https://youtu.be/fXTWMZHqzCY?si=puv4nuOo_6LDMlvK",
            minutedescription: "黎家維（9:24 開始）"
            
        ),
        PerformanceItem(
            title: "全國學生音樂比賽",
            date: "2024.03.02",
            imageName: "全國賽四",
            description:
                "汗水與淚水交織的高光時刻。無數次在烈日與室內反覆琢磨的走位與拋接，在全國賽的舞台上化作最耀眼的張力，榮獲評審肯定奪得「特優」殊榮。",
            galleryImages: ["全國賽四", "全國賽三", "全國賽二", "全國賽一"],
            youtubeURL: "https://youtu.be/PEieq813LrU?si=CB6KNDJyqulhDZSM",
            minutedescription: "管你樂不樂"
            
        ),
        PerformanceItem(
            title: "社團聯展",
            date: "2024.04.12",
            imageName: "社聯四",
            description: "主題《Antiquary》，我們透過音樂、舞蹈以及道具的編排，交織出復古的視覺饗宴。",
            galleryImages: ["社聯四", "社聯三", "社聯一", "社聯二"],
            youtubeURL: "https://www.youtube.com/watch?v=wgwBGdACsVc",
            minutedescription: "北一旗隊"

        ),
        PerformanceItem(
            title: "大獎賽",
            date: "2024.04.28",
            imageName: "大獎一",
            description:
                "以神秘的《Lady burglar》為主題，融入戲劇張力與流暢的圖形變化。本場演出為「完整版」首度獻出，精湛的表現與張揚的風格奪得「銀獎」肯定。",
            galleryImages: ["大獎一", "大獎二", "大獎三"],
            youtubeURL: "https://www.youtube.com/watch?v=kHwRDq4CXAY",
            minutedescription: "管你樂不樂"

        ),
        PerformanceItem(
            title: "台加藝文節",
            date: "2024.07.02",
            imageName: "台加一",
            description:
                "貳陸的第一場國外演出！我們帶著屬於台灣的青春熱血與精湛旗技站上國際舞台，將數不清的日夜訓練化作全場最動人的異國篇章。",
            galleryImages: ["台加一", "台加二", "台加三"],
            youtubeURL: "https://youtu.be/QfH_2CpYfVY?si=w_CNiENWbw6WvUzY",
            minutedescription: "北一女加拿大校友會（6:40 開始）"

        ),
        PerformanceItem(
            title: "卡加利牛仔節",
            date: "2024.07.05 - 07.07",
            imageName: "卡加利三",
            description:
                "屬於貳陸的最後一舞。我們在加拿大卡加利展開了包含遊行、社區表演與 Fanfare 等共五場的高強度演出。將三年的汗水、淚水與深厚情誼，化作舞台上最耀眼奪目的篇章。遊行榮獲 名人評審獎 ，Fanfare 更一舉奪下 Best in Show 與 Fan Favorite 雙料大獎，完美為高中旗隊生涯劃下最震撼也最動人的句點。",
            galleryImages: ["卡加利三", "卡加利一", "卡加利二"],
            youtubeURL:
                "https://www.youtube.com/live/HBwyUPdzSzM?si=C3hWFhLp_HPZcHTQ",
            minutedescription: "Global News（1:05:00 開始）"

        ),
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                // 背景
                Color(.systemBackground)
                    .ignoresSafeArea()
                //上方標題與圖示
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        HStack(alignment: .center) {
                            //左上
                            VStack(alignment: .leading, spacing: 4) {
                                Text("北一旗隊 26 屆")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(.primary)

                                Text("TFG COLORGUARD 26th")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.secondary)
                                    .tracking(2)
                            }
                            Spacer()
                            // 右上角：SF Symbols 旗子圖示
                            Image(systemName: "flag.fill")
                                .font(.system(size: 25))
                                .foregroundColor(.primary.opacity(0.8))
                                .padding(10)
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 10)

                        // 上方大合照封面
                        CoverHeaderView()

                        //三張小圖
                        GeometryReader { geometry in
                            let totalWidth = geometry.size.width - -9
                            let itemWidth = (totalWidth - 20) / 3
                            HStack(spacing: 5) {
                                ForEach(["1", "2", "3"], id: \.self) {
                                    imageName in
                                    Image(imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: itemWidth, height: 100)
                                        .clipped()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 6)
                                                .stroke(
                                                    Color.black.opacity(0.08),
                                                    lineWidth: 0.5
                                                )
                                        )
                                        .shadow(
                                            color: .black.opacity(0.05),
                                            radius: 4,
                                            x: 0,
                                            y: 2
                                        )
                                }
                            }
                            .frame(width: geometry.size.width)
                        }
                        .frame(height: 85)
                        .padding(.top, -20)

                        //中間介紹部分
                        VStack(spacing: 2) {
                            // 置中大標題
                            Text("About Us")
                                .font(
                                    .custom(
                                        "ChenYuluoyan-Thin-Monospaced",
                                        size: 45
                                    )
                                )
                                .tracking(3)
                                .foregroundColor(.primary)
                            // 細分割線
                            Rectangle()
                                .fill(Color.primary.opacity(0.3))
                                .frame(width: 40, height: 1.5)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 20)

                        //介紹區塊
                        VStack(alignment: .leading, spacing: 24) {
                            // 子標題一：What is Colorguard?
                            VStack(alignment: .leading, spacing: 10) {
                                HStack(spacing: 8) {
                                    // 旗子 SF Symbol
                                    Image(systemName: "flag.fill")
                                        .font(.system(size: 22))
                                        .foregroundColor(
                                            Color("DynamicBackground")
                                        )
                                    // 放大標題
                                    Text("What is Colorguard?")
                                        .font(
                                            .system(size: 18, weight: .bold)
                                        )
                                        .foregroundColor(.primary)
                                }
                                Text(
                                    "旗隊（Colorguard）融合了舞蹈、旗械與肢體美學，是表演藝術中兼具力與美的存在。我們透過拋接、轉旗與走位，在音樂流轉間訴說動人的故事，為每一場演出賦予深刻的視覺靈魂。"
                                )
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(.secondary)
                                .lineSpacing(6)
                            }
                            // 項目之間分割線
                            Divider()
                                .background(Color.secondary.opacity(0.2))

                            // 子標題二：北一旗隊
                            VStack(alignment: .leading, spacing: 10) {
                                HStack(spacing: 8) {
                                    // 旗子 SF Symbol
                                    Image(systemName: "flag.fill")
                                        .font(.system(size: 22))
                                        .foregroundColor(
                                            Color("DynamicBackground")
                                        )
                                    // 放大標題
                                    Text("北一旗隊26屆 —— 旗雨知晴")
                                        .font(
                                            .system(size: 18, weight: .bold)
                                        )
                                        .foregroundColor(.primary)
                                }
                                Text(
                                    """
                                    北一旗隊創立於 1989 年，走過二十多個年頭，每一屆都將汗水與熱情化作空中劃過的最美弧線。
                                    第 26 屆《旗雨知晴》由 18 位隊員組成。一路走來，我們在無數的練習與掌聲中凝聚出無可取代的羈絆，將青春與堅持，毫無保留地綻放在每一場演出之中。這裡收錄了我們的成長、淚水，以及所有閃閃發光的團體記憶。
                                    """
                                )
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(.secondary)
                                .lineSpacing(6)
                            }
                        }
                        .padding(.horizontal, 24)
                        // 置中大標題
                        VStack(spacing: 2) {
                            Text("Our Memories")
                                .font(
                                    .custom(
                                        "ChenYuluoyan-Thin-Monospaced",
                                        size: 45
                                    )
                                )
                                .tracking(3)
                                .foregroundColor(.primary)

                            // 質感短分割線
                            Rectangle()
                                .fill(Color.primary.opacity(0.3))
                                .frame(width: 40, height: 1.5)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 20)

                        // 下方 5 個表演清單區塊
                        VStack(alignment: .leading, spacing: 10) {
                            // 用迴圈自動把 5 個表演排出來
                            VStack(spacing: 20) {
                                ForEach(performances) { item in
                                    // 點擊每一列可以跳轉到詳細頁面
                                    NavigationLink(
                                        destination: PerformanceDetailView(
                                            item: item
                                        )
                                    ) {
                                        PerformanceRowView(item: item)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .cornerRadius(15)
                            .shadow(
                                color: .black.opacity(0.05),
                                radius: 5,
                                x: 0,
                                y: 2
                            )
                            .padding(.horizontal)
                        }
                    }
                    .padding(.bottom, 30)

                    // 頁面最底部：官方 IG 帳號
                    VStack(spacing: 16) {
                        Text("@tfgcolorguard")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(.secondary.opacity(0.7))
                            .padding(.top, -11)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
