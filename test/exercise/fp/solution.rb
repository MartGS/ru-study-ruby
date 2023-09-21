module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_array = array.map do |film|
          film["rating_kinopoisk"].to_f if is_film_match_search_criteria?(film)
        end
        
        filtered_array.compact!
        total_raiting = filtered_array.inject(0, :+)

        p result = total_raiting / filtered_array.size
      end
      
      def chars_count(films, threshold)
        total_letter_i = films.reduce(0) do |acc, film|
          acc += film["name"].count "и" if is_film_match_raiting_value?(film, threshold)
          acc
        end

        p total_letter_i
      end

      private

      def is_film_match_raiting_value?(film, threshold)
        film["rating_kinopoisk"].to_f >= threshold
      end

      def is_film_match_search_criteria?(film)
        film["country"].present? && film["country"].split(',').size > 1 && film["rating_kinopoisk"].present? && film["rating_kinopoisk"].to_f > 0
      end
    end
  end
end