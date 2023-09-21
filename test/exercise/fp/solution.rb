module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        values_to_calculate = {}
        values_to_calculate[:sum] = 0
        values_to_calculate[:number_of_films] = 0
        
        array = array.reduce([]) do |intermediate_array, film|
          intermediate_array << film if film["country"].present? && film["country"].split(',').size > 1
          intermediate_array.reduce([]) do |final_array, film|
            final_array << film unless film["rating_kinopoisk"].nil? || film["rating_kinopoisk"] == 0
            final_array
          end
        end

        array.each do |film|
          calculations(film, values_to_calculate)
        end

        result_for_method_rating(values_to_calculate)
      end
      
      def chars_count(films, threshold)
        hash_for_letter = {}
        hash_for_letter[:i] = 0

        films = films.reduce([]) do |new_array, film|
          new_array << film if film["rating_kinopoisk"].to_f >= threshold
          new_array
        end

        films.map { |film| film["name"].each_char { |letter| letter == 'и' ? calculate_i(hash_for_letter) : next } }

        result = hash_for_letter[:i]
      end

      private

      def calculations(film, values_to_calculate)
        values_to_calculate[:sum] += film["rating_kinopoisk"].to_f
        values_to_calculate[:number_of_films] += 1
      end

      def result_for_method_rating(values_to_calculate)
        result = values_to_calculate[:sum] / values_to_calculate[:number_of_films]
      end

      def calculate_i(hash_for_letter)
        hash_for_letter[:i] += 1
      end
    end
  end
end