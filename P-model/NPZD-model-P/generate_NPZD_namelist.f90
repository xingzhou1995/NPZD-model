
program generate_NPZD_namelist
implicit none
!real(kind=8) :: N = 0, P = 0, Z = 0, D = 0
!real(kind=8) :: L = 0, T = 0
real(kind=8) :: START_TIME = 1,END_TIME = 24,TIME_STEP = 1,dh = 5

character(20) :: INPDIR="../input/"
character(20) :: OUTDIR="../output/"

character(20) :: NPZD_in    = "input.txt"
character(20) :: NPZD_T_in  = "temp.txt"
character(20) :: NPZD_l_in  = "light.txt"
character(20) :: NPZD_out   = "output.txt"

character(20) :: L_function = 'Steele_1962'         ! Light Function
character(20) :: N_function = 'Michaelis-Menten'    ! Nutrtition Limitation Function
character(20) :: T_function = 'Luo'                 ! Temperature function
character(20) :: PM_function = 'Linear'             ! P mortality function
character(20) :: ZM_function = 'Quadratic'          ! R mortality function
character(20) :: R_function = 'Linear'              ! D reminerlization function
character(20) :: G_function = 'origin'              ! Grazing
character(20) :: PR_function = 'Luo'                ! P respiration
character(20) :: ZR_function = 'Luo'                ! Z respiration
character(20) :: BIO_MODEL   = 'NPZD'               ! BIOLOGY MODEL PART

logical(kind=4) :: RESTART_ON
logical(kind=4) :: NPZD_SECONDS
real(kind=8) :: RESTART_INTERVAL = 10

namelist /NPZD_SELECT/ BIO_MODEL,NPZD_SECONDS
namelist /NPZD_IO/ INPDIR,OUTDIR
namelist /NPZD_RESTART/ RESTART_ON,RESTART_INTERVAL

namelist /NPZD_data/ NPZD_in,NPZD_T_in,NPZD_L_in,NPZD_out

namelist /NPZD_time/ START_TIME,END_TIME,TIME_STEP,dh

namelist /NPZD_bioprocess/ L_function,N_function,PM_function,ZM_function,R_function,G_function,PR_function,ZR_function,T_function

!namelist /NPZD_forcing/ L,T

open(22,file="NPZD.nml")
!write(22,nml=NPZD_data)
write(22,nml=NPZD_SELECT)
write(22,nml=NPZD_IO)
write(22,nml=NPZD_RESTART)
write(22,nml=NPZD_data)
write(22,nml=NPZD_time)
write(22,nml=NPZD_bioprocess)
!write(22,nml=NPZD_forcing)
close(22)
end
