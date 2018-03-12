program debug NPZD

!this function is used for calculating the anlytical solution of NPZ model

use bio_parameter

real(kind=8) :: P


kext= 0.06 
dh  = 5
Nt  = 7


P=(-1/lamda)*alog(1-dd/(beta*Gmax))


open(66,file='light.txt')

read(66,*iostat=error) array_L

!do j=1,DDAY+1
!  do i=1,LAYER
! array_L(j,i)=array_L(j,1)*transferlight
! tmp=array_L(j,1)*exp(-kext*(i-1)*dh)
! array_L(j,i)=tmp

! L_l(j,i)=(array_L(j,i)/(L0+array_L(j,i))
!write(*,*) array_L(j,i)
! end do
!end do


do i=1,LAYER

A(i)=exp(-kext*(i-1)*dh)

end do

do i=1,LAYER
bb(i)=r-Vm-(dd*e)/(A*beta*P)




close(66)
