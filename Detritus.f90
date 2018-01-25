subroutine Detritus(P,Z,D,L,KD)


use bio_parameter
use bio_process
implicit none
real(kind=8) :: P,Z,D,L,KD
real(kind=8) :: G,I,RR


call grazing(P,Z,G)
call P_excretion(P,I)
call remineralization(D,RR)
!Consider mixing and sinking as a parameter
!KD=r*P+(1-alpha-beta)*G-(psi+phi+k)*D

!Without mixing
KD=I*P+(1-alpha-beta)*G*Z-RR*D

end subroutine
