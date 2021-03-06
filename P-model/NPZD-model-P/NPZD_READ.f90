!program NPZD_read
subroutine NPZD_read

use NPZD_input
use bio_parameter
use phy_process
use phy_parameter
implicit none
!character(20) :: NPZD_in,NPZD_T_in,NPZD_L_in,NPZD_out
!real(kind=8) :: TSTART,TEND,dt
real(kind=8) :: START_TIME,END_TIME,TIME_STEP
integer :: i,j,error
real :: ITEM1
namelist / NPZD_SELECT/ BIO_MODEL,NPZD_SECONDS
namelist / NPZD_IO/ INPDIR,OUTDIR
namelist / NPZD_RESTART/ RESTART_ON,RESTART_INTERVAL
namelist / NPZD_data/ NPZD_in,NPZD_T_in,NPZD_L_in,NPZD_out
namelist / NPZD_time/ START_TIME,END_TIME,TIME_STEP,dh
namelist / NPZD_bioprocess/ L_function,N_function,PM_function,ZM_function,R_function,G_function,PR_function,ZR_function,T_function 

open(33,file="NPZD.nml")
read(33,nml=NPZD_SELECT)
read(33,nml=NPZD_IO)
read(33,nml=NPZD_RESTART)
read(33,nml=NPZD_data) 
read(33,nml=NPZD_time)
read(33,nml=NPZD_bioprocess)

WRITE(*,*) BIO_MODEL

! allocate Item

if (NPZD_SECONDS) then
END_TIME=END_TIME*86400
TIME_STEP=TIME_STEP*86400
end if



TSTART=START_TIME
TEND=END_TIME
dt=TIME_STEP


write(*,*) TSTART
write(*,*) TEND
write(*,*) dt
if (TEND .lt. TSTART) then
write(*,*) "error  NPZD_time,program terminated"
stop
!exit
end if
ITEM1=(TEND-TSTART)/dt


if (NPZD_SECONDS) then
DDAY =(TEND-TSTART)/86400 ! in second divide 86400
else
DDAY =(TEND-TSTART)
end if


!write(*,*),"ITEM1=",ITEM1
ITEM=ceiling(ITEM1)
!write(*,*),"ITEM=",ITEM

!write(*,*) NPZD_in
!write(*,*) trim(INPDIR)//trim(NPZD_in)
open(44,file=(trim(INPDIR)//trim(NPZD_in)))
error = 0
LAYER = 0
!write(*,*),"LAYER-",LAYER
do while( error.eq.0)
read(44,*,iostat=error)
LAYER=LAYER+1
end do
LAYER=LAYER-1
rewind(44)

write(*,*) " How many days=",DDAY
write(*,*) "Iteration Number=",ITEM
write(*,*) "LAYER=",LAYER


allocate(array_N(ITEM+1,LAYER))
allocate(array_P(ITEM+1,LAYER))
allocate(array_Z(ITEM+1,LAYER))
allocate(array_D(ITEM+1,LAYER))
allocate(array_T(DDAY+1,LAYER))
allocate(array_L(DDAY+1,LAYER))

write(*,*) "Allocate successful"

! read initial field

do i=1,LAYER
  read(44,*,iostat=error) array_N(1,i),array_P(1,i),array_Z(1,i),array_D(1,i)
end do
close(44)

write(*,*) "N,P,Z,D data read successful"
 
! read T
open(55,file=trim(INPDIR)//trim(NPZD_T_in))
do i=1,LAYER
  read(55,*,iostat=error) (array_T(j,i),j=1,DDAY+1)
end do
!do i=1,Layer
!write(*,*) (array_T(j,i),j=3,5)
!end do
close(55)

write(*,*) "T read successful"

! read L
open(66,file=trim(INPDIR)//trim(NPZD_L_in))
!  do i=1,ITEM
  read(66,*,iostat=error) array_L
  !write(*,*) array_L(2,1)
!  end do
! remain calculateing the light intensity decay with depth undone
!call light_decay()
!write(*,*) array_L(2,1),array_L(3,1)
close(66)

!change light unit from W/m^2 to 
do j=1,LAYER
 do i=1,DDAY+1
array_L(i,j)=array_L(i,1)
!write(*,*) array_L(2,1),array_L(3,1),array_L(2,2),array_L(3,2)
end do
end do

array_L(:,:)=array_L*transferlight

!write(*,*) array_L(2,1),array_L(3,1),array_L(2,2),array_L(3,2)


write(*,*) "L read successful"


if (NPZD_SECONDS) then
 call day2seconds()
end if


!write what function you choose
write(*,*) "Temperature function:",T_FUNCTION
write(*,*) "Light function:",L_FUNCTION
write(*,*) "Nutrient function:",N_FUNCTION
write(*,*) "Phytoplankton mortality function:",PM_FUNCTION
write(*,*) "Zooplankton mortality function:",ZM_FUNCTION
write(*,*) "Detritus Remineralization function:",R_FUNCTION
write(*,*) "Grazing function:",G_FUNCTION
write(*,*) "Phytoplankton respiration function:",PR_FUNCTION
write(*,*) "Zooplankton respiration function:",ZR_FUNCTION

end subroutine
