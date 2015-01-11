//fnc_bcsLogWarn.sqf
#include "script_component.hpp"

_logText = _this;
_format = format["WARNING: %1", _logText];
_format call FUNC(bcsLog);