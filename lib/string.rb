class String

  def reverse_first_last_names
    if self =~ /(.+),\s*(.+)/
      "#{$2} #{$1}"
    else
      self
    end
  end

end
