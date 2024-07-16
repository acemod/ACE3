#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Loads an object into a vehicle.
 * Objects loaded via classname remain virtual until unloaded.
 *
 * Arguments:
 * 0: Item to be loaded <STRING> or <OBJECT> (default: "")
 * 1: Holder object (vehicle) <OBJECT> (default: objNull)
 * 2: Ignore interaction distance and stability checks <BOOL> (default: false)
 *
 * Return Value:
 * Object loaded <BOOL>
 *
 * Example:
 * ["ACE_Wheel", cursorObject] call ace_cargo_fnc_loadItem
 *
 * Public: Yes
 */

params [["_item", "", [objNull, ""]], ["_vehicle", objNull, [objNull]], ["_ignoreInteraction", false, [false]]];
TRACE_3("params",_item,_vehicle,_ignoreInteraction);

// Get config sensitive case name
if (_item isEqualType "") then {
    _item = _item call EFUNC(common,getConfigName);
};

if !([_item, _vehicle, _ignoreInteraction] call FUNC(canLoadItemIn)) exitWith {
    TRACE_3("cannot load",_item,_vehicle,_ignoreInteraction);

    false // return
};

private _loaded = _vehicle getVariable [QGVAR(loaded), []];
_loaded pushBack _item;
_vehicle setVariable [QGVAR(loaded), _loaded, true];

TRACE_1("added to loaded array",_loaded);

// Update cargo space remaining
private _cargoSpace = _vehicle call FUNC(getCargoSpaceLeft);
private _itemSize = (_item call FUNC(getSizeItem)) max 0; // don't let negative size items increase space
_vehicle setVariable [QGVAR(space), _cargoSpace - _itemSize, true];

// Attach object 100m below vehicle
if (_item isEqualType objNull) then {
    detach _item;

    if !(_vehicle setVehicleCargo _item) then {
        private _itemsCargo = _loaded arrayIntersect getVehicleCargo _vehicle;
        private _cargoNet = createVehicle [GVAR(cargoNetType), [0, 0, 0], [], 0, "CAN_COLLIDE"];
        if ([_vehicle, _cargoNet, _itemsCargo] call FUNC(canItemCargo)) then {
            while {!(_vehicle setVehicleCargo _cargoNet)} do { // Move ViV cargo to ACE Cargo
                if (_itemsCargo isEqualTo []) exitWith {deleteVehicle _cargoNet; /*Should not happen*/};
                private _itemViV = _itemsCargo deleteAt 0;

                if !(objNull setVehicleCargo _itemViV) exitWith {deleteVehicle _cargoNet;};

                _itemViV setVariable [QGVAR(cargoNet), _cargoNet, true];
                _itemViV attachTo [_vehicle, [0,0,-100]];
                [QEGVAR(common,hideObjectGlobal), [_itemViV, true]] call CBA_fnc_serverEvent;

                // Some objects below water will take damage over time and eventualy become "water logged" and unfixable (because of negative z attach)
                [_itemViV, "blockDamage", "ACE_cargo", true] call EFUNC(common,statusEffect_set);
            };
        } else {
            deleteVehicle _cargoNet;
        };
        if !(isNull _cargoNet) then {
            _cargoNet setVariable [QGVAR(isCargoNet), true, true];
            _item setVariable [QGVAR(cargoNet), _cargoNet, true];
        };

        _item attachTo [_vehicle, [0, 0, -100]];
        [QEGVAR(common,hideObjectGlobal), [_item, true]] call CBA_fnc_serverEvent;

        if (["ace_zeus"] call EFUNC(common,isModLoaded)) then {
            private _objectCurators = objectCurators _item;

            // Save which curators had this object as editable
            _item setVariable [QGVAR(objectCurators), _objectCurators, true];

            if (_objectCurators isEqualTo []) exitWith {};

            [QEGVAR(zeus,removeObjects), [[_item], _objectCurators]] call CBA_fnc_serverEvent;
        };
    
        // Some objects below water will take damage over time, eventually becoming "water logged" and unfixable (because of negative z attach)
        [_item, "blockDamage", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
    };
};

// Invoke listenable event
["ace_cargoLoaded", [_item, _vehicle]] call CBA_fnc_globalEvent;

true // return
