class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :place, presence: true
  validates :company_name, presence: true
  validates :recruitment_number, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
  validates :recruitment_number, numericality: { greater_than: 0}
  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC') }
  has_many :resumes
  has_many :favorites
  has_many :fans, through: :favorites, source: :user

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
