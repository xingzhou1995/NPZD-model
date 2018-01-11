subroutine Phytoplankton(N,P,Z,KP)

implicit none
real(kind=8) :: N,P,Z,KP
real(kind=8) :: U,G
use bio_parameter

call subroutine uptaking(N,P,U)
call subroutine grazing(P,Z,G)

KP=U-r*P-G-(s+k)*P

end subroutine
