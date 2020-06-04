# frozen_string_literal: true

class Cli

    def call
        puts "Welcome to the Age of Empires 2 Cli!"
        Api.get_civs
        face
    end

    def face
        input = ""
        while input != "leave"
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

    def civ_sub_menu
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
