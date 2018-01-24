subroutine Zooplankton(P,Z,KZ)

use bio_parameter
use bio_process
implicit none
real(kind=8) :: P,Z,KZ
real(kind=8) :: G,J


call grazing(P,Z,G)
call Z_excretion(Z,J)

KZ=alpha*G-J*Z

end subroutine


