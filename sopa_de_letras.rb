class Board
# You should put here the given boards templates
	
  def initialize
  	mix = "POEMAXCXXXXAXXSXNXXCMXDXIXXNROXXOXNXXR".gsub(/[X]/){|x| ("A".."Z").to_a.sample}
  	@board =  mix.scan(/.{5}/).map!{|row| row.split("")} 
  	@board 
   
  end


  def to_s
    @board.each do |row|
  		row.each do |element|
  			print "  #{element}  "
  		end
  		puts
  	end	
  	" "
  end
end

board = Board.new
puts board