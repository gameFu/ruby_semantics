class Machine < Struct.new(:staement, :env)

  def step
    self.staement, self.env = staement.reduce(env)
  end

  def run
    while staement.reducible?
      puts "#{staement}, #{env}"
      step
    end
    puts "#{staement}, #{env}"
    staement
  end

end
