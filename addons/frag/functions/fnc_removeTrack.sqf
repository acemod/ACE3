#include "script_component.hpp"

private _ret = true;
if (IS_ARRAY(_this select 0)) then {
    _ret = false;
} else {
    if ((_this select 0) in GVAR(trackedObjects)) then {
        REM(GVAR(trackedObjects),_this select 0);
    } else {
        _ret = false;
    };
};
_ret
