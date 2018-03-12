program MAIN

use NPZD_input
use bio_parameter
implicit none
integer :: i,j
real(kind=8) :: N,P,Z,D

write(*,*) "NPZD model start"
write(*,*) "Start to read input file"
call NPZD_READ

do i=1,ITEM
call NPZD_BIOLOGY(i)

call NPZD_PHYSICS(i)

call NPZD_RESTART(i)

!call NPZD_BIOLOGY(i)

end do

!write program






call NPZD_WRITE

end 

