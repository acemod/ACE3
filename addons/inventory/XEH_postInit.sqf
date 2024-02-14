#include "script_component.hpp"

if (!hasInterface) exitWith {};

// If medical_treatment is loaded, get its items
if (["ace_medical_treatment"] call EFUNC(common,isModLoaded)) then {
    private _medicalList = +(uiNamespace getVariable [QGVAR(medicalItemList), createHashMap]);

    _medicalList merge [uiNamespace getVariable [QEGVAR(medical_treatment,treatmentItems), createHashMap], true];

    GVAR(medicalItemList) = compileFinal _medicalList;
} else {
    GVAR(medicalItemList) = uiNamespace getVariable [QGVAR(medicalItemList), compileFinal createHashMap];
};

GVAR(customFilters) = [];
GVAR(selectedFilterIndex) = -1;

// Add custom filters
[LLSTRING(Grenades), QFUNC(filterGrenades)] call FUNC(addCustomFilter);
[LLSTRING(Backpacks), QFUNC(filterBackpacks)] call FUNC(addCustomFilter);
[LLSTRING(Uniforms), QFUNC(filterUniforms)] call FUNC(addCustomFilter);
[LLSTRING(Vests), QFUNC(filterVests)] call FUNC(addCustomFilter);
[LLSTRING(Headgear), QFUNC(filterHeadgear)] call FUNC(addCustomFilter);
[LLSTRING(Medical), QFUNC(filterMedical)] call FUNC(addCustomFilter);

// Used for displaying the correct name when opening a subordinate's inventory
GVAR(unit) = ACE_player;

["CAManBase", "InventoryOpened", {
    params ["_unit", "_container"];

    // GVAR(unit) is ACE_player by default
    if (_unit isEqualTo ACE_player) exitWith {};

    // If the player is a group leader and opens a subordinate's inventory or has a subordinate open the player's backpack, update name to correct unit
    if (leader ACE_player == ACE_player && {(_unit in units ACE_player) || {(objectParent _container) isEqualTo ACE_player}}) then {
        GVAR(unit) = _unit;
    };
}] call CBA_fnc_addClassEventHandler;
