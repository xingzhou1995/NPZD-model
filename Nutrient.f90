Subroutine Nutrient(N,P,Z,D,KN)

implicit none
real(kind=8)::N,P,Z,D,KN
real(kind=8)::U,G
use bio_parameter

call subroutine grazing(P,Z,G)
call subroutine uptaking(N,P,U)

KN=-U+beta*G+gama*d*Z**2+phi*D+k*(N0-N)

end subroutine


