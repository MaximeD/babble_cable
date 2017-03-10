class Array
  #compute hash on array
  def hashes
    self.to_set.hash.to_s
  end
end

class String
  include ActionView::Helpers::OutputSafetyHelper
  #compute hash on array
  def to_raw
     raw self
  end
end