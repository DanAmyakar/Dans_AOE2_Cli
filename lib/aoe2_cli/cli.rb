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
    def main_menu_request(input)
        main if input == "back"

    # Checks the user input for a valid response from the main menu
    def main_valid_input?(input)
        if !(input == "leave" || input == "civs" || input == "units" || input == "strucs" || input == "tech")
            puts "That is not a valid response. Please try again."
        end
    end

    # Checks the user input for a valid response from a submenu
    def sub_valid_input(input)
        if (input < 1 || input > selected_class.all.size || input != "back")
            puts "That is not a valid response. Please try again."
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

    def main
        main_options
        footer_one
        main_input = gets.stip
        main_valid_input?(main_input)
        leave_request(main_input)
    end

    def submenu
        get_list
        

    # Opening method?? need to ask michael about the 'bin/run' file
    def run
        header
        main
    end





        Api.get_civs
        face
    end

    def face
        input = ""
        while input != "leave"
            puts "Main menu:"
            puts "To list all civilizations, type 'civs'."
            puts "To list all units, type 'units'."
            puts "To list all structures, type 'strucs'."
            puts "To list all technologies, type 'techs'."
            puts "To exit, type 'leave'."

            input = gets.strip
            first_valid_input?(input)

            case input
            when 'civs'
                civ_sub_menu
            when 'units'
                list_units
            when 'strucs'
                list_strucs
            when 'tech'
                list_techs
            end
        end
        puts "Goodbye."
    end

    # If civ is selected from main menu...
    def civ_sub_menu
        puts "Civ selector menu:"
        list_civs
        puts "For more information about a particular civ, type its ID#."
        puts "To go back to the main menu, type 'back'."
            
        civ_id = ""
        civ_id = gets.strip.to_i
        second_valid_input?(civ_id)
        Api.civ_more_info(civ_id)
    end

    # The following methods get the full list of id's and names of a class
    # Could probably clean this up with a single method
    def list_civs
        Civilization.all.each{|civ| puts "#{civ.id}. #{civ.name}"}
    end

    def list_units
        Unit.all.each{|unit| puts "#{unit.id}. #{unit.name}"}
    end

    def list_strucs
        Structure.all.each{|struc| puts "#{struc.id}. #{struc.name}"}
    end

    def list_techs
        Technology.all.each{|tech| puts "#{tech.id}. #{tech.name}"}
    end

    # The following methods check for a valid input
    # This one checks the first input
    def first_valid_input?(input)
        if input == "civs"
            true
        elsif input == "units"
            true
        elsif input == "strucs"
            true
        elsif input == "tech"
            true
        else
            false
            puts "That is an invalid response. Please try again."
        end
    end

    # This one checks if a civ id was selected (1-18)
    def second_valid_input?(input)
        if (input >= 1 || input <= (Civilization.all.size))
            true
        else
            false
            puts "That is an invalid response. Please try again."
        end
    end

end
