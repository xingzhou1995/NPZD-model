subroutine Phytoplankton(N,P,Z,KP)


use bio_parameter
implicit none
real(kind=8) :: N,P,Z,KP
real(kind=8) :: U,G


call uptaking(N,P,U)
call grazing(P,Z,G)

KP=U-r*P-G-(s+k)*P

end subroutine
