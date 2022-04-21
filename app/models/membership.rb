class Membership < ApplicationRecord
    belongs_to :gym 
    belongs_to :client 

    validates :gym_id, presence: true
    validates :client_id, presence: true
    validates :charge, presence: true 

    # a client can only have one memebership with each gym 

    validate :only_one_membership 

    def only_one_membership

        gym = Gym.find_by(id: gym_id)
        client = Client.find_by(id: client_id)
        if gym.clients.include?(client)
            errors.add(:title, "Already a member!" )
        end 
    end 

end
