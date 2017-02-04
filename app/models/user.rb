class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :resumes
  has_many :favorites
  has_many :favorite_jobs, :through => :favorites, :source => :job

  def is_favorite_of?(job)
    favorite_jobs.include?(job)
  end

  def admin?
    is_admin
  end

end
