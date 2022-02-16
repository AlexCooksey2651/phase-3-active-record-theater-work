class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        actors = []
        self.auditions.each do |audition|
            actors << audition.actor
        end
        actors
    end

    def locations
        locations = []
        self.auditions.each do |audition|
            locations << audition.location
        end
        locations
    end

    def lead
        lead = self.auditions.find_by(hired: true)
        if lead = nil
            'no actor has been hired for this role'
        else
            lead
        end
    end

    def understudy
        understudy = self.auditions.where(hired: true).second
    end
end