
class Library

  def initialize(book)
    @book = book
  end

  def book
    return @book
  end

  def return_all_info(title)
    for item in @book
      if item[:title] == title
        return "The book '#{item[:title].upcase}', was borrowed by #{item[:rental_details][:student_name].upcase} on #{item[:rental_details][:date].upcase}."
      end
    end
    return "No book with that name was found."
  end

  def return_rental_details(title)
    for item in @book
      if item[:title] == title
        return "This book was borrowed by #{item[:rental_details][:student_name]} on #{item[:rental_details][:date]}."
      end
    end
    return "No book with that name was found."
  end

  def add_book(title)
    @book.push( { :title => "#{title}", :rental_details => { :student_name => "", :date => ""}} )
    return @book.length
  end

  def change_rental_details(title, new_student, new_date)
    for item in @book
      if item[:title] == title
        item[:rental_details][:student_name] = new_student
        item[:rental_details][:date] = new_date
      end
    end
  end
end
