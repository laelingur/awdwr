class Product < ActiveRecord::Base
  validates_presence_of :title, :description, :image_url
  validates_numericality_of :price
  validate :price_must_be_at_least_one_cent
  validates_uniqueness_of :title
  validates_format_of :image_url,
                      :with => %r{\.(gif|jpg|png)}i,
                      :message => 'must be url for gif, jpg or png image' 
  
  protected
    def price_must_be_at_least_one_cent
      errors.add(:price, 'should be at least 0.01') if price.nil? || price < 0.01
    end
end
