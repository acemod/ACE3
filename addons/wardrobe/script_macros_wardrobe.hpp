// REPLACE
#define INTEL_PRE(varName,className)\
private varName = _magazineDetails findIf { _x select 0 == QUOTE(className) } > -1;\
if (varName) then { _hasDocument = [_player, QUOTE(className)] call CBA_fnc_getMagazineIndex apply { [_x] call FUNC(getIndexFromMagID) } }

#define INTEL_POST(varName,className)\
if (varName isEqualType []) then { { [_x, varName select _forEachIndex] call FUNC(setIndexForMagID); } forEach ( [_player, QUOTE(className)] call CBA_fnc_getMagazineIndex ); }


// Config
//// Adjust Weight of CfgWeapons Wearables.
#define MASS(var)\
class ItemInfo: ItemInfo {\
    mass = var;\
}
