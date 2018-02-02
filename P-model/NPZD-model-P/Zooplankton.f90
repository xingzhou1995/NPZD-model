subroutine Zooplankton(P,Z,D,KZ)

use bio_parameter
use bio_process
implicit none
real(kind=8) :: P,Z,D,KZ
real(kind=8) :: GP,GD,ZM,ZR


call grazing(P,Z,D,GP,GD)
call Z_mortality(Z,ZM)
call Z_respiration(Z,ZR)
! ORIGIN
!KZ=alpha*GP*Z-GM*Z

!luo
KZ=GP*Z+GD*Z-ZR*Z-ZM*Z
write(*,*),"GP=",GP
write(*,*),"GD=",GD
write(*,*),"ZR=",ZR
write(*,*),"ZM=",ZM
end subroutine


