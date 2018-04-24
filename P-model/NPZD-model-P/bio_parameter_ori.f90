module bio_parameter
implicit none
! Using for govern equation
real(kind=8) :: alpha = 0.25                         ! Z growth efficiency
real(kind=8) :: beta  = 0.7 !0.7 !(Edward Chen)0.3                         ! Z excretion fraction
real(kind=8) :: gama  = 0.8 !0.3                         ! Regeneration of Z predation excretion (assuming no higher predator)
!real(kind=8) :: r     = 0.15  !/day                  ! P mortality rate
 real(kind=8) :: r     = 0.1!0.01 !0.1 !0.01  !/day                  ! luo option
!real(kind=8) :: dd     = 1.0   !m^3/gC/day            ! Higher Predation on Z
real(kind=8) :: dd     = 0.2 !0.2 !0.02  !/day                  !luo option
real(kind=8) :: k     = 0.05  !/day                  ! Cross-thermocline exchange rate
real(kind=8) :: s     = 0.04  !/day                  ! P sink loss rate
real(kind=8) :: N0    = 0.6   !gC/m^3                ! N concentration below mixed layer
real(kind=8) :: phi   = 0.1   !/day                  ! D remineralization rate
!real(kind=8) :: phi    = 0.5
real(kind=8) :: psi   = 0.08  !/day                  ! D sinking loss rate
! Using for calculating Uptaking and Grazing
!real(kind=8) :: e     = 0.03  !gC/m^3                ! Half-saturation constant for N uptake
real(kind=8)  :: e     = 0.1   !0.6 !0.1  !(Edward)   ! mmol P/m            ! luo option
real(kind=8) :: a     = 0.2   !/m/day                ! a/b gives maximum P growth rate
real(kind=8) :: b     = 0.2   !/m                    ! Light attenuaton by water
real(kind=8) :: c     = 0.4   !m^2/gC/day            ! P self-shading coefficient
real(kind=8) :: lamda = 0.2 !0.2     !0.6   !(umol N 1-1)-1                  ! Ivlev constant for grazing
real(kind=8) :: mu     = 0.035 !gC/m^3                ! Z grazing half-saturation coefficient
!real(kind=8) :: L0    = 0.1                            !determines irradiance at photosynthesis maxium
real(kind=8) :: L0     = 131.5     !131.5                       !basing on FVCOM bio input
real(kind=8) :: Vm    = 1    !do not change it! only change upmax !2 !(chen) 1    ! /day                 ! maximum nutrient uptake rate  

real(kind=8) :: N_0 = 0.0 ! N threshold
real(kind=8) :: P_0 = 0.0 ! P threshold
real(kind=8) :: Z_0 = 0.0 ! Z threshold
real(kind=8) :: D_0 = 0.0 ! D threshold



!luo option
real(kind=8) :: gammap = 0.01!0.01 !0.01 ! /day                 ! phyto respiration coefficient
real(kind=8) :: gammaz = 0.015!0.015 !0.015! /day                 ! zoo   respiration coefficient
real(kind=8) :: gammat = 0.07                        ! exponential for temperature forcing
real(kind=8) :: dr     = 0.015 !0.015! /day                 ! remineralization rate of detritus
real(kind=8) :: Gmax   = 0.4!0.4!0.5!0.4   ! /day                 ! maximum grazing rate by Z
real(kind=8) :: sigmaP = 0.5 !0.5  ! (mmolC/m3)^-1        ! preference coefficient of Z on P
real(kind=8) :: sigmaD = 0.1!0.1!0.1  ! (mmolC/m3)^-1        ! preference coefficient of Z on D
 
real(kind=8) :: To     = 18 !18   ! centigrade           ! maximum growth rate optimal water temperature
real(kind=8) :: alphaT = 0.004 !                     ! temperature correction coefficient on growth rate
real(kind=8) :: alphaI = 14.88e-7 ! mgC/mgCHL/s/W                        ! light parameter relate tothe slope of the light function
real(kind=8) :: betaI  = 4.25e-8  ! mgC (mgCHL s W)-1                       ! photo inhibition
real(kind=8) :: umax   = 4.25e-5 ! mmol C(mgCHL s)-1                           ! maximum growth rate
real(kind=8) :: upmax  = 2.8 !2.8!2.8 !1.0 !2.8 ! /day                 ! maxium growth rate for P
! case  judgment variable
character(20) :: L_function
character(20) :: N_function
character(20) :: T_function
character(20) :: PM_function
character(20) :: ZM_function
character(20) :: R_function
character(20) :: G_function
character(20) :: PR_function
character(20) :: ZR_function
character(20) :: BIO_MODEL

!physical forcing
real(kind=8) :: T   !Temperature 
real(kind=8) :: L   !Light intension


end module bio_parameter
