program test
implicit none
real(kind=8) :: N = -9999, P = -9999,Z = -9999,D = -9999
real(kind=8) :: START_TIME = 1,END_TIME = 365,TIME_STEP = 1

namelist /NPZD_data/ N,P,Z,D

namelist /NPZD_time/ START_TIME,END_TIME,TIME_STEP

open(22,file="NPZD.nml")
write(22,nml=NPZD_data)
write(22,nml=NPZD_time)
close(22)
end
