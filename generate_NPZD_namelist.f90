
program generate_NPZD_namelist
implicit none
real(kind=8) :: N = 0, P = 0, Z = 0, D = 0, L = 0
real(kind=8) :: START_TIME = 1,END_TIME = 24,TIME_STEP = 1

character(20) :: L_function = 'STEELE 1962'
character(20) :: N_function = 'Michaelis-Menten'
character(20) :: P_exc_function = 'Linear'
character(20) :: Z_exc_function = 'Quadratic'
character(20) :: R_function = 'Linear'



namelist /NPZD_data/ N,P,Z,D,L

namelist /NPZD_time/ START_TIME,END_TIME,TIME_STEP

namelist /NPZD_process/ L_function,N_function,P_exc_function,Z_exc_function,R_function

open(22,file="NPZD.nml")
write(22,nml=NPZD_data)
write(22,nml=NPZD_time)
write(22,nml=NPZD_process)
close(22)
end
