# frozen_string_literal: true

class Api

    CIV_URL = "https://age-of-empires-2-api.herokuapp.com/api/v1/civilizations"
    
    UNIT_URL = "https://age-of-empires-2-api.herokuapp.com/api/v1/units"
    STRUC_URL = "https://age-of-empires-2-api.herokuapp.com/api/v1/structures"
    TECH_URL = "https://age-of-empires-2-api.herokuapp.com/api/v1/technologies"


    # This method grabs all of the civ info
    def self.get_civs
        res = RestClient.get(CIV_URL)
        data = JSON.parse(res.body)
        data["civilizations"].each do |attrs|
            Civilization.new(attrs)
        end

    end

    # This method gets all of the uit info
    def self.get_units
        res = RestClient.get("#{UNIT_URL}")
        data = JSON.parse(res.body)
        data["units"].each do |unit|
            id = unit["id"]
            name = unit["name"]
            Unit.new(id, name)
        end
    end

    # This method gets all of the structure info
    def self.get_strucs
        res = RestClient.get("#{STRUC_URL}")
        data = JSON.parse(res.body)
        data["structures"].each do |struc|
            id = struc["id"]
            name = struc["name"]
            Structure.new(id, name)
        end
    end

    # This method gets all of the technology info
    def self.get_techs
        res = RestClient.get("#{TECH_URL}")
        data = JSON.parse(res.body)
        data["technologies"].each do |tech|
            id = tech["id"]
            name = tech["name"]
            Tech.new(id, name)
        end
    end

end
