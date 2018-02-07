module phy_process
contains
subroutine light_decay()


use NPZD_INPUT
use phy_parameter
implicit none
integer :: i,j
real(kind=8) :: tmp


! no decay
do i=1,LAYER
 do j=1,ITEM+1
 tmp=array_L(j,1)
 array_L(j,i)=tmp
 end do
end do

! decay chen
!do i=1,LAYER
! do j=1,ITEM+1
! tmp=array_L(j,1)*exp(-kext*(i-1)*dh)
! array_L(j,i)=tmp
! end do
!end do



end subroutine

subroutine sinking(time)

use NPZD_input
use phy_parameter
implicit none
integer :: j,time,sink_controln,sink_controlp,sink_controlz,sink_controld
real(kind=8) :: N1(LAYER),P1(LAYER),Z1(LAYER),D1(LAYER)
real(kind=8) :: N2(LAYER),P2(LAYER),Z2(LAYER),D2(LAYER)
real(kind=8) :: N3(LAYER),P3(LAYER),Z3(LAYER),D3(LAYER)

sink_controln = 1
sink_controlp = 1
sink_controlz = 1
sink_controld = 1



!read data
do j=1,LAYER
N1(j)=array_N(time-1,j)
N2(j)=array_N(time,j)
P1(j)=array_P(time-1,j)
P2(j)=array_P(time,j)
Z1(j)=array_Z(time-1,j)
Z2(j)=array_Z(time,j)
D1(j)=array_D(time-1,j)
D2(j)=array_D(time,j)
end do
!#########################################################

!write(*,*) "Z2=",Z2
!write(*,*) "Z2(2)=",Z2(2)
!write(*,*) "Z1=",Z1
!write(*,*)  sink_controlz
!write(*,*)  Wz
N3(1)=N1(1)-sink_controln*Wn*(dt/dh)*((N2(1)+N2(2))/2)
P3(1)=P1(1)-sink_controlp*Wp*(dt/dh)*((P2(1)+P2(2))/2)
Z3(1)=Z1(1)-sink_controlz*Wz*(dt/dh)*((Z2(1)+Z2(2))/2)
D3(1)=D1(1)-sink_controld*Wd*(dt/dh)*((D2(1)+D2(2))/2)

call sink_control(N3(1),P3(1),Z3(1),D3(1),sink_controln,sink_controlp,sink_controlz,sink_controld)


Write(*,*),"#############SINKING##################"
Write(*,*),"TIME=",TSTART+(time-1)*dt,"LAYER=",1,"N=",N3(1)
Write(*,*),"TIME=",TSTART+(time-1)*dt,"LAYER=",1,"P=",P3(1)
Write(*,*),"TIME=",TSTART+(time-1)*dt,"LAYER=",1,"Z=",Z3(1)
Write(*,*),"TIME=",TSTART+(time-1)*dt,"LAYER=",1,"D=",D3(1)
Write(*,*),"TIME=",TSTART+(time-1)*dt,"LAYER=",1,"SUM=",N3(1)+P3(1)+Z3(1)+D3(1)
write(*,*),"#############SINKING##################"





do j=2,LAYER-1
N3(j)=N1(j)-sink_controln*Wn*(dt/dh)*(N2(j+1)-N2(j-1))
P3(j)=P1(j)-sink_controlp*Wp*(dt/dh)*(P2(j+1)-P2(j-1))
Z3(j)=Z1(j)-sink_controlz*Wz*(dt/dh)*(Z2(j+1)-Z2(j-1))
D3(j)=D1(j)-sink_controld*Wd*(dt/dh)*(D2(j+1)-D2(j-1))

call sink_control(N3(j),P3(j),Z3(j),D3(j),sink_controln,sink_controlp,sink_controlz,sink_controld)

Write(*,*),"#############SINKING##################"
Write(*,*),"TIME=",TSTART+(time-1)*dt,"LAYER=",j,"N=",N3(j)
Write(*,*),"TIME=",TSTART+(time-1)*dt,"LAYER=",j,"P=",P3(j)
Write(*,*),"TIME=",TSTART+(time-1)*dt,"LAYER=",j,"Z=",Z3(j)
Write(*,*),"TIME=",TSTART+(time-1)*dt,"LAYER=",j,"D=",D3(j)
Write(*,*),"TIME=",TSTART+(time-1)*dt,"LAYER=",j,"SUM=",N3(j)+P3(j)+Z3(j)+D3(j)
write(*,*),"#############SINKING##################"



