#include <hidef.h> /* for EnableInterrupts macro */
#include "derivative.h" /* include peripheral declarations */




int casagrande =0;
void main(void) {
  EnableInterrupts;
  /* include your code here */

  

  for(;;) {
    __RESET_WATCHDOG();	/* feeds the dog */
    casagrande++;
  } /* loop forever */
  /* please make sure that you never leave main */
}
