# frozen_string_literal: true

class Technology

    def self.fill_with_api
        Api.get_tech
    end

    attr_reader :id, :name, :expansion, :army_type, :team_bonus, :civ_bonus
    @@all = []
    
    def initialize(attrs) 
        attrs.each {|attr_key, attr_val| self.send(("#{attr_key}="), attr_val)}
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def find_by_id(chosen_id)
        chosen_civ = @@all.select{|civ| civ.id == chosen_id}
    end

    def more_info(chosen_id)
        find_by_id(chosen_id)
        print "#{@id}. The #{@name}'s have an army type of #{@army_type} and is available in the #{@expansion} expansion.  Team Bonus: #{@team_bonus}. Civ Bonus #{@civ_bonus}."
    end
end
