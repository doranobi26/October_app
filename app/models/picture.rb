class Picture < ApplicationRecord

  belongs_to :post
  attachment :picture
end
