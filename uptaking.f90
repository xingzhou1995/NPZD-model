subroutine uptaking(N,P,U)
! this program is used to calculating uptaking 

use bio_parameter
implicit none
real(kind=8) :: N,P,U

U=(N/(e+N))*((a*P)/(b+c*P))

end subroutine

