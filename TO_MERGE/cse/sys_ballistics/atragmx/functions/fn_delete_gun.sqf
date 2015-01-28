#include "script_component.hpp"

private ["_index"];
_index = lbCurSel 6000;

if (_index == -1) exitWith {};

for "_i" from 0 to (count cse_ab_ATragMX_currentGun) - 1 do {
	if ((cse_ab_ATragMX_currentGun select _i) > _index) then {
		cse_ab_ATragMX_currentGun set [_i, (cse_ab_ATragMX_currentGun select _i) - 1];
	};
};

cse_ab_ATragMX_gunList set [_index, 0];
cse_ab_ATragMX_gunList = cse_ab_ATragMX_gunList - [0];

lbDelete [6000, _index];

profileNamespace setVariable ["cse_ab_ATragMX_gunList", cse_ab_ATragMX_gunList];
