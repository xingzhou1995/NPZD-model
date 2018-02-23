module bio_process
   contains
   subroutine grazing(P,Z,D,GP,GD)
   ! this program is using to calculate grazing
   use bio_parameter
   implicit none
   real(kind=8) :: P,Z,D,GP,GD !GP is the grazing on P,GD is the graziong on D

   select case(G_function)
   
   case ('origin')
   GP=((lamda*P**2)/(mu**2+P**2))
   case ('Luo')
   GP=Gmax*((sigmaP*P)/(1+sigmaP*P+sigmaD*D))
   GD=Gmax*((sigmaD*D)/(1+sigmaP*P+sigmaD*D))
   !write(*,*) "G=",G
    
    case('Ivlev')
    GP=Gmax*(1-exp(-lamda*P))
    GD=0

 
    case default
    print*,"Invalid G_function,program terminated"
    stop
    end select
   

   end subroutine


   subroutine uptaking(N,P,U)
   ! this program is used to calculating uptaking 
   ! U is the uptaking value
   use bio_parameter
   implicit none
   real(kind=8) :: N,P,U
   real(kind=8) :: N_l,L_l,T_l
  
   !Temperature Limitation   
    select case(T_function) 
    case('Luo')
    T_l=exp(-alphaT*abs(T-To))
    case default
    print*,"Invalid N_function,program terminated"
    stop
    end select
   !Nutrient Limitation
    select case(N_function)
    case ('Michaelis-Menten')
    N_l=((Vm*N)/(e+N))
    case default
    print*,"Invalid N_function,program terminated"
    stop
    end select

   !Light Limitation
    L_function=trim(L_function)
    select case (L_function)
    case ('Saturating_response1')
    L_l=(L/(L0+L))   

    case ('Saturating_response2' )
    L_l=1-exp(-L/L0)

    case ('Edwards_1997')
    L_l=(a)/(b+c*P)
   
    case ('Steele_1962')
    L_l=(L/L0)*exp(-L/L0)

    case ('Luo')
    L_l= (1-exp((-1)*L*(alphaI/umax))*exp((-1)*(betaI/umax)*L))
    !L_l=1
    case default
    print*,"Invalid L_function,program terminated"
    stop
   
    end select
   
!Uptaking
    U=upmax*N_l*L_l*T_l
   !write(*,*) "N_l=",N_l
   !write(*,*) "L_l=",L_l 
   !write(*,*) "T_l=",T_l 
   !write(*,*) "U=",   U
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

   case default
   print*,"Invalid R_function,program terminated"
   stop
   end select

   end subroutine

  subroutine P_respiration(P,PR)
   use bio_parameter
   implicit none
   real(kind=8) :: P,PR  ! RR is the D remineralization
   select case(PR_function)

   case('Luo') 
   PR=gammap*exp(gammat*T)

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

   case default
   print*,"Invalid ZR_function,program terminated"
   stop
   end select

   end subroutine

       
end module bio_process                                                                               
                                                                                                             
