class Recipe < ActiveRecord::Base
  belongs_to  :category
  has_many    :directions,  dependent: :destroy
  has_many    :ingredients, dependent: :destroy

end
