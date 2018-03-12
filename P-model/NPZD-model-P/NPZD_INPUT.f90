module  NPZD_input

!time and space
integer :: ITEM    ! how many iteration steps
integer :: LAYER   ! how many layers in depth
integer :: DDAY    ! how many days 
! NPZD_time and space
real(kind=8) :: TSTART,TEND,dt,dh
!NPZD_IO
character(20) :: INPDIR,OUTDIR

! NPZD start and forcing file
character(20) :: NPZD_in,NPZD_T_in,NPZD_L_in,NPZD_out

real(kind=8),allocatable :: array_N(:,:)
real(kind=8),allocatable :: array_P(:,:)
real(kind=8),allocatable :: array_Z(:,:)
real(kind=8),allocatable :: array_D(:,:)

! forcing
real(kind=8),allocatable :: array_T(:,:)
real(kind=8),allocatable :: array_L(:,:)


logical(kind=4) :: RESTART_ON
real(kind=8) :: RESTART_INTERVAL
!allocate(array_N(LAYER,ITEM+1))
!allocate(array_P(LAYER,ITEM+1))
!allocate(array_Z(LAYER,ITEM+1))
!allocate(array_D(LAYER,ITEM+1))
!allocate(array_T(LAYER,ITEM+1))
!allocate(array_L(LAYER,ITEM+1))
!allocate(array_N(ITEM+1,LAYER))
!allocate(array_P(ITEM+1,LAYER))
!allocate(array_Z(ITEM+1,LAYER))
!allocate(array_D(ITEM+1,LAYER))
!allocate(array_T(ITEM+1,LAYER))
!allocate(array_L(ITEM+1,LAYER))

!contains
!subroutine light_decay(array_L)

!use NPZD_INPUT
!implicit none

!do i=1,LAYER
!array_L(i,:)=array_L(1,:)
!end do

!end subroutine

end module
