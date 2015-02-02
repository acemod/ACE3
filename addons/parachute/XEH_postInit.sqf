#include "script_component.hpp"
if (!hasInterface) exitWith {};

["ACE3", localize "STR_ACE_Parachute_showAltimeter",
{
  if (!('ACE_Altimeter' in assignedItems ace_player)) exitWith {false};
  if (isNull (missionNamespace getVariable ['ACE_Parachute_AltimeterFnc', scriptNull])) then {
    [ace_player] call ACE_Parachute_fnc_showAltimeter
  } else {
    call ACE_Parachute_fnc_hideAltimeter
  };
  true
}, [24, false, false, false], false, "keydown"] call CALLSTACK(cba_fnc_registerKeybind);

[] spawn {
  ACE_Parachuting_PFH = false;
  while {true} do {
    sleep 1;
    // I believe this doesn't work for Zeus.
    // vehicle _player
    if (!ACE_Parachuting_PFH && {(vehicle ACE_player) isKindOf "ParachuteBase"}) then {
      ACE_Parachuting_PFH = true;
      ["ACE_ParachuteFix", "OnEachFrame", {call ACE_Parachute_fnc_onEachFrame;}] call BIS_fnc_addStackedEventHandler;
    };
  };
};

// don't show speed and height when in expert mode
["Parachute", {if (!cadetMode) then {_dlg = _this select 0; {(_dlg displayCtrl _x) ctrlShow false} forEach [121, 122, 1004, 1005, 1006, 1014];};}] call ACE_Core_fnc_addInfoDisplayEventHandler;  //@todo addEventHandler infoDisplayChanged with select 1 == "Parachute"
["Soldier", {if (!cadetMode) then {_dlg = _this select 0; {_ctrl = (_dlg displayCtrl _x); _ctrl ctrlSetPosition [0,0,0,0]; _ctrl ctrlCommit 0;} forEach [380, 382]};}] call ACE_Core_fnc_addInfoDisplayEventHandler;  //@todo addEventHandler infoDisplayChanged with select 1 == "Soldier"
