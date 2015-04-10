#include "script_component.hpp"

private ["_ret"];
_ret = [(_this select 0)] call FUNC(removeTrack);
if(!_ret) then {
    [(_this select 0)] call FUNC(addBlackList);
};