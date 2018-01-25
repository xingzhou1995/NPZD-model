subroutine Zooplankton(P,Z,L,KZ)

use bio_parameter
use bio_process
implicit none
real(kind=8) :: P,Z,L,KZ
real(kind=8) :: G,J


call grazing(P,Z,G)
call Z_excretion(Z,J)

KZ=alpha*G*Z-J*Z

end subroutine


