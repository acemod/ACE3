/*
 * Author: KoffeinFlummi
 *
 * Initializes vars needed for scope adjustment and watches for scope changes.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 */

#include "script_component.hpp"

GVAR(fadeScript) = scriptNull;

// show overlay after changing weapon/optic
0 spawn {
  _layer = [QGVAR(Zeroing)] call BIS_fnc_rscLayer;
  while {True} do {
    waitUntil {[ACE_player, 0,0] call FUNC(canAdjustScope)};
    _layer cutRsc [QGVAR(Zeroing), "PLAIN", 0, false];
    sleep 3;
    _layer cutFadeOut 2;

    _weapon = currentWeapon ACE_player;
    _optics = [ACE_player] call FUNC(getOptics);
    waitUntil {sleep 0.05; !(_optics isEqualTo ([ACE_player] call FUNC(getOptics))) or (currentWeapon ACE_player != _weapon)};
  };
};

// instantly hide when scoping in
0 spawn {
  _layer = [QGVAR(Zeroing)] call BIS_fnc_rscLayer;
  while {True} do {
    waitUntil {sleep 0.05; cameraView == "GUNNER"};
    if !(isNull GVAR(fadeScript)) then {
      terminate GVAR(fadeScript);
    };
    _layer cutText ["", "PLAIN", 0];
  };
};
