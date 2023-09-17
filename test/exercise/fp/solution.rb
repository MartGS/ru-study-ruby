module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        @count_film = 0
        @total_raiting = 0

        array.map do |film|
          calculating_values_for_result(film) if is_film_match_search_criteria?(film)
        end

        result = @total_raiting / @count_film
      end
      
      def chars_count(films, threshold)
        @count_letter_i = 0

        films.map do |film|
          count_letter_i(film) if is_film_match_raiting_value?(film, threshold)
        end

        @count_letter_i
      end

      private

      def count_letter_i(film)
        @count_letter_i += film["name"].count "и"
      end

      def is_film_match_raiting_value?(film, threshold)
        film["rating_kinopoisk"].to_f >= threshold
      end

      def calculating_values_for_result(film)
        @total_raiting += film["rating_kinopoisk"].to_f
        @count_film += 1
      end

      def is_film_match_search_criteria?(film)
        is_multiple_countries?(film)
      end

      def is_multiple_countries?(film)
        film["country"].present? && film["country"].split(',').size > 1 ? is_rating_kinopoisk?(film) : false
      end

      def is_rating_kinopoisk?(film)
        film["rating_kinopoisk"].present? && film["rating_kinopoisk"].to_f > 0 ? true : false
      end
    end
  end
end