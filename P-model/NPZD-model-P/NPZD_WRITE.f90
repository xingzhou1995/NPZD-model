Subroutine NPZD_WRITE()

use NPZD_input
implicit none
integer ::  i,j

!open(unit=99,file=NPZD_out,form='unformatted') !ERR=1000
open(unit=99,file=trim(OUTDIR)//trim(NPZD_out)) !ERR=1000


do i=1,ITEM+1
write(99,*) (array_N(i,j),j=1,LAYER)
!write(99) (array_N(i,j),j=1,LAYER)
end do

do i=1,ITEM+1
write(99,*) (array_P(i,j),j=1,LAYER)
!write(99) (array_P(i,j),j=1,LAYER)
end do

do i=1,ITEM+1
write(99,*) (array_Z(i,j),j=1,LAYER)
!write(99) (array_Z(i,j),j=1,LAYER)
end do

do i=1,ITEM+1
write(99,*) (array_D(i,j),j=1,LAYER)
!write(99) (array_D(i,j),j=1,LAYER)
end do

!1000 write(*,'("Error opening file for writing.")')
!     stop

!1001 write(*,'("Error in writing N data.")')
!     stop

!1002 write(*,'("Error in writing P data.")')
!     stop

!1003 write(*,'("Error in writing Z data.")')
!     stop

!1004 write(*,'("Error in writing D data.")')
!     stop

close(unit=99)

end subroutine
