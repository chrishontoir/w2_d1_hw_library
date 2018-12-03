require('minitest/autorun')
require('minitest/rg')
require_relative('../library')

class LibraryTest < MiniTest::Test


  def setup
    @library = Library.new([
      {
        title: "lord of the rings",
        rental_details: {
          student_name: "Jeff",
          date: "01/12/16"
        }
      },
      {
        title: "of mice and men",
        rental_details: {
          student_name: "Bill",
          date: "03/12/18"
        }
      },
      {
        title: "the hobbit",
        rental_details: {
          student_name: "Tom",
          date: "14/10/17"
        }
      },
      {
        title: "it",
        rental_details: {
          student_name: "Rachel",
          date: "21/03/18"
        }
      }
      ])
  end

  def test_get_book_name__first
    assert_equal("lord of the rings", @library.book[0][:title])
  end

  def test_get_book_name__second
    assert_equal("of mice and men", @library.book[1][:title])
  end

  def test_return_all_info
    assert_equal("The book 'THE HOBBIT', was borrowed by TOM on 14/10/17.", @library.return_all_info("the hobbit"))
  end

  def test_return_rental_details
    assert_equal("This book was borrowed by Rachel on 21/03/18.", @library.return_rental_details("it"))
  end

  def test_add_book
    assert_equal(5, @library.add_book("the jungle book"))
  end

  def test_change_rental_details
    @library.change_rental_details("it", "John", "12/12/18")
    assert_equal("This book was borrowed by John on 12/12/18.", @library.return_rental_details("it"))
  end
end
