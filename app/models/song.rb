class Song < ActiveRecord::Base
  # add associations here

  belongs_to :artist 
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    
  end

  def artist_name
    self.artist.name if self.artist !=nil
  end

  def genre_name=(name)

    self.genre = Genre.find_or_create_by(name: name)

  end

  def genre_name

    self.genre.name if self.genre !=nil 

  end

  def note_contents=(note_contents)

    note_contents.each do |content|
  
     unless content.empty? 
      self.notes << Note.create(content: content)
      self.save 
     end
    end 
  end


  def note_contents

  self.notes.map {|note| note.content }

  end 



end
