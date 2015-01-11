//#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_3(_gun,_pos,_unit);

if (_unit == player) then {
	
	GVAR(activeGun) = _gun;

	[203, [false, false, false], { [-1] call FUNC(adjustTraverse) }, "keydown", QGVAR(leftTraverseSmall)] call CBA_fnc_addKeyHandler;
	[203, [true, false, false], { [-10] call FUNC(adjustTraverse) }, "keydown", QGVAR(leftTraverseLarge)] call CBA_fnc_addKeyHandler;
	[203, [true, true, false], { [-0.25] call FUNC(adjustTraverse) }, "keydown", QGVAR(leftTraverseVerySmall)] call CBA_fnc_addKeyHandler;
	[205, [false, false, false], { [1] call FUNC(adjustTraverse) }, "keydown", QGVAR(rightTraverseSmall)] call CBA_fnc_addKeyHandler;
	[205, [true, false, false], { [10] call FUNC(adjustTraverse) }, "keydown", QGVAR(rightTraverseLarge)] call CBA_fnc_addKeyHandler;
	[205, [true, true, false], { [0.25] call FUNC(adjustTraverse) }, "keydown", QGVAR(rightTraverseVerySmall)] call CBA_fnc_addKeyHandler;
	[200, [false, false, false], { [-1] call FUNC(adjustElevation) }, "keydown", QGVAR(elevateUpSmall)] call CBA_fnc_addKeyHandler;
	[200, [true, false, false], { [-10] call FUNC(adjustElevation) }, "keydown", QGVAR(elevateUpLarge)] call CBA_fnc_addKeyHandler;
	[208, [false, false, false], { [1] call FUNC(adjustElevation) }, "keydown", QGVAR(elevateDownSmall)] call CBA_fnc_addKeyHandler;
	[208, [true, false, false], { [10] call FUNC(adjustElevation) }, "keydown", QGVAR(elevateDownLarge)] call CBA_fnc_addKeyHandler;

	_actionId = _gun addAction ["View Sightunit", QPATHTO_F(fnc_showSight), [], -100, false, true, "", "gunner _target == player"];
	
	if (gunner GVAR(activeGun) == player) then {
		_ammoFunc = {
			if(!isNil QGVAR(activeGun)) then {
				private["_currentRound", "_ammo", "_mag", "_currentWeapon"];
				_currentRound = GVAR(activeGun) getVariable ["ace_sys_arty_currentRound", []];
				_currentWeapon = (weapons GVAR(activeGun)) select 0;
				_ammo = GVAR(activeGun) ammo _currentWeapon;
				if (count _currentRound != 0) then {
					if (count (magazines GVAR(activeGun)) == 0) then {
						_mag = _currentRound select 0;
						GVAR(activeGun) removeWeapon _currentWeapon;
						GVAR(activeGun) addMagazine _mag;
						GVAR(activeGun) addWeapon _currentWeapon;
						GVAR(activeGun) selectWeapon _currentWeapon;
						reload GVAR(activeGun);
					};
				};
				if (count (magazines GVAR(activeGun)) != 0) then {
					if (count _currentRound == 0) then {
						_mag = currentMagazine GVAR(activeGun);
						GVAR(activeGun) removeWeapon _currentWeapon;
						GVAR(activeGun) removeMagazines _mag;               
						GVAR(activeGun) addWeapon _currentWeapon;
						GVAR(activeGun) selectWeapon _currentWeapon;
						reload GVAR(activeGun);
					};
				};
			} else {
				[(_this select 1)] call CBA_fnc_removePerFrameHandler;
			};
		};
		[_ammoFunc, 0.25] call CBA_fnc_addPerFrameHandler;
	};
	
	GVAR(gunActionIds) set[count GVAR(gunActionIds), _actionId];
};
