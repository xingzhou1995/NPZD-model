subroutine NPZD_PHYSICS(i)

use NPZD_input
use phy_parameter
use phy_process
implicit none
integer :: i,j,time


time=i
call sinking(time)
call mixing(time)


end subroutine
