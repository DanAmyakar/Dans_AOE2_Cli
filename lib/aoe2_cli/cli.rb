# frozen_string_literal: true

class Cli

    def initialize(path)
        new_importer = Api.new(path)
        new_importer.import
    end

    def call
        input = ""
        while input != "leave"
            puts "Welcome to the Age of Empires 2 Cli!"
            puts "To list all civilizations, type 'civs'."
            puts "To list all units, type 'units'."
            puts "To list all structures, type 'strucs'."
            puts "To list all technologies, type 'techs'."
            puts "To exit, type 'leave'."

            input = gets.strip

            case input
            when 'civs'
                list_civs
            when 'units'
                list_units
            when 'strucs'
                list_strucs
            when 'tech'
                list_techs
            end
        end
    end

    def list_civs
        puts 'this option is temporarly unavailable.'
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

end
