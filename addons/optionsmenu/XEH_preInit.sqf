#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(clientSideOptions) = [];
GVAR(clientSideColors) = [];

GVAR(serverConfigGeneration) = 0;
GVAR(ClientSettingsExportIncluded) = false;
GVAR(serverSideOptions) = [];
GVAR(serverSideColors) = [];
GVAR(serverSideValues) = [];
GVAR(categories) = [];
GVAR(currentCategorySelection) = 0;

recomp = {
#include "XEH_PREP.hpp"
};

[] spawn {
    sleep 0.1; //is3den command has problems at pre-init, need spawn/sleep
    if (!is3DEN) exitWith {};
    ACE_LOGINFO("3den detected, localizing settings");

    //Post-init won't run in 3den, so we need to directly call some settings funcs normally run at common: post-init
    call EFUNC(common,loadSettingsFromProfile);
    call EFUNC(common,loadSettingsLocalizedText);

    //Get Categories
    GVAR(categories) pushBack "";  //Ensure All Catagories is at top
    {
        GVAR(categories) pushBackUnique (_x select 8);
    } forEach EGVAR(common,settings);


    disableSerialization;

    waitUntil {!isNull (findDisplay 313)};

    if ((findDisplay 313) getVariable [QGVAR(menuSet), false]) exitWith {TRACE_1("menu already set",true);};
    TRACE_1("Setting up menu",false);
    (findDisplay 313) setVariable [QGVAR(menuSet), true];

    private _3denDisplay = findDisplay 313;

    private _menuItemsArray = getArray (configfile >> "Display3DEN" >> "Controls" >> "MenuStrip" >> "Items" >> "items");
    private _aceIndex = _menuItemsArray find "ACE_Settings";

    TRACE_1("",_aceIndex);

    {
        private _displayName = _x;
        if (_displayName == "") then {
            _displayName = localize LSTRING(Uncategorized);
        };
        private _addedIndex = (_3denDisplay displayCtrl 120) menuAdd [[_aceIndex], _displayName];
        TRACE_3("Adding",_x,_displayName,_addedIndex);
        (_3denDisplay displayCtrl 120) menuSetAction [[_aceIndex,_addedIndex], QUOTE(call recomp; _this call FUNC(3den_openSettingsDisplay);)];
        (_3denDisplay displayCtrl 120) menuSetValue [[_aceIndex,_addedIndex], _forEachIndex];
    } forEach GVAR(categories);

    private _addedIndex = (_3denDisplay displayCtrl 120) menuAdd [[_aceIndex], format [" - %1 - ", localize LSTRING(Export)]];
    (_3denDisplay displayCtrl 120) menuSetAction [[_aceIndex,_addedIndex], QUOTE(call recomp; _this call FUNC(3den_exportToClipboard);)];

};
ADDON = true;
