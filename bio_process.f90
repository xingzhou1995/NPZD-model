module bio_process
   contains
   subroutine grazing(P,Z,G)
   ! this program is using to calculate grazing
   use bio_parameter
   implicit none
   real(kind=8) :: P,Z,G


   G=((lamda*P**2)/(mu**2+P**2))
   
   !write(*,*) "G=",G

   end subroutine


   subroutine uptaking(N,P,U,L)
   ! this program is used to calculating uptaking 

   use bio_parameter
   implicit none
   real(kind=8) :: N,P,U,L
   real(kind=8) :: N_l,L_l
   
   !Nutrient Limitation
    select case(N_function)
    case ('Michaelis-Menten')
    N_l=(Vm*N/(e+N))
    
    case default
    print*,"Invalid N_function,program terminated"
    stop
    end select

   !Light Limitation
    select case (L_function)
    case ('Saturating_response_1')
    L_l=(L/(L0+L))   

    case ('Saturating_respose_2' )
    L_l=L-exp(-L/L0)

    case ('Edwards_1997')
    L_l=(a)/(b+c*P)
   
    case ('Steele_1962')
    L_l=(L/L0)*exp(-L/L0)
 
    case default
    print*,"Invalid L_function,program terminated"
    stop
   
    end select
   
!Uptaking
    U=N_l*L_l
    
   !write(*,*) "U=",U

   end subroutine
   
   subroutine P_excretion(P,I)
   use bio_parameter
   implicit none
   real(kind=8) :: P,I
   select case (P_exc_function)
   
   case('Linear')   
   I=r
   
   case default
   print*,"Invalid P_exc_function,program terminated"
   stop
   end select
   
   end subroutine
   
   subroutine Z_excretion(Z,J)
   use bio_parameter
   implicit none
   real(kind=8) :: Z,J
   select case (Z_exc_function)
   
   case ('Quadratic')
   J=dd*Z
  
   case default
   print*,"Invalid Z_exc_function,program terminated"
   stop
   end select

   end subroutine
 
   subroutine remineralization(D,RR)
   use bio_parameter
   implicit none
   real(kind=8) :: D,RR
   select case(R_function)
   
   case ('Linear')
   RR=phi
   
   case default
   print*,"Invalid R_function,program terminated"
   stop
   end select

   end subroutine

end module bio_process                                                                               
                                                                                                             
