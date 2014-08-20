class Page < ActiveRecord::Base

  ORDINAL_INCREMENT = 10

  # == Constants =============================================================

  # == Properties ============================================================

  # == Extensions ============================================================

  # == Relationships =========================================================

  belongs_to :survey
  has_many :questions,
    dependent: :restrict_with_error

  # == Validations ===========================================================

  validates :survey, presence: true

  # == Callbacks =============================================================

  after_save :recalculate_ordinals

  # == Scopes ================================================================

  # == Class Methods =========================================================

  # == Instance Methods ======================================================

  def recalculate_ordinals
    return unless self.ordinal_changed? || self.id_changed?

    self.survey.pages.order(:ordinal).each_with_index do |page, index|
      page.update_column(:ordinal, (index+1)*ORDINAL_INCREMENT)
    end
  end

end
