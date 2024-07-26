#include "script_component.hpp"

#include "XEH_PREP.hpp"


private _itemHash = createHashMap;
// key is Treatment Type (prefix @ represents a group of treatments)
// value is hash of item/treatment pairs
{
    _x params ["_itemType", "_treatments"];
    private _typeHash = createHashMap;
    {
        private _items = getArray (configFile >> "ace_medical_treatment_actions" >> _x >> "items");
        if (_items isEqualTo []) then { ERROR_1("bad action %1",_x); };
        private _itemClassname = configName (configFile >> "CfgWeapons" >> _items # 0);
        private _treatment = ["", _x] select ((count _treatments) > 1);
        _typeHash set [_itemClassname, _treatment];
    } forEach _treatments;
    _itemHash set [_itemType, _typeHash];
} forEach [
    ["@bandage", ["FieldDressing", "PackingBandage", "ElasticBandage", "QuikClot"]],
    ["@iv", ["SalineIV", "SalineIV_500", "SalineIV_250", "BloodIV", "BloodIV_500", "BloodIV_250", "PlasmaIV", "PlasmaIV_500", "PlasmaIV_250"]],
    ["splint", ["splint"]],
    ["morphine", ["morphine"]],
    ["epinephrine", ["epinephrine"]]
];
uinamespace setVariable [QGVAR(itemHash), compileFinal _itemHash];
