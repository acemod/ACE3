#include "script_component.hpp"
#include "defines.hpp"

GVAR(currentBox) = objNull;

GVAR(EH_ID) = 0;
GVAR(lastSearchTextLeft) = "";
GVAR(lastSearchTextRight) = "";
GVAR(lastSearchTextLoadouts) = "";
GVAR(lastSortLeft) = "";
GVAR(lastSortRight) = "";
GVAR(lastSortDirectionLeft) = DESCENDING;
GVAR(lastSortDirectionRight) = DESCENDING;

[QGVAR(initBox), LINKFUNC(initBox)] call CBA_fnc_addEventHandler;
[QGVAR(removeBox), LINKFUNC(removeBox)] call CBA_fnc_addEventHandler;
[QGVAR(addDefaultLoadout), LINKFUNC(addDefaultLoadout)] call CBA_fnc_addEventHandler;
[QGVAR(removeDefaultLoadout), LINKFUNC(removeDefaultLoadout)] call CBA_fnc_addEventHandler;
[QGVAR(renameDefaultLoadout), LINKFUNC(renameDefaultLoadout)] call CBA_fnc_addEventHandler;

[QGVAR(refresh), {
    params ["_object"];

    // If the arsenal is already open, refresh arsenal display
    if (!isNil QGVAR(currentBox) && {GVAR(currentBox) isEqualTo _object}) then {
        [true, true] call FUNC(refresh);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(broadcastFace), {
    params ["_unit", "_face"];
    _unit setFace _face;
}] call CBA_fnc_addEventHandler;

[QGVAR(broadcastVoice), {
    params ["_unit", "_voice"];
    _unit setSpeaker _voice;
}] call CBA_fnc_addEventHandler;

[QGVAR(loadoutUnshared), {
    params ["_contentPanelCtrl" , "_playerName", "_loadoutName"];

    // If player is in arsenal in the shared tab and a loadout is unshared at the same time
    if (!isNil QGVAR(currentLoadoutsTab) && {GVAR(currentLoadoutsTab) == IDC_buttonSharedLoadouts}) then {
        private _dataToCheck = _playerName + _loadoutName;

        for "_lbIndex" from 0 to (lnbSize _contentPanelCtrl select 0) - 1 do {
            if ((_contentPanelCtrl lnbData [_lbIndex, 1]) == _dataToCheck) exitWith {
                _contentPanelCtrl lnbDeleteRow _lbIndex;
            };
        };
    } else {
        if (profileName == _playerName && {!(isNil QGVAR(currentLoadoutsTab) && {GVAR(currentLoadoutsTab) == IDC_buttonMyLoadouts})}) then {
            for "_lbIndex" from 0 to (lnbSize _contentPanelCtrl select 0) - 1 do {
                if ((_contentPanelCtrl lnbText [_lbIndex, 1]) == _loadoutName) exitWith {
                    _contentPanelCtrl lnbSetPicture [[_lbIndex, 0], QPATHTOF(data\iconPublicBlank.paa)];
                    _contentPanelCtrl lnbSetValue [[_lbIndex, 0], 0];
                };
            };
        };
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(loadoutShared), {
    params ["_contentPanelCtrl", "_loadoutArgs"];
    _loadoutArgs params ["_playerName", "_loadoutName", "_loadoutData"];

    // If player is in arsenal in the shared tab and a loadout is shared at the same time
    if (!isNil QGVAR(currentLoadoutsTab) && {GVAR(currentLoadoutsTab) == IDC_buttonSharedLoadouts}) then {
        private _curSelData = _contentPanelCtrl lnbData [lnbCurSelRow _contentPanelCtrl, 1];

        ([_loadoutData] call FUNC(verifyLoadout)) params ["_extendedLoadout", "_nullItemsAmount", "_unavailableItemsAmount"];
        _extendedLoadout params ["_loadout"];

        private _newRow = _contentPanelCtrl lnbAddRow [_playerName, _loadoutName];
        private _cfgWeapons = configFile >> "CfgWeapons";

        ADD_LOADOUTS_LIST_PICTURES

        _contentPanelCtrl lnbSetData [[_newRow, 1], _playerName + _loadoutName];

        // Set color of row, depending if items are unavailable/missing
        if (_nullItemsAmount > 0) then {
            _contentPanelCtrl lnbSetColor [[_newRow, 1], [1, 0, 0, 0.8]];
        } else {
            if (_unavailableItemsAmount > 0) then {
                _contentPanelCtrl lnbSetColor [[_newRow, 1], [1, 1, 1, 0.25]];
            };
        };

        // Sort loadouts alphabetically
        _contentPanelCtrl lnbSort [1, false];

        // Select previously selected loadout
        for "_lbIndex" from 0 to (lnbSize _contentPanelCtrl select 0) - 1 do {
            if ((_contentPanelCtrl lnbText [_lbIndex, 1]) == _curSelData) exitWith {
                _contentPanelCtrl lnbSetCurSelRow _lbIndex
            };
        };
    };
}] call CBA_fnc_addEventHandler;

["CBA_loadoutSet", {
    params ["_unit", "_loadout", "_extendedInfo"];

    // Set face
    private _face = _extendedInfo getOrDefault [QGVAR(face), ""];

    if (_face != "") then {
        if (isMultiplayer) then {
            private _id = [QGVAR(broadcastFace), [_unit, _face], QGVAR(centerFace_) + netId _unit] call CBA_fnc_globalEventJIP;
            [_id, _unit] call CBA_fnc_removeGlobalEventJIP;
        } else {
            _unit setFace _face;
        };
    };

    // Set voice
    private _voice = _extendedInfo getOrDefault [QGVAR(voice), ""];

    if (_voice != "") then {
        if (isMultiplayer) then {
            private _id = [QGVAR(broadcastVoice), [_unit, _voice], QGVAR(centerVoice_) + netId _unit] call CBA_fnc_globalEventJIP;
            [_id, _unit] call CBA_fnc_removeGlobalEventJIP;
        } else {
            _unit setSpeaker _voice;
        };
    };

    // Set insignia
    private _insignia = _extendedInfo getOrDefault [QGVAR(insignia), ""];

    if (_insignia != "") then {
        _unit setVariable ["BIS_fnc_setUnitInsignia_class", nil];
        [_unit, _insignia] call BIS_fnc_setUnitInsignia;
    };
}] call CBA_fnc_addEventHandler;

["CBA_loadoutGet", {
    params ["_unit", "_loadout", "_extendedInfo"];

    // Set face if enabled
    if (GVAR(loadoutsSaveFace)) then {
        _extendedInfo set [QGVAR(face), face _unit];
    };

    // Set voice if enabled
    if (GVAR(loadoutsSaveVoice)) then {
        _extendedInfo set [QGVAR(voice), speaker _unit];
    };

    // Set insignia if enabled
    if (GVAR(loadoutsSaveInsignia)) then {
        private _insignia = _unit call BIS_fnc_getUnitInsignia;

        if (_insignia != "") then {
            _extendedInfo set [QGVAR(insignia), _insignia];
        };
    };
}] call CBA_fnc_addEventHandler;

// Compatibility for RHS attachment system. Also used by NIArms.
// Will only work for ACE_player, different arsenal centers will be ignored. RHS limitation.
if (!isNil "rhs_fnc_accGripod") then {
    [QEGVAR(arsenal,weaponItemChanged), {
        params ["_weapon", "_item", "_itemIndex"];
        if (EGVAR(arsenal,center) != ACE_player) exitWith {};

        switch (_itemIndex) do {
            case ITEM_INDEX_SIDE: {
                call rhs_fnc_anpeq15_rail;
            };
            case ITEM_INDEX_BIPOD: {
                // Need this call to make sure RHS's functions are set
                call rhs_fnc_accGripod;
                if (getText (configFile >> "CfgWeapons" >> _item >> "rhs_grip_type") == "") then {
                    call rhs_grip_deinitialize;
                };
            };
        };
    }] call CBA_fnc_addEventHandler;
};
