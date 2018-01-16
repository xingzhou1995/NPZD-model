Subroutine Nutrient(N,P,Z,D,KN)

use bio_parameter
implicit none
real(kind=8)::N,P,Z,D,KN
real(kind=8)::U,G


call grazing(P,Z,G)
call uptaking(N,P,U)

KN=-U+beta*G+gama*dd*Z**2+phi*D+k*(N0-N)

end subroutine