end do
N3(LAYER)=N1(LAYER)+sink_controln*Wn*(dt/dh)*((N2(LAYER)+N2(LAYER-1))/2)
P3(LAYER)=P1(LAYER)+sink_controlp*Wp*(dt/dh)*((P2(LAYER)+P2(LAYER-1))/2)
Z3(LAYER)=Z1(LAYER)+sink_controlz*Wz*(dt/dh)*((Z2(LAYER)+Z2(LAYER-1))/2)
D3(LAYER)=D1(LAYER)+sink_controld*Wd*(dt/dh)*((D2(LAYER)+D2(LAYER-1))/2)

!write(*,*) "Z3(LAYER)=",time,Z3(LAYER)
!write(*,*) "Z1(LAYER)=",time,Z1(LAYER)
!write(*,*) "Z2(LAYER)=",time,Z2(LAYER)
!write(*,*) "Z2(LAYER-1)=",time,Z2(LAYER-1)
!do j=1,LAYER
!write(*,*) time,Z3(j)
!end do
call sink_control(N3(LAYER),P3(LAYER),Z3(LAYER),D3(LAYER),sink_controln,sink_controlp,sink_controlz,sink_controld)
!do j=1,LAYER
!write(*,*) time,Z3(j)
!end do

Write(*,*),"#############SINKING##################"
Write(*,*),"TIME=",TSTART+(time-1)*dt,"LAYER=",LAYER,"N=",N3(LAYER)
Write(*,*),"TIME=",TSTART+(time-1)*dt,"LAYER=",LAYER,"P=",P3(LAYER)
Write(*,*),"TIME=",TSTART+(time-1)*dt,"LAYER=",LAYER,"Z=",Z3(LAYER)
Write(*,*),"TIME=",TSTART+(time-1)*dt,"LAYER=",LAYER,"D=",D3(LAYER)
Write(*,*),"TIME=",TSTART+(time-1)*dt,"LAYER=",LAYER,"SUM=",N3(LAYER)+P3(LAYER)+Z3(LAYER)+D3(LAYER)
write(*,*),"#############SINKING##################"


!do j=1,LAYER

!if (N3(j).le.0) then
!sink_controln = 0
!N3(j) = sink_min
!end if

!if (P3(j).le.0) then
!sink_controlp = 0
!P3(j) = sink_min
!end if

!if (Z3(j).le.0) then
!sink_controlz = 0
!Z3(j) = sink_min
!end if

!if (D3(j).le.0) then
!sink_controld = 0
!D3(j) = sink_min
!end if

!end do



!#######################################

!write(*,*) "Z3=",Z3
do j=1,LAYER

   array_N(time+1,j)=N3(j)
   array_P(time+1,j)=P3(j)
   array_Z(time+1,j)=Z3(j)
   array_D(time+1,j)=D3(j)
end do








!deallocate(N1)
!deallocate(N2)
!deallocate(N3)
!deallocate(P1)
!deallocate(P2)
!deallocate(P3)
!deallocate(Z1)
!deallocate(Z2)
!deallocate(Z3)
!deallocate(D1)
!deallocate(D2)
!deallocate(D3)









end subroutine


subroutine sink_control(N,P,Z,D,sink_controln,sink_controlp,sink_controlz,sink_controld)

use phy_parameter
implicit none
real(kind=8) :: N,P,Z,D
integer :: sink_controln,sink_controlp,sink_controlz,sink_controld


sink_controln = 1
sink_controlp = 1
sink_controlz = 1
sink_controld = 1



if (N.le.0) then
sink_controln = 0
N = sink_min
end if

if (P.le.0) then
sink_controlp = 0
P = sink_min
end if

if (Z.le.0) then
sink_controlz = 0
Z = sink_min
end if

if (D.le.0) then
sink_controld = 0
D = sink_min
end if



end subroutine



end module



