class Object
  def _?(x = nil)
    self
  end
end

class NilClass
  def _?(x = nil)
    if block_given?
      yield
    else
      x
    end
  end
end

