def bubble_sort(arr)

(arr.length() - 1).downto(0).each do |y|
  for x in 0..y-1
    if(arr[x] > arr[x+1] )
      temp = arr[x]
      arr[x] = arr[x+1]
      arr[x+1] = temp 
    end
  end
end

  arr
end

p bubble_sort([4,3,78,2,0,2])