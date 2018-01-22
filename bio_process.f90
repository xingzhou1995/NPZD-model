module bio_process
   contains
   subroutine grazing(P,Z,G)
   ! this program is using to calculate grazing
   use bio_parameter
   implicit none
   real(kind=8) :: P,Z,G


   G=((lamda*P**2)/(mu**2+P**2))*Z
   
   write(*,*) "G=",G

   end subroutine


   subroutine uptaking(N,P,U,L)
   ! this program is used to calculating uptaking 

   use bio_parameter
   implicit none
   real(kind=8) :: N,P,U,L
   real(kind=8) :: N_l,L_l
   !Nutrient Limitation
    N_l=(N/(e+N))

   !Light Limitation
   
   !Saturating response 1
    L_l=(L/(L0+L))   

   !Saturating respose 2
   !L_l=L-exp(-L/L0)

   !Considering self shading 
   ! L_l=(a*P)/(b+c*P)

   !Uptaking
    U=N_l*L_l
    
   write(*,*) "U=",U

   end subroutine
end module bio_process                                                                               
                                                                                                             
