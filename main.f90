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
real(kind=8),allocatable :: N_array(:)
real(kind=8),allocatable :: P_array(:)
real(kind=8),allocatable :: Z_array(:)
real(kind=8),allocatable :: D_array(:)

!open and reading data

call NPZD_read(N,P,Z,D,TSTART,TEND,dt,ITEM)

allocate( N_array(ITEM))
allocate( P_array(ITEM))
allocate( Z_array(ITEM))
allocate( D_array(ITEM))



!RK4 method


COUNTER=1
N_array(COUNTER)=N
P_array(COUNTER)=P
Z_array(COUNTER)=Z
D_array(COUNTER)=D


do i=TSTART,dt,TEND

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

! k2
N2=N+(dt/2)*K1N
P2=P+(dt/2)*K1P
Z2=Z+(dt/2)*K1Z
D2=D+(dt/2)*K1D
Call Nutrient(N2,P2,Z2,D2,K2N)
Call Phytoplankton(N2,P2,Z2,K2P)
Call Zooplankton(P2,Z2,K2Z)
Call Detritus(P2,Z2,D2,K2D)

! k3
N3=N+(dt/2)*K2N
P3=P+(dt/2)*K2P
Z3=Z+(dt/2)*K2Z
D3=D+(dt/2)*K2D
Call Nutrient(N3,P3,Z3,D3,K3N)
Call Phytoplankton(N3,P3,Z3,K3P)
Call Zooplankton(P3,Z3,K3Z)
Call Detritus(P3,Z3,D2,K3D)

! k4
N4=N+(dt)*K3N
P4=P+(dt)*K3P
Z4=Z+(dt)*K3Z
D4=D+(dt)*K3D
Call Nutrient(N4,P4,Z4,D4,K4N)
Call Phytoplankton(N4,P4,Z4,K4P)
Call Zooplankton(P4,Z4,K4Z)
Call Detritus(P4,Z4,D4,K4D)

!iteration
N=N+(dt/6)*(K1N+2*K2N+2*K3N+K4N)
P=P+(dt/6)*(K1P+2*K2P+2*K3P+K4P)
Z=Z+(dt/6)*(K1Z+2*K2Z+2*K3Z+K4Z)
D=D+(dt/6)*(K1D+2*K2D+2*K3D+K4D)

N_array(COUNTER)=N
P_array(COUNTER)=P
Z_array(COUNTER)=Z
D_array(COUNTER)=D

END DO

!output

open(32,file="output_NPZD.dat")

do i=1,COUNTER
write(32,*) "N=",N_array(i)
end do

do i=1,COUNTER
write(32,*) "P=",P_array(i)
end do

do i=1,COUNTER
write(32,*) "Z=",Z_array(i)
end do

do i=1,COUNTER
write(32,*) "D=",D_array(i)
end do





end
