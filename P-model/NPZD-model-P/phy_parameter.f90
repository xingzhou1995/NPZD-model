module phy_parameter


!using for light decay in the water
real(kind=8) :: kext = 0.06!0.06 !0.1 !/m                     !diffuese attenution coefficent
real(kind=8) :: Wn   = 4 ! m/d                 !sinking velocity of N
real(kind=8) :: Wp   = 6!0.04 !0.6 ! m/d                 !sinking velocity of N
real(kind=8) :: Wz   = 8 ! m/d                 !sinking velocity of N
real(kind=8) :: Wd   = 0.08 !0.6 ! m/d                 !sinking velocity of N
real(kind=8) :: sink_min = 0.002                 ! min value for sinking happen
real(kind=8) :: transferlight = 1   ! 0.45             ! the coeffient of change light unit
!real(kind=8) :: transferlight = 1
!real(kind=8) :: A             = 0.864 !0.864 !10   !/d              ! diffusion coefficient
real(kind=8) :: A_N = 0.864!0.864!1e-5!0.01!864   !DIFFUSION COEEFICENT OF A 
real(kind=8) :: A_P = 0.864!0.864!1e-5!0.01!864  !DIFFUSION COEEFICENT OF P
real(kind=8) :: A_Z = 0.864!0.864!1e-5!0.01!864  !DIFFUSION COEFFICENT OF Z
real(kind=8) :: A_D = 0.864!0.864!1e-5!0.01!864 !DOFFUSION COEEFICENT OF D
end module
