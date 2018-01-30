subroutine Phytoplankton(N,P,Z,D,KP)


use bio_parameter
use bio_process
implicit none
real(kind=8) :: N,P,Z,D,KP
real(kind=8) :: U,GP,GD,PM,PR


call uptaking(N,P,U)
call grazing(P,Z,D,GP,GD)
call P_mortality(P,PM)
call P_respiration(P,PR)
!Consider mixng and sinking as a parameter
!KP=U-PM*P-GP-(s+k)*P


!Without Mixing and sinking
!KP=U*P-PM*P-GP*Z

!Adding respiration (luo option)
KP=U*P-PR*P-PM*P-GP*P


!write(*,*) "U=",U
!write(*,*) "I=",I


end subroutine
