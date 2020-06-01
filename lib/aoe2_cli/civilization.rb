# frozen_string_literal: true


class Civilization

    attr_accessor :expansion, :army_type
    attr_reader :id, :name, :unique_unit, :unique_tech, :team_bonus
    @@all = []
    
    def initialize(id, name)
        binding.pry
        @id = id
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

end
