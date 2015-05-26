require 'json'
require 'date'
require 'time'

### the class Restaurant is something that we can use throughout our code

class Restaurant
	### attr_reader is when we create instance variables to allow us to use that data throughout
	attr_reader :id, :name, :address, :website, :hours, :prices, :cuisines, :ratings

	### initialize is the data that we will use when creating a new class
	### in this case it is the Restaurant class. The objects denoted by the '@' 
	### will always be associated with our restaurant class.
	def initialize(id, name, address, website, hours, prices, cuisines, ratings) ### this line is the method and the arguments that we call with our method
		@id = id   ### the object @id is the instance of id
		@name = name
		@address = address
		@website = website
		@hours = hours
		@prices = prices
		@cuisines = cuisines
		@ratings = ratings
	end


	#### METHODS
	##################################################################################################
	### def to_s just puts things that needs to be strings print out as strings and not random stuff
		
	### the self.all means anytime we call Restaurant.all we will get all of the restaurants information. We can then manipulate it down further
	def self.all

    info = JSON.parse(File.read "restaurants.json")
    restaurants = info.map do |r|
      Restaurant.new(r["id"], r["name"], r["address"], r["website"], 
        r["hours"], r["price"], r["cuisines"], r["ratings"])

     end
  end

    #Class Methods
  def self.cuisine(cuisine_type)
    self.all.select{|r| r.is_cuisine cuisine_type}
  end

  def self.number_reviews(number)
    self.all.select{|r| r.number_reviews number}
  end

  def self.highest_average_review
    self.all.max_by{|r| r.average_review}
  end

  def self.cheap
    self.all.select{|r| r.cheap?}
  end

  def self.sorted_by_number_reviews
    self.all.sort_by{|r| r.ratings.size}.reverse
  end

  def self.sorted_by_average_reviews
    self.all.sort_by{|r| r.average_review}.reverse
  end

  def self.cuisine_types

    Restaurant.all.map {|r| r.cuisines}.flatten.uniq

  end

  #### INSTANCE METHODS
  ###################################
  def to_s
    "#{name}"
  end

  def number_reviews n
    ratings.length == n
  end

  def average_review
    rat = 0.0
    ratings.each {|n| rat += n.to_f}
    rat/ratings.length.to_f
  end

  def cheap?
    prices.max <= 10
  end

  def price_range
    "$#{prices[0]} - $#{prices[1]}"
  end

  def cuisine_types
    cuisines.join(", ")
  end

  def is_cuisine cuisine_type
    cuisines.include? cuisine_types
  end

  def hours_day day
    "#{hours[day]["Open"]} - #{hours[day]["Closed"]}"
  end

  def hours_today
  	days = [nil, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'] #### assigning an array to the variable days
  	### so it can be accessed later and be used for our day of the week

  	days_in_int = Date.today.cwday ### assigning the Date class with methods of today and current weekday
  	day_of_week = days[days_in_int] ###taking that days_in_int variable and assigning the days array to it
  	todays_hours = hours[day_of_week] ### variable todays_hours will now hold the hours for each day with a numeric day and week

  	### hours[days[Date.today.cwday]] 
  end

  def open_now?
  	hours = hours_today

  	if hours["Open"] == "CLOSED" || hours["Closed"] == "CLOSED"
  		return "Closed"
  	end

  	
  	open = Time.parse(hours["Open"])
  	closed = Time.parse(hours["Closed"])

		if open > closed
			closed = closed + (60 * 60 * 24)
		end	

  	if Time.now > open && Time.now < closed
  		 "Open until #{hours["Closed"]}"  
  	else
  		"Closed"
  	end

  end


end




