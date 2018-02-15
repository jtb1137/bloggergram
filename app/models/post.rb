class Post < ApplicationRecord
    has_attached_file :image, styles: { medium: "500x500", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    validates_presence_of :image, :title, :description
    validates :title, length: { maximum: 100 }

    has_many :comments
    belongs_to :user
end
