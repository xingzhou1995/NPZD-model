module bio_parameter

! Using for govern equation
real(kind=8) :: alpha =            ! transformation rate from P to Z
real(kind=8) :: beta  =            ! excretion rate from P to N
real(kind=8) :: r     =            ! respiration rate from P to D
real(kind=8) :: d     =            ! excreation rate from Z to N
real(kind=8) :: phi   =            ! remineralization from D to N

! Using for calculating Uptaking and Grazing
real(kind=8) :: e     =
real(kind=8) :: a     =
real(kind=8) :: b     =
real(kind=8) :: c     =
real(kind=8) :: lamda =
real(kind=8) :: u     =

end module bio_parameter
