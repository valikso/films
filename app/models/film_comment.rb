class FilmComment < ApplicationRecord
  belongs_to :film, optional: true

end
