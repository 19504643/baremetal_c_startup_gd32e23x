#include <stdint.h>
#include <string.h>
#include <stdio.h>

#include "gd32e23x.h"
#include "systick.h"


// define used registers
static volatile unsigned &RCC_AHB1 = *reinterpret_cast<unsigned *>(0x40021014);
static volatile unsigned &GPIOA_MODER = *reinterpret_cast<unsigned *>(0x48000000);
static volatile unsigned &GPIOA_BSRR = *reinterpret_cast<unsigned *>(0x48000018);

// #include <cmath>

#define DELAY_USE_SYSTICK    1
#define DELAY_USE_WAITING    0


void delay_ms(uint32_t ms)
{
    volatile uint32_t count, i;
    for(count = 0; count < ms; count++) {
        for(i = 0; i < 7200; i++) {
            __asm("NOP");
        }
    }
}


void main_app()
{
    SystemInit();
    
    systick_config();
    
    rcu_periph_clock_enable(RCU_GPIOA);
    gpio_mode_set(GPIOA, GPIO_MODE_OUTPUT, GPIO_PUPD_PULLUP, GPIO_PIN_12);
    gpio_output_options_set(GPIOA, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, GPIO_PIN_12);
    
    while(1) {
        gpio_bit_set(GPIOA, GPIO_PIN_12);
        
        delay_1ms(500);

#if DELAY_USE_WAITING
        delay_ms(500);
#elif DELAY_USE_SYSTICK
        delay_1ms(500);
#endif

        gpio_bit_reset(GPIOA, GPIO_PIN_12);
        
        delay_1ms(500);

#if DELAY_USE_WAITING
        delay_ms(500);
#elif DELAY_USE_SYSTICK
        delay_1ms(500);
#endif
    }
}
