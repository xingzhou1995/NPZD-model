subroutine NPZD_BIOLOGY(i)
! Description:
! a 1D NPZD model by using RK4 method
!
! Usage:
!
!

use NPZD_input
use bio_parameter
use phy_process
implicit none
integer :: i,j,time
real(kind=8) :: N,P,Z,D
!real(kind=8)   :: dt
! inner data
real(kind=8) :: N1,P1,Z1,D1
real(kind=8) :: N2,P2,Z2,D2
real(kind=8) :: N3,P3,Z3,D3
real(kind=8) :: N4,P4,Z4,D4
real(kind=8) :: K1N,K1P,K1Z,K1D
real(kind=8) :: K2N,K2P,K2Z,K2D
real(kind=8) :: K3N,K3P,K3Z,K3D
real(kind=8) :: K4N,K4P,K4Z,K4D

time = i
!RK4 method


!COUNTER=1
!array_N(COUNTER)=N
!array_P(COUNTER)=P
!array_Z(COUNTER)=Z
!array_D(COUNTER)=D

!write(*,*) "NPZD model start"

!Write(*,*),"############BIOLOGY PROCESS###################"
!Write(*,*),"TIME=",TSTART+(COUNTER-1)*dt,"N=",N
!Write(*,*),"TIME=",TSTART+(COUNTER-1)*dt,"P=",P
!Write(*,*),"TIME=",TSTART+(COUNTER-1)*dt,"Z=",Z
!Write(*,*),"TIME=",TSTART+(COUNTER-1)*dt,"D=",D
!Write(*,*),"TIME=",TSTART+(COUNTER-1)*dt,"SUM=",N+P+Z+D
!write(*,*),"############BIOLOGY PROCESS###################"


! do i=1,ITEM
!write(*,*),"i=",i
!write(*,*),"TEND=",TEND
!COUNTER=COUNTER+1

!CONTROL PARTION

!if (N.le.0) then
!N=0.0
!end if

!if (P.le.0) then
!P=0.0
!end if

!if (Z.le.0) then
!Z=0.0
!end if

!if (D.le.0) then
!D=0.0
!end if

do j=1,LAYER
    N=array_N(time,j)
    P=array_P(time,j)
    Z=array_Z(time,j)
    D=array_D(time,j)

    call light_decay(time,j) 
    !using seconds calculate
    if (NPZD_SECONDS) then
     T=array_T(floor(1+(dt*(time-1)/86400)),j)
      L=array_L(floor(1+(dt*(time-1)/86400)),j)
   ! write(*,*) "dt=",dt
   ! write(*,*) "time=",time
   ! write(*,*) "=",1+(dt*(time-1)/86400)
   ! write(*,*) "t=", floor(1+((time-1)/86400)*dt)
    else  
    T=array_T(floor(1+(time-1)*dt),j)
    L=array_L(floor(1+(time-1)*dt),j)
    end if



      
if ( mod(time,100) .eq.0 ) then

write(*,*) "T=",T,"L=",L

Write(*,*) "#############BIOLOGY PROCESS##################"
Write(*,*) "TIME=",TSTART+(time-1)*dt,"LAYER=",j,"N=",N
Write(*,*) "TIME=",TSTART+(time-1)*dt,"LAYER=",j,"P=",P
Write(*,*) "TIME=",TSTART+(time-1)*dt,"LAYER=",j,"Z=",Z
Write(*,*) "TIME=",TSTART+(time-1)*dt,"LAYER=",j,"D=",D
Write(*,*) "TIME=",TSTART+(time-1)*dt,"LAYER=",j,"SUM=",N+P+Z+D
write(*,*) "#############BIOLOGY PROCESS##################"

end if

! k1
N1=N
P1=P
D1=D
Z1=Z
Call Datacontrol(N1,P1,Z1,D1)
Call Nutrient(N1,P1,Z1,D1,K1N)
Call Phytoplankton(N1,P1,Z1,D1,K1P)
Call Zooplankton(P1,Z1,D1,K1Z)
Call Detritus(P1,Z1,D1,K1D)

!N=N+K1N*dt
!P=P+K1P*dt
!Z=Z+K1Z*dt
!D=D+K1D*dt




!write(*,*) "#######################"
!write(*,*) "K1N=",K1N
!write(*,*) "K1P=",K1P
!write(*,*) "K1Z=",K1Z
!write(*,*) "K1D=",K1D
!write(*,*) "######################"


