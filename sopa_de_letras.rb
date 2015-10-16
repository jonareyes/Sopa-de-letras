class Board
# You should put here the given boards templates
	
  def initialize
  	mix = "AMEOPXCXXXXAXXSXNXXCMXDXIXXNROXXOXNXXR".gsub(/[X]/){|x| ("A".."Z").to_a.sample}
  	@board =  mix.scan(/.{5}/).map!{|row| row.split("")} 
  	 
   
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

  def include?(word)

    # word_in_array(x,word) => renglon 
    # word_in_array(x,word) => renglon_en_reversa
    # word_in_array(x,word) => columna
    # word_in_array(x,word) => columna_en_reversa
  end

  def check_rows(word)
    @board.each do |row|
      return true if word_in_array(row,word.upcase)  
      return true if word_in_array(row.join.reverse.split(""),word.upcase)  
    end
    false
  end

  def word_in_array(array,word)
    array.join.include?(word) ? true : false
  end
end


board = Board.new
puts board
puts board.check_rows("poema")
puts board.check_rows("javier")