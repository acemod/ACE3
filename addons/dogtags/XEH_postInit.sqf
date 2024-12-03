#include "script_component.hpp"

if (hasInterface || isServer) then {
    [QGVAR(broadcastDogtagInfo), {
        GVAR(dogtagsData) set _this;

        if (isNil "CBA_fnc_renameInventoryItem") exitWith {}; // requires https://github.com/CBATeam/CBA_A3/pull/1329
        params ["_item", "_dogTagData"];
        private _name = _dogtagData param [0, ""];

        // If data doesn't exist or body has no name, set name as "unknown"
        if (_name == "") then {
            _name = LELSTRING(common,unknown);
        };

        _name = [LLSTRING(itemName), ": ", _name] joinString "";
        [_item, _name] call CBA_fnc_renameInventoryItem;
    }] call CBA_fnc_addEventHandler;

    if (isServer) then {
        // Sync dogtag data from server to client
        [QGVAR(requestSyncDogtagDataJIP), {
            params ["_clientOwner"];

            {
                [QGVAR(broadcastDogtagInfo), [_x, _y], _clientOwner] call CBA_fnc_ownerEvent;
            } forEach GVAR(dogtagsData);
        }] call CBA_fnc_addEventHandler;

        [QGVAR(getDogtagItem), LINKFUNC(getDogtagItem)] call CBA_fnc_addEventHandler;
    } else {
        // To be here, hasInterface must be true
        [QGVAR(requestSyncDogtagDataJIP), clientOwner] call CBA_fnc_serverEvent;
    };
};

if (hasInterface) then {
    // If the arsenal is loaded, show the custom names for dog tags when in the arsenal
    if (["ace_arsenal"] call EFUNC(common,isModLoaded)) then {
        [QEGVAR(arsenal,rightPanelFilled), {
            params ["_display", "_leftPanelIDC", "_rightPanelIDC"];

            if !(_leftPanelIDC in [2010, 2012, 2014] && {_rightPanelIDC == 38}) exitWith {};

            private _rightPanel = _display displayCtrl 15;
            private _cfgWeapons = configFile >> "CfgWeapons";

            TRACE_1("passed",_rightPanel);

            for "_i" from 0 to (lnbSize _rightPanel select 0) - 1 do {
                private _item = _rightPanel lnbData [_i, 0];

                if (_item isKindOf ["ACE_dogtag", _cfgWeapons]) then {
                    private _name = (GVAR(dogtagsData) getOrDefault [_item, []]) param [0, ""];

                    // If data doesn't exist or body has no name, set name as "unknown"
                    if (_name == "") then {
                        _name = LELSTRING(common,unknown);
                    };

                    _rightPanel lnbSetText [[_i, 1], [LLSTRING(itemName), ": ", _name] joinString ""];
                };
            };
        }] call CBA_fnc_addEventHandler;
    };

    // Add context menu option
    [
        "ACE_dogtag",
        ["GROUND", "CARGO", "CONTAINER"],
        LLSTRING(checkItem),
        nil,
        QPATHTOF(data\dogtag_icon_ca.paa),
        [
            {true},
            {true}
        ],
        {
            [GVAR(dogtagsData) getOrDefault [_this select 2, []]] call FUNC(showDogtag);

            false
        }
    ] call CBA_fnc_addItemContextMenuOption;
};

// Add actions and event handlers only if ace_medical is enabled
// - Adding actions via config would create a dependency
["CBA_settingsInitialized", {
    if !(GETEGVAR(medical,enabled,false)) exitWith {};

    if (hasInterface) then {
        private _checkTagAction = [
            "ACE_CheckDogtag",
            format ["%1: %2", LLSTRING(itemName), LLSTRING(checkDogtag)],
            QPATHTOF(data\dogtag_icon_ca.paa),
            {[_player, _target] call FUNC(checkDogtag)},
            {!isNil {_target getVariable QGVAR(dogtagData)}}
        ] call EFUNC(interact_menu,createAction);

        ["ACE_bodyBagObject", 0, ["ACE_MainActions"], _checkTagAction, true] call EFUNC(interact_menu,addActionToClass);

        private _takeTagAction = [
            "ACE_TakeDogtag",
            format ["%1: %2", LLSTRING(itemName), LLSTRING(takeDogtag)],
            QPATHTOF(data\dogtag_icon_ca.paa),
            {[_player, _target] call FUNC(takeDogtag)},
            {(!isNil {_target getVariable QGVAR(dogtagData)}) && {((_target getVariable [QGVAR(dogtagTaken), objNull]) != _target)}}
        ] call EFUNC(interact_menu,createAction);

        ["ACE_bodyBagObject", 0, ["ACE_MainActions"], _takeTagAction, true] call EFUNC(interact_menu,addActionToClass);
    };

    if (isServer) then {
        ["ace_placedInBodyBag", {
            params ["_target", "_bodyBag", "_isGrave"];

            if (_isGrave) exitWith {};
            TRACE_2("ace_placedInBodyBag eh",_target,_bodyBag);

            private _dogtagData = _target call FUNC(getDogtagData);
            _bodyBag setVariable [QGVAR(dogtagData), _dogtagData, true];

            if ((_target getVariable [QGVAR(dogtagTaken), objNull]) == _target) then {
                _bodyBag setVariable [QGVAR(dogtagTaken), _bodyBag, true];
            };
        }] call CBA_fnc_addEventHandler;
    };
}] call CBA_fnc_addEventHandler;

// Disable dog tags for civilians
"CIV_F" call FUNC(disableFactionDogtags);
