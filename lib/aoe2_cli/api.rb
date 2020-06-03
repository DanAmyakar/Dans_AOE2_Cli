# frozen_string_literal: true

class Api

    CIV_URL = "https://age-of-empires-2-api.herokuapp.com/api/v1/civilizations"
    
    #UNIT_URL = "https://age-of-empires-2-api.herokuapp.com/api/v1/units"
    #STRUC_URL = "https://age-of-empires-2-api.herokuapp.com/api/v1/structures"
    #TECH_URL = "https://age-of-empires-2-api.herokuapp.com/api/v1/technologies"

    def self.get_civs
        res = RestClient.get(CIV_URL)
        data = JSON.parse(res.body)
        data["civilizations"].each do |civ|
            id = civ["id"]
            name = civ["name"]
            expansion = civ["expansion"]
            army_type = civ["army_type"]
            team_bonus = civ["team_bonus"]
            civilization_bonus = civ["civilization_bonus"]
            Civilization.new(id, name, expansion, army_type, team_bonus, civilization_bonus)
        end

    end

    #def get_units
    #    res = RestClient.get("#{UNIT_URL}")
    #    data = JSON.parse(res.body)
    #end

    #def get_strucs
    #    res = RestClient.get("#{STRUC_URL}")
    #    data = JSON.parse(res.body)
    #end

    #def get_techs
    #    res = RestClient.get("#{TECH_URL}")
    #    data = JSON.parse(res.body)
    #end

end
