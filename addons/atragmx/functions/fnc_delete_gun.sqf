#include "script_component.hpp"

private ["_index"];
_index = lbCurSel 6000;

if (_index == -1) exitWith {};

for "_i" from 0 to (count GVAR(ATragMX_currentGun)) - 1 do {
    if ((GVAR(ATragMX_currentGun) select _i) > _index) then {
        GVAR(ATragMX_currentGun) set [_i, (GVAR(ATragMX_currentGun) select _i) - 1];
    };
};

GVAR(ATragMX_gunList) set [_index, 0];
GVAR(ATragMX_gunList) = GVAR(ATragMX_gunList) - [0];

lbDelete [6000, _index];

profileNamespace setVariable ["ACE_ATragMX_gunList", GVAR(ATragMX_gunList)];
