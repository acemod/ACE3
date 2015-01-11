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
AGM_Scopes_fadeScript = scriptNull;

// show overlay after changing weapon/optic
0 spawn {
  _layer = ["AGM_Scope_Zeroing"] call BIS_fnc_rscLayer;
  while {True} do {
    waitUntil {[AGM_player, 0,0] call AGM_Scopes_fnc_canAdjustScope};
    _layer cutRsc ["AGM_Scope_Zeroing", "PLAIN", 0, false];
    sleep 3;
    _layer cutFadeOut 2;

    _weapon = currentWeapon AGM_player;
    _optics = [AGM_player] call AGM_Scopes_fnc_getOptics;
    waitUntil {sleep 0.05; !(_optics isEqualTo ([AGM_player] call AGM_Scopes_fnc_getOptics)) or (currentWeapon AGM_player != _weapon)};
  };
};

// instantly hide when scoping in
0 spawn {
  _layer = ["AGM_Scope_Zeroing"] call BIS_fnc_rscLayer;
  while {True} do {
    waitUntil {sleep 0.05; cameraView == "GUNNER"};
    if !(isNull AGM_Scopes_fadeScript) then {
      terminate AGM_Scopes_fadeScript;
    };
    _layer cutText ["", "PLAIN", 0];
  };
};
