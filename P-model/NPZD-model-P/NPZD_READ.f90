!program NPZD_read
subroutine NPZD_read

use NPZD_input
use bio_parameter
implicit none
character(20) :: NPZD_in,NPZD_T_in,NPZD_L_in,NPZD_out
!real(kind=8) :: TSTART,TEND,dt
real(kind=8) :: START_TIME,END_TIME,TIME_STEP
integer :: i,j,error
real :: ITEM1

namelist / NPZD_IO/ NPZD_in,NPZD_T_in,NPZD_L_in,NPZD_out
namelist / NPZD_time/ START_TIME,END_TIME,TIME_STEP
namelist / NPZD_process/ L_function,N_function,PM_function,ZM_function,R_function,G_function,PR_function,ZR_function,T_function 

open(33,file="NPZD.nml")
read(33,nml=NPZD_IO) 
read(33,nml=NPZD_time)
read(33,nml=NPZD_process)

! allocate Item
TSTART=START_TIME
TEND=END_TIME
dt=TIME_STEP
!write(*,*) TSTART
!write(*,*) TEND
!write(*,*) dt
if (TEND .lt. TSTART) then
write(*,*) "error  NPZD_time,program terminated"
stop
!exit
end if
ITEM1=(TEND-TSTART)/dt
!write(*,*),"ITEM1=",ITEM1
ITEM=ceiling(ITEM1)
!write(*,*),"ITEM=",ITEM


open(44,file=NPZD_in)
error = 0
do while( error.eq.0)
read(44,*,iostat=error)
LAYER=LAYER+1
end do
LAYER=LAYER-1
rewind(44)

write(*,*),"ITEM=",ITEM
write(*,*),"LAYER=",LAYER


allocate(array_N(ITEM+1,LAYER))
allocate(array_P(ITEM+1,LAYER))
allocate(array_Z(ITEM+1,LAYER))
allocate(array_D(ITEM+1,LAYER))
allocate(array_T(ITEM+1,LAYER))
allocate(array_L(ITEM+1,LAYER))

write(*,*),"Allocate successful"

! read initial field

do i=1,LAYER
  read(44,*,iostat=error) array_N(i,1),array_P(i,1),array_Z(i,1),array_D(i,1)
end do
close(44)

write(*,*),"N,P,Z,D data read successful"
 
! read T
open(55,file=NPZD_T_in)
do i=1,LAYER
  read(55,*,iostat=error) (array_T(i,j),j=1,ITEM)
end do
close(55)

write(*,*),"T read successful"

! read L
open(66,file=NPZD_L_in)
do i=1,ITEM
  read(66,*,iostat=error) array_L(1,i)
end do
! remain calculateing the light intensity decay with depth undone
close(66)

write(*,*),"L read successful"
end subroutine
