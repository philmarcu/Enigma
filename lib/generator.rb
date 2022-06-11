class Generator
    def new_key
        5.times.map { rand(0..9) }.join
    end
end


