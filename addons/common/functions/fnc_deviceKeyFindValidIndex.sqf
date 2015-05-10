
#include "script_component.hpp"

DEFAULT_PARAM(0,_offsetBy,0);

_validIndex = -1;
for "_offset" from _offsetBy to ((count GVAR(deviceKeyHandlingArray)) - 1 + _offsetBy) do {
    _realIndex = (GVAR(deviceKeyCurrentIndex) + _offset) % (count GVAR(deviceKeyHandlingArray));
    if ([] call ((GVAR(deviceKeyHandlingArray) select _realIndex) select 2)) exitWith {
        _validIndex = _realIndex;
    };
};
GVAR(deviceKeyCurrentIndex) = _validIndex;
