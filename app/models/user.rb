class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 50 }

  has_many :posts, dependent: :destroy
  has_one_attached :profile_image
  before_create :default_image


  def default_image
    if !self.profile_image.attached?
      self.profile_image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-icon.png')), filename: 'default-icon.png', content_type: 'image/png')
    end
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
