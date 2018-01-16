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
#MAINPROGRAM = $(echo "${MAINFILES}" | awk -F '.' '{ print $1 }')
#SUBPROGRAM  = $(echo "${SUBFILES}" | awk -F '.' '{ print $1 }')
#MODPROGRAM  = $(echo "${MODFILES}" | awk -F '.' '{ print $1 }')
#PREPROGRAM  = $(echo "$(PREFILES)" | awk -F '.' '{ print $1 }')
MAINPROGRAM  = main
PREPROGRAM   = generate_NPZD_namelist
MODPROGRAM   = bio_parameter
OBJS        = $(MAINPROGRAM).o $(MODPROGRAM).o
EXENAME     = NPZD


# Default target
#all: $(EXENAME).x
#all: $(EXENAME).x
#	make clean
#	make NML
#	make COMPILE
#	make

all:
	make clean
	make NML
	make MOD
	make MAIN
	make LINK

#LINK:	$(LINKER) $(OBJS) $(DFLAGS) $(EXENAME).x

#       MAKEFILE 1.0 
#COMPILER:	$(EXENAME).x
#COMPILE:		
#		$(COMPILER) $(MAINFLES) $(MODFILES) $(SUBFILES) $(DFLAGS) $(EXENAME).x

#	MAKEFILE 1.0 DEBUG 1

#$(EXENAME).x: $(MAINPROGRAM).o $(MODPROGRAM).mod
LINK:
		$(COMPILER) $(OBJS) -lm -o $(EXENAME).x

#$(MAINPROGRAM).o: $(MAINFILES) $(SUBFILES)
MAIN:
		$(COMPILER) $(MAINFILES) $(SUBFILES) $(DFLAGS) $(MAINPROGRAM).o

#$(MODPROGRAM).mod: $(MODFILES)
MOD:
		$(COMPILER) $(MODFILES) -c $(DFLAGS) $(MODPROGRAM).o


#	MAKEFILE 2.0
#Detritus.o: Detritus.f90
#	$(COMPILER) Detritus.f90 -c $(DFLAGS) Detritus.o





#NML:		$(EXENAME).nml
NML:		
#		./$(PREPROGRAM).x
		$(COMPILER) $(PREFILES) $(DFLAGS) $(PREPROGRAM).x  
		./$(PREPROGRAM).x	

clean:
	rm -f *.mod	
	rm -f *.o	
	rm -f *.x
	rm -f *.nml
 
