subroutine Zooplankton(P,Z,KZ)

use bio_parameter
implicit none
real(kind=8) :: P,Z,KZ
real(kind=8) :: G


call grazing(P,Z,G)

KZ=alpha*G-dd*Z**2

end subroutine


