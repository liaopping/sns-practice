class Tag < ApplicationRecord
  before_validation :delete_whitespace

  has_many :post_tag_relations, dependent: :destroy
  has_many :posts, through: :post_tag_relations, dependent: :destroy

  private
    def delete_whitespace
      self.name = name.strip
    end
end
