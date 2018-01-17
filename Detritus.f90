subroutine Detritus(P,Z,D,KD)


use bio_parameter
use bio_process
implicit none
real(kind=8) :: P,Z,D,KD
real(kind=8) :: G


call grazing(P,Z,G)
!Consider mixing and sinking as a parameter
!KD=r*P+(1-alpha-beta)*G-(psi+phi+k)*D

!Without mixing
KD=r*P+(1-alpha-beta)*G-phi*D

end subroutine
