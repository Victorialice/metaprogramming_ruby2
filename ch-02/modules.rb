module Printable
  def print
    puts "I am printing from Printable"
  end

  def prepare_cover
    puts "Preparing cover from printable"
  end

end


module Document
  def print_to_screen
    prepare_cover
    format_for_screen
    print
  end

  def format_for_screen
    puts "Formatting the screen from Document"
  end

  def print
    puts "I am printing from Document"
  end
end


class Book
  include Document
  include Printable
end


b = Book.new
b.print_to_screen


p Book.ancestors