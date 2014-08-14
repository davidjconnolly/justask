class Question < ActiveRecord::Base

  ORDINAL_INCREMENT = 10

  # == Constants =============================================================

  # == Properties ============================================================

  # == Extensions ============================================================

  # == Relationships =========================================================

  belongs_to :page
  has_one :response,
    dependent: :restrict_with_error

  # == Validations ===========================================================

  validates :page, presence: true

  # == Callbacks =============================================================

  before_create :set_ordinal

  # == Scopes ================================================================

  # == Class Methods =========================================================

  # == Instance Methods ======================================================

  def set_ordinal
    last_ordinal = page.questions.order(:ordinal).last.try(:ordinal)
    self.ordinal = last_ordinal ? last_ordinal + ORDINAL_INCREMENT : 0
  end

end
