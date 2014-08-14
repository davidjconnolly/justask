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

  after_save :recalculate_ordinals

  # == Scopes ================================================================

  # == Class Methods =========================================================

  # == Instance Methods ======================================================

  def recalculate_ordinals
    return unless self.ordinal_changed? || self.id_changed?

    self.page.questions.order(:ordinal).each_with_index do |question, index|
      question.update_column(:ordinal, (index+1)*ORDINAL_INCREMENT)
    end
  end

end
