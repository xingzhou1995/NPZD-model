
program generate_NPZD_namelist
implicit none
real(kind=8) :: N = 0, P = 0, Z = 0, D = 0
real(kind=8) :: L = 0, T = 0
real(kind=8) :: START_TIME = 1,END_TIME = 24,TIME_STEP = 1

character(20) :: L_function = 'Steele_1962'         ! Light Function
character(20) :: N_function = 'Michaelis-Menten'    ! Nutrtition Limitation Function
character(20) :: T_function = 'Luo'                 ! Temperature function
character(20) :: PM_function = 'Linear'             ! P mortality function
character(20) :: ZM_function = 'Quadratic'          ! R mortality function
character(20) :: R_function = 'Linear'              ! D reminerlization function
character(20) :: G_function = 'origin'              ! Grazing
character(20) :: PR_function = 'Luo'                ! P respiration
character(20) :: ZR_function = 'Luo'                ! Z respiration



namelist /NPZD_data/ N,P,Z,D

namelist /NPZD_time/ START_TIME,END_TIME,TIME_STEP

namelist /NPZD_process/ L_function,N_function,PM_function,ZM_function,R_function,G_function,PR_function,ZR_function,T_function

namelist /NPZD_forcing/ L,T

open(22,file="NPZD.nml")
write(22,nml=NPZD_data)
write(22,nml=NPZD_time)
write(22,nml=NPZD_process)
write(22,nml=NPZD_forcing)
close(22)
end
