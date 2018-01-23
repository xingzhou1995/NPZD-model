subroutine Phytoplankton(N,P,Z,KP)


use bio_parameter
use bio_process
implicit none
real(kind=8) :: N,P,Z,L,KP
real(kind=8) :: U,G


call uptaking(N,P,U,L)
call grazing(P,Z,G)

!Consider mixng and sinking as a parameter
!KP=U-r*P-G-(s+k)*P

!Without Mixing and sinking
KP=U*P-r*P-G

end subroutine
