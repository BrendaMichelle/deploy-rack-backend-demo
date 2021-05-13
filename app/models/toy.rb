class Toy < ActiveRecord::Base
    # has_many :PLURALWORD -> []
    has_many :leases
    has_many :cars, through: :leases

    def professor_name
        # self -> instance
        "Professor #{self.name()}"
    end

    def dr_name
        "Dr. #{self.name}"
    end

    def consistent_data
        self.to_json({
            include: {
            leases: {
                include: :car
            }
            }, 
            methods: [:professor_name, :dr_name]
        })
    end


    def self.increasing_likes
        Toy.all.order(:likes)
    end
end