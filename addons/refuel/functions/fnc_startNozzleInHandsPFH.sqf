#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * PFH while nozzle is in hands.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Nozzle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_refuel_fnc_startNozzleInHandsPFH
 *
 * Public: No
 */

#define UNHOLSTER_WEAPON \
    _unit selectWeapon (_unit getVariable QGVAR(selectedWeaponOnRefuel)); \
    _unit setVariable [QGVAR(selectedWeaponOnRefuel), nil]
#define END_PFH \
    _unit setVariable [QGVAR(hint), nil]; \
    call EFUNC(interaction,hideMouseHint); \
    [_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set); \
    [_unit, "blockThrow", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set); \
    _pfhID call CBA_fnc_removePerFrameHandler

params ["_unit", "_nozzle"];
TRACE_2("start",_unit,_nozzle);

[{
    params ["_args", "_pfhID"];
    _args params ["_unit", "_nozzle", "_isNozzle"];

    if !(
        _unit call EFUNC(common,isAwake)
        && {"" isEqualTo currentWeapon _unit || {_unit call EFUNC(common,isSwimming)}}
        && {[_unit, objNull, [INTERACT_EXCEPTIONS, "notOnMap"]] call EFUNC(common,canInteractWith)}
    ) exitWith {
        TRACE_3("stop dead/weapon/interact/uncon",_unit,alive _unit,currentWeapon _unit);
        [_unit, _nozzle] call FUNC(dropNozzle);
        _unit setVariable [QGVAR(selectedWeaponOnRefuel), nil];
        END_PFH;
    };

    // Check drop from external events
    if (isNull (_unit getVariable [QGVAR(nozzle), objNull])) exitWith {
        TRACE_2("stop drop",_unit,_nozzle);
        UNHOLSTER_WEAPON;
        END_PFH;
    };

    if (isNull objectParent _unit && {_unit isNotEqualTo ACE_player}) exitWith {
        TRACE_2("stop vehicle/player",_unit,vehicle _unit);
        [_unit, _nozzle] call FUNC(dropNozzle);
        UNHOLSTER_WEAPON;
        END_PFH;
    };

    private _hintLMB = "";
    private _hintRMB = LELSTRING(common,Drop);

    getCursorObjectParams params ["_cursorObject", "", "_distance"];

    if (alive _cursorObject && {_distance < REFUEL_NOZZLE_ACTION_DISTANCE}) then {
        if (_cursorObject call FUNC(canConnectNozzle)) then {
            _hintLMB = localize ([LSTRING(connect), LSTRING(connectFuelCanister)] select (_nozzle getVariable [QGVAR(jerryCan), false]));
        };

        if ([_unit, _cursorObject] call FUNC(canReturnNozzle)) then {
            _hintRMB = LLSTRING(return);
        };
    };

    private _hint = [_hintLMB, _hintRMB];

    if (_hint isNotEqualTo (_unit getVariable [QGVAR(hint), []])) then {
        _unit setVariable [QGVAR(hint), _hint];
        _hint call EFUNC(interaction,showMouseHint);
    };
}, 0, [_unit, _nozzle, !(_nozzle getVariable [QGVAR(jerryCan), false])]] call CBA_fnc_addPerFrameHandler;
