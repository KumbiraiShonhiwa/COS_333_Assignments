subroutine readData(arr)
    integer, dimension(5) :: arr
    integer :: i
  
    write(*,*) "Enter 5 integer values:"
    do i = 1, 5
      read(*,*) arr(i)
    end do
    write(*,*) arr(i)
    do i = 1,5
      write(*,*) arr(i)
      end do
  
  end subroutine readData
  
  real function findSmallest(arr) 
      integer, dimension(5)::arr
      integer :: smallest
      
      smallest = arr(1)
      do i = 2,5
          smallest = min(smallest,arr(i))
          end do
    findSmallest = smallest
  end function findSmallest
  
  real function findLargest(arr) 
      integer, dimension(5)::arr
      integer :: largest
      
      largest = arr(1)
      do i = 2,5
          largest = max(largest,arr(i))
          end do
    findLargest = largest
  end function findLargest
  
  integer function mode(arr)
    integer, dimension(5) :: arr
    integer :: i, count, maxCount, modeValue
  
    maxCount = 0
  
    do i = 1, 5
      count = 0
      do j = i, 5
        if (arr(i) .eq. arr(j)) count = count + 1
      end do
      if (count > maxCount) then
        maxCount = count
        modeValue = arr(i)
      end if
    end do
  
    mode = modeValue
  
  end function mode
  program statistics
    integer, dimension(5) :: data
    
    call readData(data)
    smallestValue = findSmallest(data)
    largestValue = findLargest(data)
    modeValue = mode(data)
    write(*,*) "Smallest Value:",smallestValue
    write(*,*) "Largest Value:",largestValue
    write(*,*) "Mode Value", modeValue
  end program statistics
  