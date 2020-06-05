# frozen_string_literal: true

class Civilization
    attr_accessor :id, :name, :expansion, :army_type, :team_bonus, :civ_bonus
    @@all = []
    
    def initialize(id, name, expansion, army_type, team_bonus, civ_bonus)
        @id = id
        @name = name
        @expansion = expansion
        @army_type = army_type
        @team_bonus = team_bonus
        @civ_bonus = civ_bonus
        #@uniq_unit = uniq_unit
        #@uniq_tech = uniq_tech
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.list
        @@all.each do |obj|
            puts "#{obj.id}. #{obj.name}"
        end
    end

    def self.find_by_id(chosen_id)
        chosen_obj = @@all[(chosen_id - 1)]
        chosen_obj.more_info
    end

    def more_info
        print "#{@id}. The #{@name}'s have an army type of #{@army_type} and is available in the #{@expansion} expansion. Team Bonus: #{@team_bonus}. Civ Bonus #{@civ_bonus}."
    end
end
