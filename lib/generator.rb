module Generator

  def new_key
		Array.new(5) { rand(0..9) }.join
	end
end