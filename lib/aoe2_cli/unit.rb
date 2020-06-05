# frozen_string_literal: true

class Unit
    attr_reader :id, :name, :description, :expansion, :age
    @@all = []
    
    def initialize(id, name, description, expansion, age) 
        @id = id
        @name = name
        @description = description
        @expansion = expansion
        @age = age
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
        chosen_obj = @@all.select{|obj| obj.id == chosen_id}
        chosen_obj.more_info
    end

    def more_info(chosen_id)
        print "#{@id}. The #{@name} is available in the #{@expansion} expansion. #{description}.  Team Bonus: #{@team_bonus}. Civ Bonus #{@civ_bonus}."
    end
end