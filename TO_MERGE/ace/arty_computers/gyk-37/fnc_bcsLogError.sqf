//fnc_bcsLogError.sqf
#include "script_component.hpp"

_logText = _this;
_format = format["ERROR: %1", _logText];
_format call FUNC(bcsLog);