class Ride < ActiveRecord::Base

  belongs_to :attraction
  belongs_to :user

  def take_ride
    if !enough_tickets && tall_enough
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !tall_enough && enough_tickets
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif !tall_enough && !enough_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    else
     current_tickets = user.tickets - attraction.tickets
     current_nausea = user.nausea + attraction.nausea_rating
     current_happiness = user.happiness + attraction.happiness_rating

     user.update(tickets: current_tickets, nausea: current_nausea, happiness: current_happiness)
     "Thanks for riding the #{attraction.name}!"
   end
  end



    def tall_enough
      if user.height >= attraction.min_height
        true
      end
    end

    def enough_tickets
      if user.tickets >= attraction.tickets
        true
      end
    end

    def allowed_to_ride
      if is_tall_enough && has_enough_tickets
        true
      end
    end
end
