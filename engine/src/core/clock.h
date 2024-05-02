#pragma once

#include "defines.h"

typedef struct clock
{
	f64 start_time;
	f64 elapsed;
}clock;

// Should be called just before checking elapsed time.
// No effect on non-started clock.
void clock_update(clock *clock);

// Resets elapsed time.
void clock_start(clock *clock);

// Does not reset elapsed time.
void clock_stop(clock *clock);
