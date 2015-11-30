/*
 * Author: bux578
 * Switches to the new given player unit
 *
 * Arguments:
 * 0: the unit to switch to <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit] call ace_switchunits_fnc_switchUnit
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_nearestEnemyPlayers", "_allNearestPlayers", "_oldUnit", "_leave"];

params ["_unit"];

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
    [localize LSTRING(TooCloseToEnemy)] call EFUNC(common,displayTextStructured);
};

// should switch locality
// This doesn't work anymore, because one's now able to switch to units from a different side
//[_unit] joinSilent group player;
[[_unit, player], QUOTE({(_this select 0) setVariable [ARR_3(QUOTE(QGVAR(OriginalOwner)), owner (_this select 0), true)]; (_this select 0) setOwner owner (_this select 1)}), 1] call EFUNC(common,execRemoteFnc);

[{
    private ["_respawnEhId", "_oldOwner"];
    params ["_args", "_pfhId"];
    _args params ["_unit", "_oldUnit"];

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

        [localize LSTRING(SwitchedUnit)] call EFUNC(common,displayTextStructured);

        [_pfhId] call CBA_fnc_removePerFrameHandler;
    };
}, 0.2, [_unit, player]] call CBA_fnc_addPerFrameHandler;
