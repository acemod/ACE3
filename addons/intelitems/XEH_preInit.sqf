#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (isServer) then {
    // Master Count - only on server and needed before postInit
    GVAR(intelCount) = 0;

    // Map of all magazine ids and their corresponding intel index
    GVAR(intelMap) = [true] call CBA_fnc_createNamespace;
    publicVariable QGVAR(intelMap);

    // Namespace of intel indices and their corresponding data
    GVAR(intelData) = [true] call CBA_fnc_createNamespace;
    publicVariable QGVAR(intelData);

    [QGVAR(handleMagIndex), LINKFUNC(handleMagIndex)] call CBA_fnc_addEventHandler;
    [QGVAR(setObjectData), LINKFUNC(setObjectData)] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
    // Array of all open controls groups
    GVAR(controlsGroups) = [];

    // Hash to track controls group positions on map between closing
    GVAR(controlsData) = createHashMap;
};

// Arsenal Eventhandler to preserve IntelItems Data
[
    QEGVAR(arsenal,displayOpened),
    {
        private _unit = EGVAR(arsenal,center);
        private _allMags = (magazinesAmmoFull _unit) apply { toLower (_x#0) };
        private _exceptions = [];
        // get old MagID's if any intel item is in loadout
        {
            private _className = toLower _x;
            if (_className in _allMags) then {
                _exceptions pushBack [
                    _className,
                    [_unit, _className] call CBA_fnc_getMagazineIndex,
                    []
                ];
            };
        } forEach ["acex_intelitems_document", "acex_intelitems_notepad", "acex_intelitems_photo"];

        diag_log format ['[CVO](debug)(XEH_preInit display opened) _init: %1', _exceptions];
        // If anything has been found, store it in GVAR
        if (_exceptions isNotEqualTo []) then { GVAR(preservationDuringArsenal) = _exceptions; };
    }
] call CBA_fnc_addEventHandler;
[
    QEGVAR(arsenal,displayClosed),
    {
        if (isNil QGVAR(preservationDuringArsenal)) exitWith {};
        
        // Check if any Intel Items are to be preserved
        private _exceptions = missionNamespace getVariable QGVAR(preservationDuringArsenal);

        // get new MagID's
        { _x set [ 2, [EGVAR(arsenal,center), _x#0] call CBA_fnc_getMagazineIndex ]; } forEach _exceptions;

        private _map = GVAR(intelMap);
        {
            _x params ["", "_oldMagIDs", "_newMagIDs"];

            private _qtyNewMagIDs = count _newMagIDs;
            if (count _oldMagIDs > _qtyNewMagIDs) then { _oldMagIDs resize _qtyNewMagIDs; };
            
            {
                private _oldMagID = _x;
                private _newMagID = _newMagIDs select _forEachIndex;
                private _intelID = _map getVariable [_oldMagID, -1];

                if (_intelID == -1) then { continue };
                diag_log format ['[CVO](debug)(XEH_preInit) _oldMagID: %1 - _newMagID: %2 - _intelID: %3', _oldMagID , _newMagID ,_intelID];
                _map setVariable [_newMagID, _intelID, true];
                
            } forEach _oldMagIDs;
        } forEach _exceptions;

        GVAR(preservationDuringArsenal) = nil;
    }
] call CBA_fnc_addEventHandler;

ADDON = true;
