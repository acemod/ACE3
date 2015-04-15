#include "script_component.hpp"

ADDON = false;


FUNC(getIn) = {
	PARAMS_3(_launcher,_pos,_unit);
	if (_unit == ACE_player) then {
        GVAR(dragonLauncher) = _this select 0;
        GVAR(dragonLauncher) animate ["optic_hide", 0];
        GVAR(dragonLauncher) animate ["rest_rotate", 0];
	};
};

FUNC(getOut) = {
	PARAMS_3(_launcher,_pos,_unit);
	if (_unit == player) then {
		GVAR(dragonLauncher) animate ["optic_hide", 1];
		GVAR(dragonLauncher) animate ["rest_rotate", -0.35];
		//GVAR(dragonLauncher) removeMagazines "Dragon_EP1";
		GVAR(dragonLauncher) = nil;
	};
};

FUNC(onFired) = {
	GVAR(dragonLauncher) animate ["missile_hide", 1];
};

ADDON = true;