! k2
N2=N+(dt/2)*K1N!
P2=P+(dt/2)*K1P
Z2=Z+(dt/2)*K1Z
D2=D+(dt/2)*K1D
Call Datacontrol(N2,P2,Z2,D2)
Call Nutrient(N2,P2,Z2,D2,K2N)
Call Phytoplankton(N2,P2,Z2,D2,K2P)
Call Zooplankton(P2,Z2,D2,K2Z)
Call Detritus(P2,Z2,D2,K2D)

!write(*,*) "#######################"
!write(*,*) "K2N=",K2N
!write(*,*) "K2P=",K2P
!write(*,*) "K2Z=",K2Z
!write(*,*) "K2D=",K2D
!write(*,*) "######################"



! k3
N3=N+(dt/2)*K2N
P3=P+(dt/2)*K2P
Z3=Z+(dt/2)*K2Z
D3=D+(dt/2)*K2D
Call Datacontrol(N3,P3,Z3,D3)
Call Nutrient(N3,P3,Z3,D3,K3N)
Call Phytoplankton(N3,P3,Z3,D3,K3P)
Call Zooplankton(P3,Z3,D3,K3Z)
Call Detritus(P3,Z3,D3,K3D)

!write(*,*) "#######################"
!write(*,*) "K3N=",K3N
!write(*,*) "K3P=",K3P
!write(*,*) "K3Z=",K3Z
!write(*,*) "K3D=",K3D
!write(*,*) "######################"


! k4
N4=N+(dt)*K3N
P4=P+(dt)*K3P
Z4=Z+(dt)*K3Z
D4=D+(dt)*K3D
Call Datacontrol(N4,P4,Z4,D4)
Call Nutrient(N4,P4,Z4,D4,K4N)
Call Phytoplankton(N4,P4,Z4,D4,K4P)
Call Zooplankton(P4,Z4,D4,K4Z)
Call Detritus(P4,Z4,D4,K4D)

!write(*,*) "#######################"
!write(*,*) "K4N=",K4N
!write(*,*) "K4P=",K4P
!write(*,*) "K4Z=",K4Z
!write(*,*) "K4D=",K4D
!write(*,*) "######################"




!iteration

!write(*,*) "KN=",(dt/6)*(K1N+2*K2N+2*K3N+K4N)
!write(*,*) "KP=",(dt/6)*(K1P+2*K2P+2*K3P+K4P)
!write(*,*) "KZ=",(dt/6)*(K1Z+2*K2Z+2*K3Z+K4Z)
!write(*,*) "KD=",(dt/6)*(K1D+2*K2D+2*K3D+K4D)


N=N+(dt/6)*(K1N+2*K2N+2*K3N+K4N)
P=P+(dt/6)*(K1P+2*K2P+2*K3P+K4P)
Z=Z+(dt/6)*(K1Z+2*K2Z+2*K3Z+K4Z)
D=D+(dt/6)*(K1D+2*K2D+2*K3D+K4D)
Call Datacontrol(N,P,Z,D)


   array_N(time+1,j)=N
   array_P(time+1,j)=P
   array_Z(time+1,j)=Z
   array_D(time+1,j)=D


  
end do


!array_N(COUNTER)=N
!array_P(COUNTER)=P
!array_Z(COUNTER)=Z
!array_D(COUNTER)=D

!Write(*,*),"###############################"
!Write(*,*),"TIME=",TSTART+(COUNTER-1)*dt,"N=",N
!Write(*,*),"TIME=",TSTART+(COUNTER-1)*dt,"P=",P
!Write(*,*),"TIME=",TSTART+(COUNTER-1)*dt,"Z=",Z
!Write(*,*),"TIME=",TSTART+(COUNTER-1)*dt,"D=",D
!Write(*,*),"TIME=",TSTART+(COUNTER-1)*dt,"SUM=",N+P+Z+D
!write(*,*),"###############################"

!end do



!output

!open(32,file="output_NPZD.dat")

!do i=1,COUNTER
!write(32,*) "N=",array_N(i)
!end do

!do i=1,COUNTER
!write(32,*) "P=",array_P(i)
!end do

!o i=1,COUNTER
!rite(32,*) "Z=",array_Z(i)
!end do

!do i=1,COUNTER
!write(32,*) "D=",array_D(i)
!end do

!deallocate(array_N)
!deallocate(array_P)
!deallocate(array_Z)
!deallocate(array_D)



end subroutine



subroutine Datacontrol(N,P,Z,D)
use bio_parameter
implicit none
real(kind=8) :: N,P,Z,D
if (N.lt.0.00000) then
N=N_0
end if
if (P.lt.0.00000) then
P=P_0
end if

if (Z.lt.0.00000) then
Z=Z_0
end if

if (D.lt.0.00000) then
D=D_0
end if

end subroutine

Subroutine Nutrient(N,P,Z,D,KN)

