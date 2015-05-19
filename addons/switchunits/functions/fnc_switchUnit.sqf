/*
 * Author: bux578
 * Switches to the new given player unit
 *
 * Arguments:
 * 0: current unit <OBJECT>
 * 1: the unit to switch to <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit] call FUNC(switchUnit)
 *
 * Public: Yes
 */


#include "script_component.hpp"

private ["_nearestEnemyPlayers", "_allNearestPlayers", "_oldUnit", "_leave"];

PARAMS_1(_unit);

// don't switch to original player units
if (!([_unit] call FUNC(isValidAi))) exitWith {};

// exit var
_leave = false;

if (GVAR(EnableSafeZone)) then {

    _allNearestPlayers = [position _unit, GVAR(SafeZoneRadius)] call FUNC(nearestPlayers);
    _nearestEnemyPlayers = [_allNearestPlayers, {((side GVAR(OriginalGroup)) getFriend (side _this) < 0.6) && !(_this getVariable [QGVAR(IsPlayerControlled), false])}] call EFUNC(common,filter);

    if (count _nearestEnemyPlayers > 0) exitWith {
        _leave = true;
    };

};

// exitWith doesn't exit past the "if(EnableSafeZone)" block
if (_leave) exitWith {
    [localize "STR_ACE_SwitchUnits_TooCloseToEnemy"] call EFUNC(common,displayTextStructured);
};

// should switch locality
// This doesn't work anymore, because one's now able to switch to units from a different side
//[_unit] joinSilent group player;
[[_unit, player], QUOTE({(_this select 0) setVariable [ARR_3(QUOTE(QGVAR(OriginalOwner)), owner (_this select 0), true)]; (_this select 0) setOwner owner (_this select 1)}), 1] call EFUNC(common,execRemoteFnc);

_oldUnit = player;


DFUNC(pfhSwitchUnit) = {

    private ["_args", "_unit", "_oldUnit", "_respawnEhId", "_oldOwner"];
    _args = _this select 0;

    _unit = _args select 0;
    _oldUnit = _args select 1;



    if (local _unit) exitWith {

        _oldUnit setVariable [QGVAR(IsPlayerControlled), false, true];
        _oldUnit setVariable [QGVAR(PlayerControlledName), "", true];

        _respawnEhId = _unit getVariable [QGVAR(RespawnEhId), -1];
        if (_respawnEhId != -1) then {
            _oldUnit removeEventHandler ["Respawn", _respawnEhId];
        };

        selectPlayer _unit;

        _unit setVariable [QGVAR(IsPlayerControlled), true, true];
        _unit setVariable [QGVAR(PlayerControlledName), GVAR(OriginalName), true];

        _respawnEhId = _unit addEventHandler ["Respawn", {
            [GVAR(OriginalUnit), _this select 0] call FUNC(switchBack);
        }];
        _unit setVariable [QGVAR(RespawnEhId), _respawnEhId, true];

        // set owner back to original owner
        _oldOwner = _oldUnit getVariable[QGVAR(OriginalOwner), -1];
        if (_oldOwner > -1) then {
            [[_oldUnit, _oldOwner], QUOTE({(_this select 0) setOwner (_this select 1)}), 1] call EFUNC(common,execRemoteFnc);
        };

        [localize "STR_ACE_SwitchUnits_SwitchedUnit"] call EFUNC(common,displayTextStructured);

        [(_this select 1)] call cba_fnc_removePerFrameHandler;

    };
};

[FUNC(pfhSwitchUnit), 0.2, [_unit, _oldUnit]] call cba_fnc_addPerFrameHandler;
