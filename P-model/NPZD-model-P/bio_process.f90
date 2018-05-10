module bio_process
   contains
   subroutine grazing(P,Z,D,GP,GD)
   ! this program is using to calculate grazing
   use bio_parameter
   implicit none
   real(kind=8) :: P,Z,D,GP,GD !GP is the grazing on P,GD is the graziong on D
   real(kind=8) :: GRATE,RTOTAL !using in case Rowe
   select case(G_function)
   
   case ('origin')
   GP=((lamda*P**2)/(mu**2+P**2))
   case ('Luo')
   GP=Gmax*((sigmaP*P)/(1+sigmaP*P+sigmaD*D))
   GD=Gmax*((sigmaD*D)/(1+sigmaP*P+sigmaD*D))
   !write(*,*) "G=",G
   !write(*,*) "GP=",GP 
   !write(*,*) "GD=",GD 
   case('Rowe')
  GRATE=Gmax*exp(gammatz*(T-Toptz))
  RTOTAL=KZG**M_G
  GP=GRATE*((sigmaP*P**M_G)/(RTOTAL+sigmaP*P**M_G+sigmaD*D**M_G))
  GD=GRATE*((sigmaD*D**M_G)/(RTOTAL+sigmaP*P**M_G+sigmaD*D**M_G))
    case('Ivlev')
    GP=Gmax*(1-exp(-lamda*P))
   ! GD=0
    GD=Gmax*(1-exp(-lamda*D))

 
    case default
    print*,"Invalid G_function,program terminated"
    stop
    end select
 !  write(*,*) "GP=",GP   

   end subroutine


   subroutine uptaking(N,P,U)
   ! this program is used to calculating uptaking 
   ! U is the uptaking value
   use bio_parameter
   implicit none
   real(kind=8) :: N,P,U
   !real(kind=8) :: N_l,L_l,T_l
   real(kind=8) :: IK !using in Rowe case
   !Temperature Limitation   
    select case(T_function) 
    case('Luo')
    T_l=exp(-alphaTP*abs(T-Toptp))
    !write(*,*) T_l
    case('Rowe')
    T_l=exp(alphaTP*(T-Toptp))
    case default
    print*,"Invalid N_function,program terminated"
    stop
    end select
   !Nutrient Limitation
    select case(N_function)
    case ('Michaelis-Menten')
   ! N_l=((Vm*N)/(e+N))
   !  xing test 2018
     if ((N-No).gt.0.0) then
     N_l=(N-No)/(e+N-No)
     else
     N_l=0.0
     end if

    case default
    print*,"Invalid N_function,program terminated"
    stop
    end select

   !Light Limitation
    !write(*,*) L
    L_function=trim(L_function)
    select case (L_function)
    case ('Saturating_response1')
    L_l=(L/(L0))   

    case ('Saturating_response2' )
    L_l=1-exp(-L/L0)

    case ('Edwards_1997')
    L_l=(a)/(b+c*P)
   
    case ('Steele_1962')
    L_l=(L/L0)*exp(-L/L0)

    case ('Luo')
  !xing test
   
   ! L_l= (1-exp((-1)*0.006*L*(alphaI/umax)))*exp((-1)*(betaI/umax)*L*0.006)
    L_l= (1-exp((-1)*L*(alphaI/umax)))*exp((-1)*(betaI/umax)*L)
    !L_l=1
    case('Rowe')
    IK=(upmax*T_l*N_l)/alphaI
    if (IK.LE. 69.0) IK=69.0
    if (IK.GE.108.0) IK=108.0 
   
     L_l=(1-exp((-1)*L/IK))*exp((-1)*(betaI*L)/(IK*alphaI))
    case default
    print*,"Invalid L_function,program terminated"
    stop
   
    end select
        

!Uptaking
    U=upmax*N_l*L_l*T_l
   open(unit=77,file="uptaking1.dat")
   !write(*,*) T_l
   !write(*,*) U
   write(77,*) N_l,L_l,T_l,U  
   end subroutine
   
   subroutine P_mortality(P,PM)
   use bio_parameter
   implicit none
   real(kind=8) :: P,PM  ! PM is the mortality of P
   select case (PM_function)
   
   case('Linear')   
   PM=r
   
   case default
   print*,"Invalid PM_function,program terminated"
   stop
   end select
   
   end subroutine
   
   subroutine Z_mortality(Z,ZM)
   use bio_parameter
   implicit none
   real(kind=8) :: Z,ZM ! ZM is the mortality of Z
   select case (ZM_function)
   
   case ('Linear')
   ZM=dd
   case ('Quadratic')
   ZM=dd*Z
  
   case default
   print*,"Invalid ZM_function,program terminated"
   stop
   end select

   end subroutine
 
   subroutine remineralization(D,RR)
   use bio_parameter
   implicit none
   real(kind=8) :: D,RR  ! RR is the D remineralization
   select case(R_function)
  
   case ('Linear')
   RR=phi
   case('Luo')
   RR=dr*exp(gammat*T)   
   ! RR=0.0378
   case default
   print*,"Invalid R_function,program terminated"
   stop
   end select

   end subroutine

  subroutine P_respiration(P,PR,U)
   use bio_parameter
   implicit none
   real(kind=8) :: P,PR,U  ! RR is the D remineralization
   select case(PR_function)

   case('Luo') 
   PR=gammap*exp(gammat*T)
   case('Rowe')
   PR=gammap*T_l+U*0.3  !origin:PR=gammap*T_l*P+U_P*0.3*P
  !  PR=0.0252
   case default
   print*,"Invalid PR_function,program terminated"
   stop
   end select

   end subroutine

   subroutine Z_respiration(Z,ZR)
   use bio_parameter
   implicit none
   real(kind=8) :: Z,ZR  ! RR is the D remineralization
   select case(ZR_function)

   case('Luo') 
   ZR=gammaz*exp(gammat*T)
   ! ZR=0.0378
   !write(*,*) "ZR=",ZR    

   case('Rowe')
   ZR=gammaz*exp(gammat*(T-Toptz))

   case default
   print*,"Invalid ZR_function,program terminated"
   stop
   end select

   end subroutine

       
end module bio_process                                                                               
                                                                                                            
