Subroutine Nutrient(N,P,Z,D,KN)

use bio_parameter
use bio_process
implicit none
real(kind=8)::N,P,Z,D,L,KN
real(kind=8)::U,G


call grazing(P,Z,G)
call uptaking(N,P,U,L)

!Consider Mixing as a parameter
!KN=-U+beta*G+gama*dd*Z**2+phi*D+k*(N0-N)

!Without Mixing
KN=-U+beta*G+dd*Z**2+phi*D

end subroutine


