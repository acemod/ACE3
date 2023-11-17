#include "..\script_component.hpp"
/*
 * Author: joko // Jonas, BadGuy
 * Handles Inventory UI when vehicle has a Cargo Inventory
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Container <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle] call ace_cargo_fnc_addCargoItem
 *
 * Public: No
 */

if !(GVAR(enable)) exitWith {};

params ["_unit", "_container"];

// This is the 2nd Part of the Hack for Vehicles that dont have an Inventory
if (_container isKindOf "GroundWeaponHolder") then {
    private _target = cursorObject;
    if (!(_target getVariable [QGVAR(hasInventory), true]) && ((ACE_Player distance _target) < MAX_LOAD_DISTANCE) && !lockedInventory _target) then {
        _container = _target;
    };
};

if !(_container getVariable [QGVAR(hasCargo), getNumber (configOf _container >> QGVAR(hasCargo)) == 1]) exitWith {};

GVAR(interactionVehicle) = _container;

GVAR(interactionParadrop) = _container isKindOf "Air" && {
                                private _turretPath = _unit call CBA_fnc_turretPath;
                                (_unit == (driver _container)) || // pilot
                                {(getNumber (([_container, _turretPath] call CBA_fnc_getTurret) >> "isCopilot")) == 1} || // coPilot
                                {_turretPath in (getArray (configOf _container >> QGVAR(loadmasterTurrets)))} // loadMaster turret from config 
                            };

[{!isNull (findDisplay 602)}, {
    private _display = (findDisplay 602); // Find Inventory Display
    private _gY = ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25);
    private _gX = (((safeZoneW / safeZoneH) min 1.2) / 40);


    private _hasInventory = GVAR(interactionVehicle) getVariable [QGVAR(hasInventory), true];
    private _xOffset = [1, -5.25] select (_hasInventory);

    if (_hasInventory) then {
        {
            private _pos = ctrlPosition _x;

            _x ctrlSetPosition [
                (_pos select 0) + 6.25 * _gX,
                (_pos select 1)
            ];
            _x ctrlCommit 0;
        } forEach allControls _display;
    } else {
        {
            (_display displayCtrl _x) ctrlSetFade 1;
            (_display displayCtrl _x) ctrlCommit 0;
        } forEach [1001, 632, 6554, 6307, 6385, 6321];
    };

    private _group = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
    _group ctrlSetPosition [_xOffset * _gX + (safeZoneX + (safeZoneW - ((safeZoneW / safeZoneH) min 1.2)) / 2), _gY + (safeZoneY + (safeZoneH - (((safeZoneW / safeZoneH) min 1.2) / 1.2)) / 2), 12 * _gX, 22.55 * _gY];
    _group ctrlCommit 0;

    private _bg = _display ctrlCreate ["RscBackground", -1, _group];
    _bg ctrlSetPosition [0, 0, 12 * _gX, 23 * _gY];
    _bg ctrlSetBackgroundColor [0.05, 0.05, 0.05, 0.7];
    _bg ctrlCommit 0;

    private _header = _display ctrlCreate ["RscText", -1, _group];
    _header ctrlSetPosition [0.5 * _gX, 0.5 * _gY, 11 * _gX, 1.1 * _gY];
    _header ctrlSetBackgroundColor [0, 0, 0, 1];
    _header ctrlSetText (localize LSTRING(openMenu)); // This localization key is currently "borrowed" we could make it its own key but we dont need to
    _header ctrlCommit 0;

    private _list = _display ctrlCreate ["RscListBox", -1, _group];
    _list ctrlSetPosition [0.5 * _gX, 1.7 * _gY, 11 * _gX, 17.8 * _gY];
    _list ctrlSetBackgroundColor [0, 0, 0, 0];
    _list ctrlCommit 0;
    uiNamespace setVariable [QGVAR(CargoListBox), _list];

    private _unloadBtn = _display ctrlCreate ["RscButton", -1, _group];
    _unloadBtn ctrlSetPosition [0.5 * _gX, 20 * _gY, 5.5 * _gX, 1 * _gY];
    _unloadBtn ctrlSetText localize ([LSTRING(unloadObject), LSTRING(paradropButton)] select GVAR(interactionParadrop));
    _unloadBtn ctrlAddEventHandler ["ButtonClick", {
        private _index = lbCurSel (uiNamespace getVariable QGVAR(CargoListBox));
        if (_index == -1) exitWith {};
        closeDialog 602;
        [_index] call FUNC(startUnload);
    }];
    _unloadBtn ctrlCommit 0;

    private _loadBarFrame = _display ctrlCreate ["RscFrame", -1, _group];
    _loadBarFrame ctrlSetPosition [0.5 * _gX, 21.5 * _gY, 11 * _gX, 0.5 * _gY];
    _loadBarFrame ctrlSetTextColor [0.9, 0.9, 0.9, 0.5];
    _loadBarFrame ctrlCommit 0;
    
    private _loadBar = _display ctrlCreate ["RscProgress", -1, _group];
    _loadBar ctrlSetPosition [0.5 * _gX, 21.5 * _gY, 11 * _gX, 0.5 * _gY];
    _loadBar ctrlSetTextColor [0.9, 0.9, 0.9, 0.9];
    _loadBar progressSetPosition 0;
    _loadBar ctrlCommit 0;

    // UPDATE LOOP
    [{
        params ["_args", "_id"];

        if (isNull (findDisplay 602)) exitWith {
            [_id] call CBA_fnc_removePerFrameHandler;
        };
        _args params ["_loadBar", "_list"];
        private _cargoItems = GVAR(interactionVehicle) getVariable [QGVAR(loaded), []];
        lbClear _list;
        {
            private _displayName = [_x, true] call FUNC(getNameItem);
            
            if (GVAR(interactionParadrop)) then {
                _displayName = format ["%1 (%2s)", _displayName, GVAR(paradropTimeCoefficent) * ([_x] call FUNC(getSizeItem))];
            };
            _list lbAdd _displayName;
        } forEach _cargoItems;

        private _cargoCapacity = GVAR(interactionVehicle) getVariable [QGVAR(spaceMax), getNumber (configOf GVAR(interactionVehicle) >> QGVAR(space))];
        private _usedCargoCapacity = _cargoCapacity - ([GVAR(interactionVehicle)] call FUNC(getCargoSpaceLeft));

        _loadBar progressSetPosition (_usedCargoCapacity / _cargoCapacity);

    }, 1, [_loadBar, _list]] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;
