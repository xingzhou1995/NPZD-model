subroutine grazing(P,Z,G)
! this program is using to calculate grazing
implicit none
real(kind=8) :: P,Z,G
use bio_parameter

G=((lamda*P**2)/(u**2+P**2))*Z

end subroutine
