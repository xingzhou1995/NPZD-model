subroutine Detritus(P,Z,D,KD)


use bio_parameter
use bio_process
implicit none
real(kind=8) :: P,Z,D,KD
real(kind=8) :: GP,GD,PM,ZM,RR


call grazing(P,Z,D,GP,GD)
call P_mortality(P,PM)
call Z_mortality(Z,ZM)
call remineralization(D,RR)
!Consider mixing and sinking as a parameter
!KD=r*P+(1-alpha-beta)*GP*Z-(psi+phi+k)*D

!Without mixing
!KD=PM*P+(1-alpha-beta)*GP*Z-RR*D

!Luo option
KD=PM*P+ZM*Z-GD*Z-RR*D
end subroutine
