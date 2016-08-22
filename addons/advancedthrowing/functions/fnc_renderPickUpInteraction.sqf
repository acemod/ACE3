/*
 * Author: PabstMirror, Jonpas
 * When interact_menu starts rendering (from "interact_keyDown" event).
 * Add pick up helpers to all nearby throwables and keep setting them to their position (setVariable and attachTo does not work on CfgAmmo).
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_advancedthrowing_fnc_renderPickUpInteraction
 *
 * Public: No
 */
#include "script_component.hpp"

[{
    params ["_args", "_idPFH"];
    _args params ["_setPosition", "_addedPickUpHelpers", "_throwablesHelped", "_nearThrowables"];

    // isNull is necessarry to prevent rare error when ending mission with interact key down
    if (EGVAR(interact_menu,keyDown) && {!isNull ACE_player}) then {
        // Rescan when player moved >5 meters from last pos, nearObjects is costly
        if ((getPosASL ACE_player) distance _setPosition > 5) then {
             // IR throwbles inherit from GrenadeCore, others from GrenadeHand
            _nearThrowables = ACE_player nearObjects ["GrenadeHand", 10];
            _nearThrowables append (ACE_player nearObjects ["GrenadeCore", 10]);

            {
                if (_x in _throwablesHelped) exitWith {};

                TRACE_2("Making PickUp Helper",_x,typeOf _x);
                private _pickUpHelper = QGVAR(pickUpHelper) createVehicleLocal [0, 0, 0];

                _pickUpHelper attachTo [_x, [0, 0, 0]];
                _pickUpHelper setVariable [QGVAR(throwable), _x];

                _addedPickUpHelpers pushBack _pickUpHelper;
                _throwablesHelped pushBack _x;
                true
            } count _nearThrowables;

            _args set [0, getPosASL ACE_player];
            _args set [3, _nearThrowables];
        };

        {
            if (!GVAR(enablePickUpAttached) && {!isNull (attachedTo _x)}) exitWith {};

            // Only handling with attachTo works nicely
            _x attachTo [_x getVariable [QGVAR(throwable), objNull], [0, 0, 0]];
            true
        } count _addedPickUpHelpers;
    } else {
        TRACE_1("Cleaning Pick Up Helpers",count _addedPickUpHelpers);
        {deleteVehicle _x} count _addedPickUpHelpers;
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };
}, 0, [(getPosASL ACE_player) vectorAdd [-100, 0, 0], [], [], []]] call CBA_fnc_addPerFrameHandler;
