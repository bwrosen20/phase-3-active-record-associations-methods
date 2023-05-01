require "pry"

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name
  end

  def drake_made_this
    # binding.pry
    #first checking to see if artist clas is nil
    #Because we need the artist class to run find_or_create_by
    if self.artist==nil
      #to check if we already have an instance of Drake
      is_drake=Artist.find_by_name("Drake")
      if is_drake
        self.artist=is_drake
      else
        drake=Artist.create(name:"Drake")
        self.artist=drake
      end
    end
  end
end