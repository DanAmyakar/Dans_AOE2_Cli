# frozen_string_literal: true

class Cli

    def call
        puts "Welcome to the Age of Empires 2 Cli!"
        Api.get_civs
        face
    end

    def face
        input_one = ""
        while input_one != "leave"
            puts "To list all civilizations, type 'civs'."
            puts "To list all units, type 'units'."
            puts "To list all structures, type 'strucs'."
            puts "To list all technologies, type 'techs'."
            puts "To exit, type 'leave'."

            input_one = gets.strip
            first_valid_input?(input_one)

            case input_one
            when 'civs'
                list_civs
                select_option_civs
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

    def list_civs
        Civilization.all.each{|civ| puts "#{civ.id}. #{civ.name}"}
    end

    def select_option_civs
        input_two = ""
        while input_two != "back"
            puts "For more information about a particular civ, type its ID#."
            puts "To go back to the main menu, type 'back'."
            
            input_two = gets.strip.to_i
            second_valid_input?(input_two)
            
            case input_two
            when (second_valid_input? == true)
                Civilization.find_by_id(input_two).more_info
            end
        end
    end

    def list_units
        puts 'this option is temporarly unavailable.'
    end

    def list_strucs
        puts 'this option is temporarly unavailable.'
    end

    def list_techs
        puts 'this option is temporarly unavailable.'
    end

    def first_valid_input?(input_one)
        if input_one == "civs"
            true
        elsif input_one == "units"
            true
        elsif input_one == "strucs"
            true
        elsif input_one == "tech"
            true
        else
            false
            puts "That is an invalid response. Please try again."
        end
    end

    def second_valid_input?(input_two)
        if (input_two < 1 || input_two > (Civilization.all.size))
            puts "That is an invalid response. Please try again."
        end
    end
end
