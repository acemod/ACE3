// CBA Settings
#define SET(var1) TRIPLES(ADDON,set,var1)
#define QSET(var1) QUOTE(SET(var1))
#define QQSET(var1) QQ(SET(var1))
#define ESET(var1,var2) TRIPLES(DOUBLES(PREFIX,var1),SET,var2)
#define QESET(var1,var2) QUOTE(ESET(var1,var2))
#define QQESET(var1,var2) QQ(ESET(var1,var2))

// LSTRING for cba Settings
#define SETLSTRING(key) [LSTRING(DOUBLES(set,key)),LSTRING(TRIPLES(set,key,desc))]

// QOL
#define QQ(var1) QUOTE(QUOTE(var1))
#define QADDON QUOTE(ADDON)


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
