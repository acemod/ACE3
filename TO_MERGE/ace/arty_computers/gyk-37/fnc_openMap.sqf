//fnc_openMap.sqf
#include "script_component.hpp"
_computer = GVAR(currentComputer);
GVAR(openingMap) = true;
closeDialog 754;
openMap true;
_computer spawn {
	_computer = _this;
	waitUntil {
		_vis = visibleMap;
		(!_vis)
	};
	[_computer] call FUNC(startBCS);
	GVAR(openingMap) = false;
};