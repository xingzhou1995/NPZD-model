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
SUBFILES   = Detritus.f90 \
	     Nutrient.f90 \
	     Phytoplankton.f90 \
	     Zooplankton.f90 \
	     grazing.f90 \
	     uptaking.f90 \
	     NPZD_read.f90 \

# Varibles
EXENAME     = NPZD


# Default target
#all: $(EXENAME).x
#all: $(EXENAME).x
#	make clean
#	make NML
#	make COMPILE
#	make


#LINK:	$(LINKER) $(OBJS) $(DFLAGS) $(EXENAME).x

#       MAKEFILE 1.0 
#COMPILER:	$(EXENAME).x
COMPILE:		
		$(COMPILER) $(MAINFILES) $(MODFILES) $(SUBFILES) $(DFLAGS) $(EXENAME)
#		$(COMPILER) main.f90 NPZD_read.f90 bio_parameter.f90 Nutrient.f90 grazing.f90 uptaking.f90 Phytoplankton.f90 Zooplankton.f90 -o xxx


 
