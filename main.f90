program main
! Description:
! a 1D NPZD model by using RK4 method
!
! Usage:
!
!

implicit none
integer      :: i,ITEM
real(kind=8) :: N,P,Z,D
real(kind=8) :: TSTART,TEND,dt
!integer      :: TSTART,TEND,dt
! inner data
real(kind=8) :: N1,P1,Z1,D1
real(kind=8) :: N2,P2,Z2,D2
real(kind=8) :: N3,P3,Z3,D3
real(kind=8) :: N4,P4,Z4,D4
real(kind=8) :: K1N,K1P,K1Z,K1D
real(kind=8) :: K2N,K2P,K2Z,K2D
real(kind=8) :: K3N,K3P,K3Z,K3D
real(kind=8) :: K4N,K4P,K4Z,K4D

! output data
integer :: COUNTER
real(kind=8),allocatable :: array_N(:)
real(kind=8),allocatable :: array_P(:)
real(kind=8),allocatable :: array_Z(:)
real(kind=8),allocatable :: array_D(:)

!open and reading data

call NPZD_read(N,P,Z,D,TSTART,TEND,dt,ITEM)
write(*,*),"ITEM=",item

!deallocate(N_array)
!deallocate(P_array)
!deallocate(Z_array)
!deallocate(D_array)

if(.not.allocated( array_N)) then 
 allocate( array_N(ITEM+1))
 write(*,*),"ALLOCATED N Array Successful!"
end if
if(.not.allocated( array_P)) then 
allocate( array_P(ITEM+1))
 write(*,*),"ALLOCATED P Array Successful!"
end if 
if(.not.allocated( array_Z)) then 
allocate( array_Z(ITEM+1))
write(*,*),"ALLOCATED Z Array Successful!"
end if
if(.not.allocated( array_D)) then
allocate( array_D(ITEM+1))
 write(*,*),"ALLOCATED D Array Successful!"
end if


!write(*,*),"ALLOCATED NPZD Array Successful!"

!RK4 method


COUNTER=1
array_N(COUNTER)=N
array_P(COUNTER)=P
array_Z(COUNTER)=Z
array_D(COUNTER)=D

write(*,*) "NPZD model start"

Write(*,*),"###############################"
Write(*,*),"TIME=",TSTART+(COUNTER-1)*dt,"N=",N
Write(*,*),"TIME=",TSTART+(COUNTER-1)*dt,"P=",P
Write(*,*),"TIME=",TSTART+(COUNTER-1)*dt,"Z=",Z
Write(*,*),"TIME=",TSTART+(COUNTER-1)*dt,"D=",D
write(*,*),"###############################"


 do i=1,ITEM
write(*,*),"i=",i
!write(*,*),"TEND=",TEND
COUNTER=COUNTER+1

! k1
N1=N
P1=P
D1=D
Z1=Z
Call Nutrient(N1,P1,Z1,D1,K1N)
Call Phytoplankton(N1,P1,Z1,K1P)
Call Zooplankton(P1,Z1,K1Z)
Call Detritus(P1,Z1,D1,K1D)

write(*,*) "#######################"
write(*,*) "K1N=",K1N
write(*,*) "K1P=",K1P
write(*,*) "K1Z=",K1Z
write(*,*) "K1D=",K1D
write(*,*) "######################"


! k2
N2=N+(dt/2)*K1N
P2=P+(dt/2)*K1P
Z2=Z+(dt/2)*K1Z
D2=D+(dt/2)*K1D
Call Nutrient(N2,P2,Z2,D2,K2N)
Call Phytoplankton(N2,P2,Z2,K2P)
Call Zooplankton(P2,Z2,K2Z)
Call Detritus(P2,Z2,D2,K2D)

write(*,*) "#######################"
write(*,*) "K2N=",K2N
write(*,*) "K2P=",K2P
write(*,*) "K2Z=",K2Z
write(*,*) "K2D=",K2D
write(*,*) "######################"



! k3
N3=N+(dt/2)*K2N
P3=P+(dt/2)*K2P
Z3=Z+(dt/2)*K2Z
D3=D+(dt/2)*K2D
Call Nutrient(N3,P3,Z3,D3,K3N)
Call Phytoplankton(N3,P3,Z3,K3P)
Call Zooplankton(P3,Z3,K3Z)
Call Detritus(P3,Z3,D2,K3D)

write(*,*) "#######################"
write(*,*) "K3N=",K3N
write(*,*) "K3P=",K3P
write(*,*) "K3Z=",K3Z
write(*,*) "K3D=",K3D
write(*,*) "######################"


! k4
N4=N+(dt)*K3N
P4=P+(dt)*K3P
Z4=Z+(dt)*K3Z
D4=D+(dt)*K3D
Call Nutrient(N4,P4,Z4,D4,K4N)
Call Phytoplankton(N4,P4,Z4,K4P)
Call Zooplankton(P4,Z4,K4Z)
Call Detritus(P4,Z4,D4,K4D)

write(*,*) "#######################"
write(*,*) "K4N=",K4N
write(*,*) "K4P=",K4P
write(*,*) "K4Z=",K4Z
write(*,*) "K4D=",K4D
write(*,*) "######################"




!iteration
N=N+(dt/6)*(K1N+2*K2N+2*K3N+K4N)
P=P+(dt/6)*(K1P+2*K2P+2*K3P+K4P)
Z=Z+(dt/6)*(K1Z+2*K2Z+2*K3Z+K4Z)
D=D+(dt/6)*(K1D+2*K2D+2*K3D+K4D)

array_N(COUNTER)=N
array_P(COUNTER)=P
array_Z(COUNTER)=Z
array_D(COUNTER)=D

Write(*,*),"###############################"
Write(*,*),"TIME=",TSTART+(COUNTER-1)*dt,"N=",N
Write(*,*),"TIME=",TSTART+(COUNTER-1)*dt,"P=",P
Write(*,*),"TIME=",TSTART+(COUNTER-1)*dt,"Z=",Z
Write(*,*),"TIME=",TSTART+(COUNTER-1)*dt,"D=",D
write(*,*),"###############################"

end do



!output

open(32,file="output_NPZD.dat")

do i=1,COUNTER
write(32,*) "N=",array_N(i)
end do

do i=1,COUNTER
write(32,*) "P=",array_P(i)
end do

do i=1,COUNTER
write(32,*) "Z=",array_Z(i)
end do

do i=1,COUNTER
write(32,*) "D=",array_D(i)
end do

deallocate(array_N)
deallocate(array_P)
deallocate(array_Z)
deallocate(array_D)



end
