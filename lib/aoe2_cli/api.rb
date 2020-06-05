# frozen_string_literal: true

class Api

    # The four urls to get all the data from the same ipa
    CIV_URL = "https://age-of-empires-2-api.herokuapp.com/api/v1/civilizations"    
    UNIT_URL = "https://age-of-empires-2-api.herokuapp.com/api/v1/units"
    STRUC_URL = "https://age-of-empires-2-api.herokuapp.com/api/v1/structures"
    TECH_URL = "https://age-of-empires-2-api.herokuapp.com/api/v1/technologies"


    # This method grabs all of the civ info
    def self.get_civs
        res = RestClient.get(CIV_URL)
        data = JSON.parse(res.body)
        data["civilizations"].each do |obj|
            #binding.pry
            id = obj["id"]
            name = obj["name"]
            expansion = obj["expansion"]
            army_type = obj["army_type"]
            team_bonus = obj["team_bonus"]
            civ_bonus = obj["civilization_bonus"]
            #uniq_unit = obj["unique_unit"]
            #uniq_tech = obj["unique_tech"]
            Civilization.new(id, name, expansion, army_type, team_bonus, civ_bonus)
        end
    end

    # This method gets all of the unit info
    def self.get_units
        res = RestClient.get("#{UNIT_URL}")
        data = JSON.parse(res.body)
        data["units"].each do |obj|
            #binding.pry
            id = obj["id"]
            name = obj["name"]
            description = obj["description"]
            expansion = obj["expansion"]
            age = obj["age"]
            #created_in = obj["created_in"]
            Unit.new(id, name, description, expansion, age)
        end
    end

    # This method gets all of the structure info
    def self.get_strucs
        res = RestClient.get("#{STRUC_URL}")
        data = JSON.parse(res.body)
        data["structures"].each do |obj|
            #binding.pry
            id = obj["id"]
            name = obj["name"]
            description = obj["description"]
            expansion = obj["expansion"]
            age = obj["age"]
            #created_in = obj["created_in"]
            Structure.new(id, name, description, expansion, age)
        end
    end

    # This method gets all of the technology info
    def self.get_techs
        res = RestClient.get("#{TECH_URL}")
        data = JSON.parse(res.body)
        data["technologies"].each do |obj|
            #binding.pry
            id = obj["id"]
            name = obj["name"]
            description = obj["description"]
            expansion = obj["expansion"]
            age = obj["age"]
            #develops_in
            Technology.new(id, name, description, expansion, age)
        end
    end

    def self.get_all_info
        get_civs
        get_units
        get_strucs
        get_techs
    end
end
