subroutine NPZD_PHYSICS(i)

use NPZD_input
use phy_parameter
use phy_process
implicit none
integer :: i,j,time


time=i
if (time .gt. 1) then
call sinking(time)
else
do j=1,LAYER
array_N(time+1,j)=array_N(time,j)
array_P(time+1,j)=array_P(time,j)
array_Z(time+1,j)=array_Z(time,j)
array_D(time+1,j)=array_D(time,j)
end do
end if


end subroutine
