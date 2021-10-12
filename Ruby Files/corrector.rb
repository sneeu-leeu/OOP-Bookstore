class Corrector
  def correct_name(name)
    cap_name = name.capitalize
    cap_name.slice(0, 10)
  end
end
