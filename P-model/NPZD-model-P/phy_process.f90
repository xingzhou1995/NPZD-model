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

end module
