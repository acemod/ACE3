#include "script_component.hpp"
/*
 * Author: PabstMirror, mharis001
 * Dynamically adds "Defuse" actions to nearby mines when interact_menu is opened.
 * Called by the "ace_interactMenuOpened" event.
 *
 * Arguments:
 * Interact Menu Type (0 - World, 1 - Self) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call ace_explosives_fnc_interactEH
 *
 * Public: No
 */

params ["_interactionType"];
TRACE_1("Explosives interactEH",_interactionType);

// Ignore self-interaction menu or mounted vehicle interaction
// For performance reasons only add PFH if player has a defusal kit
// If player somehow gets a defusal kit during keyDown, they will just have to reopen menu
if (
    _interactionType != 0
    || {vehicle ACE_player != ACE_player}
    || {!("ACE_DefusalKit" in (ACE_player call EFUNC(common,uniqueItems)))}
) exitWith {};

[{
    BEGIN_COUNTER(interactEH);
    params ["_args", "_pfhID"];
    _args params ["_setPosition", "_addedHelpers", "_minesHelped"];

    if (!EGVAR(interact_menu,keyDown)) then {
        TRACE_1("Cleaning defuse helpers",count _addedHelpers);
        {deleteVehicle _x} forEach _addedHelpers;
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    } else {
        // Prevent Rare Error when ending mission with interact key down
        private _player = ACE_player;
        if (isNull _player) exitWith {};
        private _playerPos = getPosASL _player;

        // Rescan if player has moved more than 5 meters from last position
        if (_playerPos distanceSqr _setPosition > 25) then {
            private _cfgAmmo = configFile >> "CfgAmmo";
            {
                if (_x distanceSqr _player < 225 && {!(_x in _minesHelped)} && {!(_x in GVAR(excludedMines))} && {getModelInfo _x select 0 isNotEqualTo "empty.p3d"}) then {
                    private _config = _cfgAmmo >> typeOf _x;
                    private _size = getNumber (_config >> QGVAR(size));
                    private _defuseClass = ["ACE_DefuseObject", "ACE_DefuseObject_Large"] select (_size == 1);
                    private _defusePos = getArray (_config >> QGVAR(defuseObjectPosition));
                    if (_defusePos isEqualTo []) then {
                        _defusePos = [0, 0, 0];
                    };

                    TRACE_4("Creating defuse helper",_x,typeOf _x,_defuseClass,_defusePos);
                    private _helper = _defuseClass createVehicleLocal [0, 0, 0];

                    _helper attachTo [_x, _defusePos];
                    _helper setVariable [QGVAR(Explosive), _x];
                    _addedHelpers pushBack _helper;
                    _minesHelped pushBack _x;
                };
            } forEach allMines;

            _args set [0, _playerPos];
        };
    };
    END_COUNTER(interactEH);
}, 0.5, [getPosASL ACE_player vectorAdd [-100, 0, 0], [], []]] call CBA_fnc_addPerFrameHandler;
