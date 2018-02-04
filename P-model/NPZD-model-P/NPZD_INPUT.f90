module  NPZD_input

!time and space
integer :: ITEM    ! how many iteration steps
integer :: LAYER   ! how many layers in depth
real(kind=8) :: TSTART,TEND,dt




real(kind=8),allocatable :: array_N(:,:)
real(kind=8),allocatable :: array_P(:,:)
real(kind=8),allocatable :: array_Z(:,:)
real(kind=8),allocatable :: array_D(:,:)

! forcing
real(kind=8),allocatable :: array_T(:,:)
real(kind=8),allocatable :: array_L(:,:)

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



end module
