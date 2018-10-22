/** ###################################################################
**     This component module is generated by Processor Expert. Do not modify it.
**     Filename    : Vectors.c
**     Project     : tt
**     Processor   : MC9S08SH8MPJ
**     Version     : Component 01.008, Driver 01.40, CPU db: 3.00.067
**     Compiler    : CodeWarrior HCS08 C Compiler
**     Date/Time   : 2018-10-10, 10:19, # CodeGen: 4
**     Abstract    :
**         This component "MC9S08SH8_20" contains initialization 
**         of the CPU and provides basic methods and events for 
**         CPU core settings.
**     Settings    :
**
**
**     Copyright : 1997 - 2014 Freescale Semiconductor, Inc. 
**     All Rights Reserved.
**     
**     Redistribution and use in source and binary forms, with or without modification,
**     are permitted provided that the following conditions are met:
**     
**     o Redistributions of source code must retain the above copyright notice, this list
**       of conditions and the following disclaimer.
**     
**     o Redistributions in binary form must reproduce the above copyright notice, this
**       list of conditions and the following disclaimer in the documentation and/or
**       other materials provided with the distribution.
**     
**     o Neither the name of Freescale Semiconductor, Inc. nor the names of its
**       contributors may be used to endorse or promote products derived from this
**       software without specific prior written permission.
**     
**     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
**     ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
**     WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
**     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
**     ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
**     (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
**     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
**     ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
**     (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
**     SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**     
**     http: www.freescale.com
**     mail: support@freescale.com
** ###################################################################*/
/*!
** @file Vectors.c                                                  
** @version 01.40
** @brief
**         This component "MC9S08SH8_20" contains initialization 
**         of the CPU and provides basic methods and events for 
**         CPU core settings.
*/         
/*!
**  @addtogroup Vectors_module Vectors module documentation
**  @{
*/         


#include "Cpu.h"
#include "AS1.h"

/*lint -save  -e950 Disable MISRA rule (1.1) checking. */
static void (* near const _vect[])(void) @0xFFC0 = { /* Interrupt vector table */
/*lint -restore Enable MISRA rule (1.1) checking. */
         Cpu_Interrupt,                /* Int.no. 31 VReserved31 (at FFC0)           Unassigned */
         Cpu_Interrupt,                /* Int.no. 30 Vacmp (at FFC2)                 Unassigned */
         Cpu_Interrupt,                /* Int.no. 29 VReserved29 (at FFC4)           Unassigned */
         Cpu_Interrupt,                /* Int.no. 28 VReserved28 (at FFC6)           Unassigned */
         Cpu_Interrupt,                /* Int.no. 27 VReserved27 (at FFC8)           Unassigned */
         Cpu_Interrupt,                /* Int.no. 26 Vmtim (at FFCA)                 Unassigned */
         Cpu_Interrupt,                /* Int.no. 25 Vrtc (at FFCC)                  Unassigned */
         Cpu_Interrupt,                /* Int.no. 24 Viic (at FFCE)                  Unassigned */
         Cpu_Interrupt,                /* Int.no. 23 Vadc (at FFD0)                  Unassigned */
         Cpu_Interrupt,                /* Int.no. 22 VReserved22 (at FFD2)           Unassigned */
         Cpu_Interrupt,                /* Int.no. 21 Vportb (at FFD4)                Unassigned */
         Cpu_Interrupt,                /* Int.no. 20 Vporta (at FFD6)                Unassigned */
         Cpu_Interrupt,                /* Int.no. 19 VReserved19 (at FFD8)           Unassigned */
         AS1_InterruptTx,              /* Int.no. 18 Vscitx (at FFDA)                Used */
         AS1_InterruptRx,              /* Int.no. 17 Vscirx (at FFDC)                Used */
         AS1_InterruptError,           /* Int.no. 16 Vscierr (at FFDE)               Used */
         Cpu_Interrupt,                /* Int.no. 15 Vspi (at FFE0)                  Unassigned */
         Cpu_Interrupt,                /* Int.no. 14 Vtpm2ovf (at FFE2)              Unassigned */
         Cpu_Interrupt,                /* Int.no. 13 Vtpm2ch1 (at FFE4)              Unassigned */
         Cpu_Interrupt,                /* Int.no. 12 Vtpm2ch0 (at FFE6)              Unassigned */
         Cpu_Interrupt,                /* Int.no. 11 Vtpm1ovf (at FFE8)              Unassigned */
         Cpu_Interrupt,                /* Int.no. 10 VReserved10 (at FFEA)           Unassigned */
         Cpu_Interrupt,                /* Int.no.  9 VReserved9 (at FFEC)            Unassigned */
         Cpu_Interrupt,                /* Int.no.  8 VReserved8 (at FFEE)            Unassigned */
         Cpu_Interrupt,                /* Int.no.  7 VReserved7 (at FFF0)            Unassigned */
         Cpu_Interrupt,                /* Int.no.  6 Vtpm1ch1 (at FFF2)              Unassigned */
         Cpu_Interrupt,                /* Int.no.  5 Vtpm1ch0 (at FFF4)              Unassigned */
         Cpu_Interrupt,                /* Int.no.  4 VReserved4 (at FFF6)            Unassigned */
         Cpu_Interrupt,                /* Int.no.  3 Vlvd (at FFF8)                  Unassigned */
         Cpu_Interrupt,                /* Int.no.  2 Virq (at FFFA)                  Unassigned */
         Cpu_Interrupt,                /* Int.no.  1 Vswi (at FFFC)                  Unassigned */
         _EntryPoint                   /* Int.no.  0 Vreset (at FFFE)                Reset vector */
};
/*!
** @}
*/
/*
** ###################################################################
**
**     This file was created by Processor Expert 10.3 [05.09]
**     for the Freescale HCS08 series of microcontrollers.
**
** ###################################################################
*/

