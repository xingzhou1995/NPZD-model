!program NPZD_read
subroutine NPZD_read(N,P,Z,D,L,TSTART,TEND,dt,ITEM)

implicit none
real(kind=8) :: N,P,Z,D,L
real(kind=8) :: TSTART,TEND,dt
real(kind=8) :: START_TIME,END_TIME,TIME_STEP
integer :: ITEM
real :: ITEM1

namelist / NPZD_data/ N,P,Z,D,L
namelist / NPZD_time/ START_TIME,END_TIME,TIME_STEP

open(33,file="NPZD.nml")
read(33,nml=NPZD_data) 
read(33,nml=NPZD_time)

TSTART=START_TIME
TEND=END_TIME
dt=TIME_STEP

!write(*,*) TSTART
!write(*,*) TEND
!write(*,*) dt

if (TEND .lt. TSTART) then
write(*,*) "error  NPZD_time"
!exit
end if

ITEM1=(TEND-TSTART)/dt
!write(*,*),"ITEM1=",ITEM1
ITEM=ceiling(ITEM1)
!write(*,*),"ITEM=",ITEM

end subroutine
!end
