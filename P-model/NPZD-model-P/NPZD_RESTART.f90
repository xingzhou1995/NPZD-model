subroutine NPZD_RESTART(time)

use NPZD_input
implicit none
integer :: time,j
character(len=20) :: tt
 
!write(*,*) RESTART_ON
 if (RESTART_ON) then
 ! in second
 !if (mod(time*86400,RESTART_CYCLE)) .eq. 0) then
 ! in days
   if ( mod(time*dt,RESTART_INTERVAL) .eq.0 ) then
   write(tt,"(f10.6)") TSTART+(time-1)*dt 
   open(unit=99,file=trim(OUTDIR)//'restart_'//trim(tt)//'.txt')
   do j=1,LAYER
   write(99,*) array_N(time,j),array_P(time,j),array_Z(time,j),array_D(time,j)
   end do
   close(99)
   
   end if 
 end if

end subroutine
 
