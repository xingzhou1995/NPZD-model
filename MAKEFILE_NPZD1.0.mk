# Makefile for NPZD
#
#
#

# Compiler, linker, compilation and optimization options

COMPILER = gfortran
LINKER   = gfortran
CFLAGS   = -c
DFLAGS   = -o
# PROGRAM NAME
MAINFILES  = main.f90
MODFILES   = bio_parameter.f90
PREFILES   = generate_NPZD_namelist.f90
SUBFILES   = Detritus.f90 \
	     Nutrient.f90 \
	     Phytoplankton.f90 \
	     Zooplankton.f90 \
	     bio_parameter.f90 \
	     grazing.f90 \
	     uptaking.f90 \
	     NPZD_read.f90 \

# Varibles
MAINPROGRAM = $(echo "${MAINFILES}" | awk -F '.' '{ print $1 }')
SUBPROGRAM  = $(echo "${SUBFILES}" | awk -F '.' '{ print $1 }')
MODPROGRAM  = $(echo "${MODFILES}" | awk -F '.' '{ print $1 }')
#PREPROGRAM  = $(echo "$(PREFILES)" | awk -F '.' '{ print $1 }')
PREPROGRAM   = generate_NPZD_namelist
OBJS        = $(MAINPROGRAM).o $(SUBPROGRAM).o $(MODPROGRAM).o  
EXENAME     = NPZD


# Default target
all: $(EXENAME).x
all:
	make clean
	make NML
	make COMPILE

#LINK:	$(LINKER) $(OBJS) $(DFLAGS) $(EXENAME).x

#COMPILER:	$(EXENAME).x
COMPILE:		
		$(COMPILER) $(MAINFLES) $(MODFILES) $(SUBFILES) $(DFLAGS) $(EXENAME).x

#NML:		$(EXENAME).nml
NML:		
#		./$(PREPROGRAM).x
		$(COMPILER) $(PREFILES) $(DFLAGS) $(PREPROGRAM).x  
		./$(PREPROGRAM).x	

clean:
	rm -f *.x
	rm -f *.nml
 
