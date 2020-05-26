class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password

  enum role: %w(default admin) # {"default" => 0, "admin" => 1}
  # enum role: [:default, :admin]
  # enum role: {default: 0, admin: 1, super_admin: 3}


  def my_user_method
    # Query
    # Interfacing with DB
  end

  def my_user_method_2

  end

  def my_user_method_2

  end
end


# DB -> Rails Model -> Controllers -> Views
