# frozen_string_literal: true

class Cli

    # Method to greet user
    def header
        puts "Welcome to the Age of Empires 2 Cli!"
        Api.get_all_info
    end
    
    # A footer message for the main menu
    def footer_one
        puts "To end this program, type 'leave'."
    end

    # A footer for sub menus to go back to the main menu
    def footer_two
        puts "To go back to the main menu, enter 'back'."
    end

    # checks the user input to see if they want to leave

    # Returns to the main menu when the user inputs back from a submenu
    def main_menu_request?(input)
        main if input == "back"
    end

    # Checks the user input for a valid response from the main menu
    def valid_input?(input)
        # checks to see if a user wants to quit the program
        if input == "leave"
            puts "Goodbye!!"
            exit
        # Brings a user back to the main menu
        elsif input == "back"
            self.main
        # When user selects subject, gets the subject list 
        elsif input == "civs"
            Civilization.list
            s = Civilization
            self.submenu(s)
        elsif input == "units"
            Unit.list
            s = Unit
            self.submenu(s)
        elsif input == "strucs"
            Structure.list
            s = Structure
            self.submenu(s)
        elsif input == "techs"
            Technology.list
            s = Technology
            self.submenu(s)
        # Throws an message for a non compliant input    
        else
            puts "That is not a valid response. Please try again."
            main
        end
    end

    # Checks the user input for a valid response from a submenu
    def sub_valid_input?(s, input)
        #binding.pry
        if (input.to_i > 0 && input.to_i < (s.all.size + 1))
            s.find_by_id(input.to_i)
            submenu(s)
        elsif input == "back"
            self.main
        else
            puts "That is not a valid response. Please try again."
            submenu(s)
        end
    end

    # Displays the main menu options
    def main_options
        puts "Main menu:"
        puts "To list all civilizations, type 'civs'."
        puts "To list all units, type 'units'."
        puts "To list all structures, type 'strucs'."
        puts "To list all technologies, type 'techs'."
    end   

    # Displays the sub menu options
    def sub_options
        puts "For more info, type an ID#."
    end

    # Main program script
    def main
        main_options
        footer_one
        input = ""
        input = gets.strip
        valid_input?(input)
    end

    # Sub menu script
    def submenu(s)
        sub_options
        footer_two
        input = ""
        input = gets.strip
        sub_valid_input?(s, input)
    end

    # Opening method?? need to ask michael about the 'bin/run' file
    def run
        header
        main
    end

end
