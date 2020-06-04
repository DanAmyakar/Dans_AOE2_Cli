# frozen_string_literal: true

class Cli

    # Method to greet user
    def header
        puts "Welcome to the Age of Empires 2 Cli!"
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
    def leave_request(input)
        if input == "leave"
            puts "Goodbye!!"
            exit
        end
    end

    # Returns to the main menu when the user inputs back from a submenu
    def main_menu_request?(input)
        main if input == "back"
    end

    # Checks the user input for a valid response from the main menu
    def main_valid_input?(input)
        if !(input == "leave" || input == "civs" || input == "units" || input == "strucs" || input == "techs")
            puts "That is not a valid response. Please try again."
            main
        end
    end

    # Checks the user input for a valid response from a submenu
    def sub_valid_input(input)
        if (input < 1 || input > selected_class.all.size || input != "back")
            puts "That is not a valid response. Please try again."
            submenu
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

    # Selects the class and gets teh list
    def get_or_create_list
        selected_class = Civilization if @input == "civs"
        selected_class = Unit if @input == "units"
        selected_class = Structure if @input == "strucs"
        selected_class = Technology if @input == "techs"
        selected_class.fill_with_api if selected_class.all == nil
        selected_class.list
    end

    # Gets the item deatils
    def more_info(obj_id)
        selected_class.more_info(obj_id)
    end


    # Main program script
    def main
        main_options
        footer_one
        @input = ""
        @input = gets.chomp
        main_valid_input?(@input)
        leave_request(@input)
        submenu
    end

    def get_info_from_id
        # some methods that call the class, sorts though the list and returns more info.
    end

    def sub_options
        puts "For more info, type an ID#."
        puts "To go back to the main manu, type 'back'."
    end

    def submenu
        get_or_create_list
        sub_options
        @input = ""
        @input = gets.strip
        sub_valid_input?(@input)
        main_menu_request?(@input)
        get_info_from_id(@input)
    end

    # Opening method?? need to ask michael about the 'bin/run' file
    def run
        header
        main
    end

end
