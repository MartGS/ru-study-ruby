module Exercise
  module Arrays
    class << self
      def replace(array)
        max_number = array.reduce { |x, n| x = n if n > x; x }
        array.map { |e| e.positive? ? max_number : e }
      end

      def search(array, query, low = 0, high = array.size - 1)
        return -1 if !array.include?(query)
        
        mid = (low + high) / 2
        
        query == array[mid] ? mid : query < array[mid] ? search(array, query, low, mid - 1) : search(array, query, mid + 1, high)
      end
    end
  end
end
