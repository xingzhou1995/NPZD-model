Subroutine Nutrient(N,P,Z,D,KN)

use bio_parameter
use bio_process
implicit none
real(kind=8) :: N,P,Z,D,KN
real(kind=8) :: U,GP,GD,ZM,RR,PR,ZR




call grazing(P,Z,D,GP,GD)
call uptaking(N,P,U)
call Z_mortality(Z,ZM)
call remineralization(D,RR)
call P_respiration(P,PR)
call Z_respiration(Z,ZR)
!Consider Mixing as a parameter
!KN=-U+beta*GP+gama*ZM*Z+R+k*(N0-N)

!Without Mixing
!KN=-U*P+beta*GP*Z+ZM*Z+RR*D

!Adding respiration
KN=-U*P+ZR*Z+PR*P+RR*D



end subroutine


