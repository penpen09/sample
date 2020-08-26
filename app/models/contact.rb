class Contact < ApplicationRecord
  validates :content,presence:{message:"入力がありません"}
  validates :content,length:{in:1..140,message:"１〜１４０文字以内で入力してください"}
end
