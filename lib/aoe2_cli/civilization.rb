# frozen_string_literal: true


class Civilization

    attr_accessor :id, :name, :expansion, :army_type, :team_bonus, :civ_bonus
    @@all = []
    
    def initialize(id, name, expansion, army_type, team_bonus, civilization_bonus)
        @id = id
        @name = name
        @expansion = expansion
        @army_type = army_type
        @team_bonus = team_bonus
        @civ_bonus = civilization_bonus
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def more_info
        puts "#{@id}. The #{@name}'s have an army type of #{@army_type} and is available in the #{@expansion}.  Team Bonus: #{@team_bonus}. Civ Bonus #{@civ_bonus}."
    end

    def self.find_by_id(input)
        select_civ = nil
        select_civ = self.all.select{|civ| civ.id == input}
        select_civ.more_info
    end
end
