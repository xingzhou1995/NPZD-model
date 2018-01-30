#! /bin/bash


gfortran bio_parameter.f90 -c -o bio_parameter.o
gfortran bio_process.f90 -c -o bio_process.o
gfortran main.f90 NPZD_read.f90 -o test.o
gfortran bio_parameter.o bio_process.o test.o -
