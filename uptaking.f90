subroutine uptaking(N,P,U)
! this program is used to calculating uptaking 

implicit none
real(kind=8) :: N,P,U
use bio_parameter

U=(N/(e+N))*((a*P)/(b+c*P))

end subroutine

