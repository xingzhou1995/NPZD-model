module phy_parameter

implicit none
save

!using for light decay in the water
real(kind=8) :: kext                     !diffuese attenution coefficent
real(kind=8) :: att_water=0.07!0.07 !/m water attenuation
real(kind=8) :: att_phyto=0.03!0.03!0.03 !mgchl^-1m^2 !phytoplankton attenuation
real(kind=8) :: att_detritus=0.2!0.2!0.2 !g*detritusC^-1/m^2 !detritus attenuation
real(kind=8) :: att_turbidity=0.0 !turbidity attenuation


real(kind=8) :: Wn   = 0.0 ! m/d                 !sinking velocity of N
real(kind=8) :: Wp   = 0.6!0.04 !0.6 ! m/d                 !sinking velocity of N
real(kind=8) :: Wz   = 0.0 ! m/d                 !sinking velocity of N
real(kind=8) :: Wd   = 0.6 !0.6 ! m/d                 !sinking velocity of N
real(kind=8) :: sink_min = 0.002                 ! min value for sinking happen
!real(kind=8) :: transferlight = 0.6   ! 0.45             ! the coeffient of change light unit
real(kind=8) :: transferlight = 0.006!0.6 ! 0.6  !1.0
!real(kind=8) :: A             = 0.864 !0.864 !10   !/d              ! diffusion coefficient
real(kind=8) :: A_N = 0.864!0.864!1e-5!0.01!864   !DIFFUSION COEEFICENT OF A 
real(kind=8) :: A_P = 0.864!0.864!1e-5!0.01!864  !DIFFUSION COEEFICENT OF P
real(kind=8) :: A_Z = 0.864!0.864!1e-5!0.01!864  !DIFFUSION COEFFICENT OF Z
real(kind=8) :: A_D = 0.864!0.864!1e-5!0.01!864 !DOFFUSION COEEFICENT OF D
end module
