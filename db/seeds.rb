require 'csv'

Prefecture.create!(
  [
    { id: 1, name_ja: '北海道', name_en: 'Hokkaido' },
    { id: 2, name_ja: '青森県', name_en: 'Aomori' },
    { id: 3, name_ja: '岩手県', name_en: 'Iwate' },
    { id: 4, name_ja: '宮城県', name_en: 'Miyagi' },
    { id: 5, name_ja: '秋田県', name_en: 'Akita' },
    { id: 6, name_ja: '山形県', name_en: 'Yamagata' },
    { id: 7, name_ja: '福島県', name_en: 'Fukushima' },
    { id: 8, name_ja: '茨城県', name_en: 'Ibaraki' },
    { id: 9, name_ja: '栃木県', name_en: 'Tochigi' },
    { id: 10, name_ja: '群馬県', name_en: 'Gunma' },
    { id: 11, name_ja: '埼玉県', name_en: 'Saitama' },
    { id: 12, name_ja: '千葉県', name_en: 'Chiba' },
    { id: 13, name_ja: '東京都', name_en: 'Tokyo' },
    { id: 14, name_ja: '神奈川県', name_en: 'Kanagawa' },
    { id: 15, name_ja: '新潟県', name_en: 'Niigata' },
    { id: 16, name_ja: '富山県', name_en: 'Toyama' },
    { id: 17, name_ja: '石川県', name_en: 'Ishikawa' },
    { id: 18, name_ja: '福井県', name_en: 'Fukui' },
    { id: 19, name_ja: '山梨県', name_en: 'Yamanashi' },
    { id: 20, name_ja: '長野県', name_en: 'Nagano' },
    { id: 21, name_ja: '岐阜県', name_en: 'Gifu' },
    { id: 22, name_ja: '静岡県', name_en: 'Shizuoka' },
    { id: 23, name_ja: '愛知県', name_en: 'Aichi' },
    { id: 24, name_ja: '三重県', name_en: 'Mie' },
    { id: 25, name_ja: '滋賀県', name_en: 'Shiga' },
    { id: 26, name_ja: '京都府', name_en: 'Kyoto' },
    { id: 27, name_ja: '大阪府', name_en: 'Osaka' },
    { id: 28, name_ja: '兵庫県', name_en: 'Hyogo' },
    { id: 29, name_ja: '奈良県', name_en: 'Nara' },
    { id: 30, name_ja: '和歌山県', name_en: 'Wakayama' },
    { id: 31, name_ja: '鳥取県', name_en: 'Tottori' },
    { id: 32, name_ja: '島根県', name_en: 'Shimane' },
    { id: 33, name_ja: '岡山県', name_en: 'Okayama' },
    { id: 34, name_ja: '広島県', name_en: 'Hiroshima' },
    { id: 35, name_ja: '山口県', name_en: 'Yamaguchi' },
    { id: 36, name_ja: '徳島県', name_en: 'Tokushima' },
    { id: 37, name_ja: '香川県', name_en: 'Kagawa' },
    { id: 38, name_ja: '愛媛県', name_en: 'Ehime' },
    { id: 39, name_ja: '高知県', name_en: 'Kochi' },
    { id: 40, name_ja: '福岡県', name_en: 'Fukuoka' },
    { id: 41, name_ja: '佐賀県', name_en: 'Saga' },
    { id: 42, name_ja: '長崎県', name_en: 'Nagasaki' },
    { id: 43, name_ja: '熊本県', name_en: 'Kumamoto' },
    { id: 44, name_ja: '大分県', name_en: 'Oita' },
    { id: 45, name_ja: '宮崎県', name_en: 'Miyazaki' },
    { id: 46, name_ja: '鹿児島県', name_en: 'Kagoshima' },
    { id: 47, name_ja: '沖縄県', name_en: 'Okinawa' },
    { id: 81, name_ja: '北海道開発局', name_en: 'Hokkaido Regional Development Bureau' },
    { id: 82, name_ja: '東北地方整備局', name_en: 'Tohoku Regional Development Bureau' },
    { id: 83, name_ja: '関東地方整備局', name_en: 'Kanto Regional Development Bureau' },
    { id: 84, name_ja: '北陸地方整備局', name_en: 'Hokuriku Regional Development Bureau' },
    { id: 85, name_ja: '中部地方整備局', name_en: 'Chubu Regional Development Bureau' },
    { id: 86, name_ja: '近畿地方整備局', name_en: 'Kinki Regional Development Bureau' },
    { id: 87, name_ja: '中国地方整備局', name_en: 'Chugoku Regional Development Bureau' },
    { id: 88, name_ja: '四国地方整備局', name_en: 'Shikokuchi Regional Development Bureau' },
    { id: 89, name_ja: '九州地方整備局', name_en: 'Kyushu Regional Development Bureau' },
    { id: 90, name_ja: '沖縄総合事務局', name_en: 'Okinawa General Bureau' }
  ]
)

InundationDepth.create!(
  [
    { id: 1, min: 0, max: 0.5 },
    { id: 2, min: 0.5, max: 1 },
    { id: 3, min: 1, max: 2 },
    { id: 4, min: 2, max: 3 },
    { id: 5, min: 3, max: 4 },
    { id: 6, min: 4, max: 5 },
    { id: 7, min: 2, max: 5 },
    { id: 8, min: 5 },
  ]
)

File.open(Rails.root.join('db', 'inundation_details.csv')) do |file|
  CSV.foreach(file, headers: true) do |row|
    InundationDetail.create!(row.to_h)
  end
end

# InundationDetail
# "指定の前提となる計画降雨"
# "告示番号"
# "関係市町村"
# "指定年月日"
# "対象となる洪水予報河川"
# "作成種別コード"
# "作成主体"
#
# "Planned rainfall as a prerequisite for designation"
# "Notification number"
# "Related municipalities"
# "Designated date"
# "Target flood forecast river"
# "Creation type code"
# "Creating subject"

# InundationNote
# "説明文"
# "Explanatory text"
# "その他計算条件等"
# "Other calculation conditions, etc."
