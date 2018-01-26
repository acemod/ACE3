#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

["ACE_RepairItem_Base", "killed", {
    params ["_object"];

    [{deleteVehicle _this}, _object, 5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addClassEventHandler;

// load tracks and wheels
if (isServer) then {
    private _fnc_addSpareItems = {
        if (!GVAR(addSpareParts)) exitWith {};
        params ["_vehicle"];

        private _spareTracks = _vehicle getVariable QGVAR(editorLoadedTracks);
        if (isNil "_spareTracks") then {
            _spareTracks = [0, 1] select (_vehicle isKindOf "Tank"); // must match eden attribute default
        };
        [_vehicle, _spareTracks, "ACE_Track"] call FUNC(addSpareParts);

        private _spareWheels = _vehicle getVariable QGVAR(editorLoadedWheels);
        if (isNil "_spareWheels") then {
            _spareWheels = [0, 1] select (_vehicle isKindOf "Car"); // must match eden attribute default
        };
        [_vehicle, _spareWheels, "ACE_Wheel"] call FUNC(addSpareParts);
    };

    ["Tank", "initPost", _fnc_addSpareItems] call CBA_fnc_addClassEventHandler;
    ["Car", "initPost", _fnc_addSpareItems] call CBA_fnc_addClassEventHandler;
};

ADDON = true;
