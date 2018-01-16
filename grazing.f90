subroutine grazing(P,Z,G)
! this program is using to calculate grazing
use bio_parameter
implicit none
real(kind=8) :: P,Z,G


G=((lamda*P**2)/(mu**2+P**2))*Z

end subroutine
