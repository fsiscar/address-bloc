require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    p "Main Menu - #{address_book.entries.count} entries"
    p "1 - View all entries"
    p "2 - View entry number n"
    p "3 - Create an entry"
    p "4 - Search for an entry"
    p "5 - Import entries for a CSV"
    p "6 - Exit"
    print "Enter your selection: "

    selection = gets.to_i

    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        view_specific_entry
        main_menu
      when 3
        system "clear"
        create_entry
        main_menu
      when 4
        system "clear"
        search_entries
        main_menu
      when 5
        system "clear"
        read_csv
        main_menu
      when 6
        puts "Good-bye!"
        exit(0)
      else
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
    end
  end

  def view_all_entries
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      entry_submenu(entry)
    end

    system "clear"
    puts "End of entries"
  end

  def view_specific_entry
    entries_count = address_book.entries.count
    if entries_count == 0
      puts "Sorry, there are no entries to display. Please use menu 3 to create an entry"
      puts "======================="
      main_menu
    end
    puts "Enter entry number: "
    entry_number = gets.chomp.to_i
    puts "You entered: #{entry_number}"
    if (entry_number > 0 &&  entry_number <= entries_count)
      puts address_book.entries[entry_number - 1].to_s
      puts "======================="
    else
      puts "Sorry, #{entry_number} is not a valid entry"
      puts "There are #{entries_count} entries in database"
      view_specific_entry
    end
  end

  def create_entry
    system "clear"
    puts "New AddressBloc Entry"
    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp
    address_book.add_entry(name, phone, email)
    system "clear"
    puts "New entry created"
  end

  def search_entries
  end

  def read_csv
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit entry"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection
      when "n"
      when "d"
      when "e"
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
  end
end
