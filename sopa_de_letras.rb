class Board
# You should put here the given boards templates
	
  def initialize(board_string)
  	@mix = board_string.gsub(/[X]/){|x| ("A".."Z").to_a.sample}
  	@board =  @mix.scan(/.{5}/).map!{|row| row.split("")}
    
   
  end


  def to_s(board=nil)
    if board.nil?
        board = @board
    end
    board.each do |row|
      row.each do |element|
        print "  #{element}  "
      end
      puts
    end 
    " "
  end

  def check_board(word)
    new_board = []
    @board.map{|row| new_board << row.dup}
    diagonal = convert_diagonals_to_cols(new_board)
    # p "normal"
    # to_s(@board)
    # p "normal transpuesto"
    # to_s(@board.transpose)
    # p "diagonal"
    # to_s(diagonal)
    # p "diagonal transpuesto"
    # to_s(diagonal.transpose)


    if check_rows(@board, word) || check_rows(@board.transpose, word) || check_rows(diagonal, word) || check_rows(diagonal.transpose, word) 
      true
    else
      false
    end
  end

  def check_rows(board, word)
    board.transpose.each do |row|
      return true if word_in_array(row,word.upcase)  
      return true if word_in_array(row.join.reverse.split(""),word.upcase)
    end
    false
  end

  def convert_diagonals_to_cols(board_diagonal)
    board_diagonal.each_with_index do |row, index|
      index.times do  
        row.unshift(" ")
      end
      (board_diagonal.length-index).times do 
        row.push(" ")
      end
    end
    board_diagonal
  end
  

  def word_in_array(array,word)
    array.join.include?(word) ? true : false
  end
end


words = ["POEMA", "CANCION", "RONDAS", "RIMAS", "SAMIR"]  
board = Board.new("POEMAXCXXXXAXXSXNXAAXCMXDXIXXNROXXOXNXXR")
puts board
words.each do |word|
 p board.check_board(word)
end

words1 = ["MANGO", "SANDIA", "MELON", "PLATANO"]
board1 = Board.new("XXXXPXXXXLXAMXAXIEXTXDLXAXNOXNMANGOXSXXX")
puts board1
words1.each do |word|
  p board1.check_board(word) 
end

words2 = ["ROJO", "VERDE", "AZUL", "NEGRO" ]
board2 = Board.new("OJORXXXXXXXEXXOXDXRXXRGLXXEXUXNVXZXXXXAX")
puts board2
words2.each do |word|
  p board2.check_board(word) 
end
