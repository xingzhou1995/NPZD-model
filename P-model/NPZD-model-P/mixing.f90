program mixing
implicit none
integer :: i,j
integer :: n
real :: dh,dt,A,S
real(kind=8),allocatable ::  BELOW(:)
real(kind=8),allocatable ::  MAIN(:)
real(kind=8),allocatable ::  ABOVE(:)
real(kind=8),allocatable ::  N1(:)
real(kind=8),allocatable ::  N2(:)
!intial value
n=20

allocate(N1(n))
allocate(N2(n))
allocate(BELOW(n))
allocate(MAIN(n))
allocate(ABOVE(n))

do i=1,n

N1(i)=21-i

end do

write(*,*) N1

dh = 1 !space step
dt = 1 !time step
A  = 2 ! diffuse coefficient
S  = A*((dt)/(dh*dh))

BELOW(1)= 0
BELOW(n)= (-1)*S
ABOVE(1) = (-1)*S
!ABOVE(1) = S
ABOVE(n) = 0
MAIN(1) = 1+S
MAIN(n) = 1+S 
!MAIN(1)=1-S



do i=2,n-1
BELOW(i) = (-1)*S
MAIN(i)  = 1+2*S
ABOVE(i) = (-1)*S 
end do

!write(*,*) BELOW
!write(*,*) MAIN
!write(*,*) ABOVE

do i=1,100
call solve_tradiag(BELOW,MAIN,ABOVE,N1,N2,n)

  do j=1,n
  N1(j)=N2(j)
  end do
  write(*,*) i,N1
end do

!write(*,*) N2

end

 

subroutine solve_tradiag(a,bb,c,d,x,n)
implicit none
! a - sub-diagonal below the main diagonal
! b - the main diagonal
! c - suo-diagonal
! d - right part
! x - the answer
! n -number of equations

integer :: n
real(kind=8),dimension(n) :: a,b,c,d,bb
real(kind=8),dimension(n) :: x
!real(kind=8),dimension(n) :: cp,dp
!real(8) :: m
integer i

do i=1,n
b(i)=bb(i)
end do




!write(*,*) "BELOW=",a
!write(*,*) "MAIN=",b
!write(*,*) "ABOVE=", c
!write(*,*) "N1=",d






! initialize c-prime and d-prime
!cp(1) = c(1)/b(1)
!dp(1) = d(1)/b(1)
! solve vectors c-prime and d-prime
do i=2,n
 !write(*,*) "b(i)=",b(i)
 !write(*,*) "a(i)=",a(i)
 !write(*,*) "c(i-1)=",c(i-1)
 !write(*,*) "d(i)=",d(i-1),d(i)
 b(i)=b(i)-((a(i)/b(i-1))*c(i-1))
 d(i)=d(i)-((a(i)/b(i-1))*d(i-1))
  
!write(*,*) "i=",i,"b=",b(i)
!write(*,*) "i=",i,"d=",d(i)
end do


!do i= 2,n
! m=b(i)-cp(i-1)*a(i)
! cp(i)=c(i)/m
! dp(i)=(d(i)-dp(i-1)*a(i))/m
!end do

!intialize x
x(n)=d(n)/b(n)

!write(*,*) x(n)

!solve for x from the vectors c-prime and d-prime

do i=n-1,1,-1
   x(i)=(d(i)-(c(i)*x(i+1)))/b(i)


! do i = n-1,1,-1
! x(i)=dp(i)-cp(i)*x(i+1)
 end do

!write(*,*) x

end subroutine solve_tradiag



