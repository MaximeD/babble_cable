class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  before_validation :set_defaults!

  protected
  def set_defaults!

  end
end
