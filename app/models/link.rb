class Link < ApplicationRecord
  has_many :views, dependent: :destroy

  validates :url, presence: true

  scope :recent_first, -> { order(created_at: :desc) }

  after_save_commit if: :url_previously_changed? do
    MetadataJob.perform_later(to_param)
  end

  # Link.find
  def self.find(id)
    super ShortCode.decode(id)
  end

  # @link.to_param
  def to_param
    ShortCode.encode(id)
  end

  def domain
    URI(url).host rescue StandardError URI::InvalidURIError
  end
end
