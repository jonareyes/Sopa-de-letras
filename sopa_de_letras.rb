class Board
# You should put here the given boards templates
	
  def initialize(board_string)
  	@mix = board_string.gsub(/[X]/){|x| ("A".."Z").to_a.sample}
  	@board =  @mix.scan(/.{5}/).map!{|row| row.split("")}
    
   
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


  def check_board(word)
    convert_diagonals_to_cols(@board).transpose
    # if check_rows(@board, word) || check_rows(@board.transpose, word) || 
    #   true
    # else
    #   false
    # end
  end

  def check_rows(board, word)
    board.transpose.each do |row|
      return true if word_in_array(row,word.upcase)  
      return true if word_in_array(row.join.reverse.split(""),word.upcase)
    end
    false
  end

   def convert_diagonals_to_cols(board)
    board.each_with_index do |row, index|
      index.times do  
        row.unshift(" ")  
      end
      p row
    end
    board
  end
  

  def word_in_array(array,word)
    array.join.include?(word) ? true : false
  end
end


# words = ["POEMA", "CANCION", "RONDAS", "RIMAS"]  
# board = Board.new("POEMAXCXXXXAXXSXNXAAXCMXDXIXXNROXXOXNXXR")
# puts board
# words.each do |word|
#  p board.check_board(word)
# end

# words1 = ["MANGO", "SANDIA", "MELON", "PLATANO"]
# board1 = Board.new("XXXXPXXXXLXAMXAXIEXTXDLXAXNOXNMANGOXSXXX")
# puts board1
# words1.each do |word|
#   p board1.check_board(word) 
# end
words2 = ["ROJO", "VERDE", "AZUL", "NEGRO"]
board2 = Board.new("OJORXXXXXXXEXXOXDXRXXRGLXXEXUXNVXZXXXXAX")
puts board2
p board2.check_board("poema")

#board2.check_diagonal()