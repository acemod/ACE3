#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * MCLOS mouse input handler
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Handled
 *
 * Example:
 * [] call ace_missileguidance_fnc_MCOLS_mouseInput
 *
 * Public: No
 */

private _player = ACE_player;

if (!alive _player) exitWith { false };
if !([_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitWith { false };

private _shooter = objNull;
private _weapons = [];
if ((isNull objectParent _player) || {_player call CBA_fnc_canUseWeapon}) then {
    _shooter = _player;
    private _currentWeapon = currentWeapon _shooter;
    if (_currentWeapon != "") then { _weapons pushBack _currentWeapon };
} else {
    _shooter = vehicle _player;
    private _turretPath = _shooter unitTurret _player;
    _weapons = _shooter weaponsTurret _turretPath;
};

if ((_weapons findIf {
    private _weapon = _x;
    GVAR(mclos_weapons) getOrDefaultCall [_weapon, {
        ((compatibleMagazines _weapon) findIf {
            private _mag = _x;
            private _ammo = getText (configFile >> "CfgMagazines" >> _mag >> "ammo");
            ("MCLOS" in getArray (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "seekerTypes"))
    }) != -1}, true]
}) == -1) exitWith { false };

playSound "ACE_Sound_Click";
createDialog QGVAR(mouseInputDialog);

private _halfX = safeZoneW / 16;
private _halfY = (4/3) * _halfX; // Maintain aspect ratio;
private _centerX = 0.5;
private _centerY = 1 min (safeZoneH - 2 * _halfY);

private _display = uiNamespace getVariable [QGVAR(mouseInputDialog), displayNull];
private _background = _display displayCtrl 1000;
_background ctrlSetBackgroundColor [0, 0, 0, 0.25]; // Semi-transparent background
_background ctrlSetPosition [_centerX - _halfX, _centerY - _halfY, _halfX * 2, _halfY * 2];
_background ctrlCommit 0;

// Set initial mouse position to the center
setMousePosition [_centerX, _centerY];
TRACE_1("start mouse input",typeOf _shooter);
[{
    params ["_args", "_pfID"];
    _args params ["_shooter", "_halfX", "_halfY", "_centerX", "_centerY"];
    private _display = uiNamespace getVariable [QGVAR(mouseInputDialog), displayNull];
    if ((!alive ACE_player) ||
        {!alive _shooter} ||
        {!([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith))} ||
        {!GVAR(MCLOS_mouseInput)} ||
        {isNull _display}
    ) exitWith {
        TRACE_1("stop mouse input",typeOf _shooter);
        if (!isNull _display) then {
            closeDialog 1;
        };
        [_pfID] call CBA_fnc_removePerFrameHandler;
        _shooter setVariable [QGVAR(MCLOS_direction), nil, true];
        playSound "ACE_Sound_Click";
        GVAR(MCLOS_mouseInput) = false;
    };

    getMousePosition params ["_mouseX", "_mouseY"];
    private _minX = _centerX - _halfX;
    private _maxX = _centerX + _halfX;
    private _minY = _centerY - _halfY;
    private _maxY = _centerY + _halfY;
    private _clampX = (_mouseX min _maxX) max _minX;
    private _clampY = (_mouseY min _maxY) max _minY;
    private _realX = linearConversion [_minX, _maxX, _clampX, -1, 1, true];
    private _realY = linearConversion [_minY, _maxY, _clampY, 1, -1, true]; // Inverted Y axis for the mouse
    setMousePosition [_clampX, _clampY];


    private _joystickIcon = _display displayCtrl 2000;
    private _iconWidth = _halfX * 0.2;
    private _iconHeight = _halfY * 0.2;
    _joystickIcon ctrlSetPosition [_clampX - _iconWidth * 0.5, _clampY - _iconHeight * 0.5, _iconWidth, _iconHeight];
    _joystickIcon ctrlCommit 0;

    #ifdef DEBUG_MODE_FULL
    systemChat format ["Mouse Position: %1, %2", _realX, _realY];
    #endif

    _shooter setVariable [QGVAR(MCLOS_direction), [_realX, 0, _realY]];
}, 0, [_shooter, _halfX, _halfY, _centerX, _centerY]] call CBA_fnc_addPerFrameHandler;

true
