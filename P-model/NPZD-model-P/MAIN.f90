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
 do j=1,LAYER
    N=array_N(i,j)
    P=array_P(i,j)
    Z=array_Z(i,j)
    D=array_D(i,j)
    T=array_T(i,j)
    L=array_L(i,j)

Write(*,*),"###############################"
Write(*,*),"TIME=",TSTART+(i-1)*dt,"LAYER=",j,"N=",N
Write(*,*),"TIME=",TSTART+(i-1)*dt,"LAYER=",j,"P=",P
Write(*,*),"TIME=",TSTART+(i-1)*dt,"LAYER=",j,"Z=",Z
Write(*,*),"TIME=",TSTART+(i-1)*dt,"LAYER=",j,"D=",D
Write(*,*),"TIME=",TSTART+(i-1)*dt,"LAYER=",j,"SUM=",N+P+Z+D
write(*,*),"###############################"


 call NPZD_BIOLOGY(N,P,Z,D,dt)
 call NPZD_PHYSICS(N,P,Z,D)
   array_N(i+1,j)=N
   array_P(i+1,j)=P
   array_Z(i+1,j)=Z
   array_D(i+1,j)=D
 end do
end do

!write program






call NPZD_WRITE

end 

