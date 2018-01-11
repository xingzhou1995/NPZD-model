subroutine Zooplankton(P,Z,KZ)

implicit none
real(kind=8) :: P,Z,KZ
real(kind=8) :: G
use bio_parameter

call subroutine(P,Z,G)

KZ=alpha*G-d*Z**2

end subroutine


