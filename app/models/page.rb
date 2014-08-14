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

  before_create :set_ordinal

  # == Scopes ================================================================

  # == Class Methods =========================================================

  # == Instance Methods ======================================================

  def set_ordinal
    last_ordinal = survey.pages.order(:ordinal).last.try(:ordinal)
    self.ordinal = last_ordinal ? last_ordinal + ORDINAL_INCREMENT : 0
  end

end
