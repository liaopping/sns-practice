class Contact
  include ActiveModel::Model

  attr_accessor :name, :email, :body

  validates :name, presence: { message: 'を入力してください' }
  validates :email, presence: { message: 'を入力してください' }
  validates :body, presence: { message: 'を入力してください' }
end