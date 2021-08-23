class Book < ApplicationRecord

  belongs_to :user
  # attachment :profile_image
#   attachment :user
# 上記記述はbbokscontrollerでuser_idを取得するために必要であると考えて記述していたが
# これがあることによりエラーが出ていた。refileについてあまり理解が

validates :title, presence: true
validates :body, presence: true, length: { maximum: 200 }


end
