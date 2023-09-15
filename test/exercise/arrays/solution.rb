module Exercise
  module Arrays
    class << self
      def replace(array)
        max_number = array.reduce { |x, n| x = n if n > x; x }
        array.map { |e| e.positive? ? max_number : e }
      end

      def search(array, query, low = 0, high = array.size - 1)
        return -1 if array.empty? || array_not_include_query?(array, query) || subarray_not_exist?(low, high)
        
        mid = (low + high) / 2
        
        return mid if query == array[mid]

        query < array[mid] ? search(array, query, low, mid - 1) : search(array, query, mid + 1, high)
      end

      private

      def array_not_include_query?(array, query)
        query < array[0] || query > array[-1]
      end

      def subarray_not_exist?(low, high)
        low > high
      end
    end
  end
end