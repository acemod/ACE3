#include "script_component.hpp"

GVAR(ScrollWheelFrame) = diag_frameno;

call COMPILE_FILE(init_handleScrollWheel);
call COMPILE_FILE(init_handleModifierKey);
