module phy_parameter


!using for light decay in the water
real(kind=8) :: kext = 0.1 !/m                     !diffuese attenution coefficent
real(kind=8) :: Wn   = 0.0 ! m/d                 !sinking velocity of N
real(kind=8) :: Wp   = 1.0 !0.6 ! m/d                 !sinking velocity of N
real(kind=8) :: Wz   = 0.0 ! m/d                 !sinking velocity of N
real(kind=8) :: Wd   = 1.0 !0.6 ! m/d                 !sinking velocity of N
real(kind=8) :: sink_min = 0.002                 ! min value for sinking happen
real(kind=8) :: transferlight = 0.45             ! the coeffient of change light unit
!real(kind=8) :: transferlight = 1
real(kind=8) :: A             = 10 !10   !/d              ! diffusion coefficient
end module
