class Book < ApplicationRecord

  belongs_to :user
#   attachment :user
# 上記記述はbbokscontrollerでuser_idを取得するために必要であると考えて記述していたが
# これがあることによりエラーが出ていた。refileについてあまり理解が
end