use bio_parameter
use bio_process
implicit none
real(kind=8) :: N,P,Z,D,KN
real(kind=8) :: U,GP,GD,ZM,RR,PR,ZR,PM


BIO_MODEL=trim(BIO_MODEL)
select case(BIO_MODEL)
 case('NPZD')
call grazing(P,Z,D,GP,GD)
call uptaking(N,P,U)
call Z_mortality(Z,ZM)
call remineralization(D,RR)
call P_respiration(P,PR,U)
call Z_respiration(Z,ZR)
!Consider Mixing as a parameter
!KN=-U+beta*GP+gama*ZM*Z+R+k*(N0-N)

!Without Mixing
!KN=-U*P+beta*GP*Z+ZM*Z+RR*D

!Adding respiration
KN=-U*P+ZR*Z+PR*P+RR*D

!open(unit=66,file="respiration.txt")
! write(66,*) ZR,PR,RR

case('NPZ')
call uptaking(N,P,U)
call grazing(P,Z,D,GP,GD)
call P_mortality(P,PM)
call Z_mortality(Z,ZM)
KN=-U*P+(1-beta)*GP*Z+PM*P+ZM*Z
!write(*,*) U*P
!write(*,*) (1-beta)*GP*Z
!write(*,*) PM*P
!write(*,*) ZM*Z
case default
print*,"Invalid BIO_MODEL,program terminated"
stop
end select

end subroutine

subroutine Phytoplankton(N,P,Z,D,KP)


use bio_parameter
use bio_process
implicit none
real(kind=8) :: N,P,Z,D,KP
real(kind=8) :: U,GP,GD,PM,PR

BIO_MODEL=trim(BIO_MODEL)
select case(BIO_MODEL)

case('NPZD')
call uptaking(N,P,U)
call grazing(P,Z,D,GP,GD)
call P_mortality(P,PM)
call P_respiration(P,PR,U)
!Consider mixng and sinking as a parameter
!KP=U-PM*P-GP-(s+k)*P


!Without Mixing and sinking
!KP=U*P-PM*P-GP*Z

!Adding respiration (luo option)
KP=U*P-PR*P-PM*P-GP*Z

!open(unit=44,file="grazingp.txt")
! write(44,*) U,(GP*Z)
!write(*,*),"UPTAKE=",U*P

!write(*,*) "U=",U
!write(*,*) "I=",I

case('NPZ')

call uptaking(N,P,U)
call grazing(P,Z,D,GP,GD)
call P_mortality(P,PM)
KP=U*P-GP*Z-PM*P

case default
print*,"Invalid BIO_MODEL,program terminated"
stop
end select





end subroutine

subroutine Zooplankton(P,Z,D,KZ)

use bio_parameter
use bio_process
implicit none
real(kind=8) :: P,Z,D,KZ
real(kind=8) :: GP,GD,ZM,ZR

BIO_MODEL=trim(BIO_MODEL)
select case(BIO_MODEL)
case('NPZD')
call grazing(P,Z,D,GP,GD)
call Z_mortality(Z,ZM)
call Z_respiration(Z,ZR)
! ORIGIN
!KZ=alpha*GP*Z-GM*Z

!luo
KZ=GP*Z+GD*Z-ZR*Z-ZM*Z
!write(*,*),"GP=",GP
!write(*,*),"GD=",GD
!write(*,*),"ZR=",ZR
!write(*,*),"ZM=",ZM

open(unit=44,file="grazingp.txt")
write(44,*) GP*Z+GD*Z


case('NPZ')
call grazing(P,Z,D,GP,GD)
call Z_mortality(Z,ZM)
KZ=beta*GP*Z-ZM*Z

case default
print*,"Invalid BIO_MODEL,program terminated"
stop
end select




end subroutine

subroutine Detritus(P,Z,D,KD)


use bio_parameter
use bio_process
implicit none
real(kind=8) :: P,Z,D,KD
real(kind=8) :: GP,GD,PM,ZM,RR

BIO_MODEL=trim(BIO_MODEL)

select case(BIO_MODEL)
case('NPZD')
call grazing(P,Z,D,GP,GD)
call P_mortality(P,PM)
call Z_mortality(Z,ZM)
call remineralization(D,RR)
!Consider mixing and sinking as a parameter
!KD=r*P+(1-alpha-beta)*GP*Z-(psi+phi+k)*D

!Without mixing
!KD=PM*P+(1-alpha-beta)*GP*Z-RR*D

!Luo option
KD=PM*P+ZM*Z-GD*Z-RR*D

case('NPZ')

KD=0

case default
print*,"Invalid BIO_MODEL,program terminated"
stop
end select


end subroutine


