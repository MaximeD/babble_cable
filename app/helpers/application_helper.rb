module ApplicationHelper

  # Boostrap class for a flash message.
  #
  # @param flash_type [String] rails flash type
  # @return [String] boostrap class
  def alert_class_for(flash_type)
    {
      success: 'alert-success',
      error:   'alert-danger',
      alert:   'alert-warning',
      notice:  'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end
end
