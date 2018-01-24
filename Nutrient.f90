Subroutine Nutrient(N,P,Z,D,KN)

use bio_parameter
use bio_process
implicit none
real(kind=8) :: N,P,Z,D,L,KN
real(kind=8) :: U,G,J,RR


call grazing(P,Z,G)
call uptaking(N,P,U,L)
call Z_excretion(Z,J)
call remineralization(D,RR)
!Consider Mixing as a parameter
!KN=-U+beta*G+gama*J*Z+R+k*(N0-N)

!Without Mixing
KN=-U*P+beta*G*Z+J*Z+RR*D

end subroutine


