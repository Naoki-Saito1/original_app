class Profile < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_one :link
  belongs_to :user
  # バリデーション
  validates :user_id, uniqueness: true
  delegate :portfolio, to: :user
  validates :name, presence: true  
  validates :detail, length: { maximum: 250 }, allow_blank: true
  validates :name, length: { maximum: 25 }
  validates :body, length: { maximum: 1000 }, allow_blank: true
   # バリデーション
  enum gender:{
     " ":0,
    女性:1,
    男性:2
  }
  enum status:{
    '転職活動はしていない':1,
    '1年後転職活動予定':2,
    '半年後転職活動予定':3,
    '3ヶ月後転職活動予定':4,
    '1ヶ月後転職活動予定':5,
    '現在転職活動中':6,
    '業務委託契約希望':7,
    '在職中':8,
    'その他':9
  }, _prefix: true
  enum address:{
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
    沖縄県:47,その他:48
  }, _prefix: true
end
