#include "defines.h"

#define __dsp (uiNamespace getVariable "RscProtractor")
#define __ctrl1 (__dsp displayCtrl 132950)
#define __ctrl2 (__dsp displayCtrl 132951)

private ["_inclinationAngle", "_refPosition"];

if (cse_AB_Protractor) exitWith {
	cse_AB_Protractor = false;
	1 cutText ["", "PLAIN"];
	true
};
if (weaponLowered player) exitWith { true };
if (vehicle player != player) exitWith { true };
if (currentWeapon player != primaryWeapon player) exitWith { true };

[] spawn {
	2 cutText ["", "PLAIN"];
	cse_AB_WindInfo = false;
	0 cutText ["", "PLAIN"];
	cse_AB_Protractor = true;

	while {cse_AB_Protractor && !(weaponLowered player) && currentWeapon player == primaryWeapon player} do {
		_refPosition = [SafeZoneX + 0.001, SafeZoneY + 0.001, 0.2, 0.2 * 4/3];

		_inclinationAngle = asin((player weaponDirection currentWeapon player) select 2);
		_inclinationAngle = -58 max _inclinationAngle min 58;

		1 cutRsc ["RscProtractor", "PLAIN", 1, false];

		__ctrl1 ctrlSetScale 0.75;
		__ctrl1 ctrlCommit 0;
		__ctrl1 ctrlSetText "cse\cse_sys_ballistics\advancedballistics\data\protractor.paa";
		__ctrl1 ctrlSetTextColor [1, 1, 1, 1];

		__ctrl2 ctrlSetScale 0.75;
		__ctrl2 ctrlSetPosition [(_refPosition select 0), (_refPosition select 1) - 0.0012 * _inclinationAngle, (_refPosition select 2), (_refPosition select 3)];
		__ctrl2 ctrlCommit 0;
		__ctrl2 ctrlSetText "cse\cse_sys_ballistics\advancedballistics\data\protractor_marker.paa";
		__ctrl2 ctrlSetTextColor [1, 1, 1, 1];

		sleep 0.1;
	};

	cse_AB_Protractor = false;
	1 cutText ["", "PLAIN"];
};

true
