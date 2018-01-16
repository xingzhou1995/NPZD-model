subroutine Detritus(P,Z,D,KD)


use bio_parameter
implicit none
real(kind=8) :: P,Z,D,KD
real(kind=8) :: G


call grazing(P,Z,G)

KD=r*P+(1-alpha-beta)*G-(psi+phi+k)*D

end subroutine
