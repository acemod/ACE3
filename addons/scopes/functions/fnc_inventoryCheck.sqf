/*
 * Author: KoffeinFlummi, Commy2, Ruthberg
 * Check if weapon optics changed and reset zeroing if needed
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_scopes_fnc_inventoryCheck
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player"];

private _adjustment = ACE_player getVariable QGVAR(Adjustment);
if (isNil "_adjustment") then {
    // [Windage, Elevation, Zero]
    _adjustment = [[0, 0, 0], [0, 0, 0], [0, 0, 0]];
    ACE_player setVariable [QGVAR(Adjustment), _adjustment];
    [ACE_player, QGVAR(Adjustment), _adjustment, 0.5] call EFUNC(common,setVariablePublic);
};

private _newOptics = [_player] call FUNC(getOptics);

{
    if (_newOptics select _forEachIndex != _x) then {
        // The optic for this weapon changed, set adjustment to zero
        if (!((_adjustment select _forEachIndex) isEqualTo [0, 0, 0])) then {
            _adjustment set [_forEachIndex, [0, 0, 0]];
            [ACE_player, QGVAR(Adjustment), _adjustment, 0.5] call EFUNC(common,setVariablePublic);
        };
        private _opticConfig = configFile >> "CfgWeapons" >> (_newOptics select _forEachIndex);        
        private _verticalIncrement = -1;
        if (isNumber (_opticConfig >> "ACE_ScopeAdjust_VerticalIncrement")) then {
            _verticalIncrement = getNumber (_opticConfig >> "ACE_ScopeAdjust_VerticalIncrement");
        };
        private _horizontalIncrement = -1;
        if (isNumber (_opticConfig >> "ACE_ScopeAdjust_HorizontalIncrement")) then {
            _horizontalIncrement = getNumber (_opticConfig >> "ACE_ScopeAdjust_HorizontalIncrement");
        };
        private _maxVertical = [];
        if (isArray (_opticConfig >> "ACE_ScopeAdjust_Vertical")) then {
            _maxVertical = getArray (_opticConfig >> "ACE_ScopeAdjust_Vertical");
        };
        private _maxHorizontal = [];
        if (isArray (_opticConfig >> "ACE_ScopeAdjust_Horizontal")) then {
            _maxHorizontal = getArray (_opticConfig >> "ACE_ScopeAdjust_Horizontal");
        };
        if (GVAR(forceUseOfAdjustmentTurrets)) then {
            if (_maxVertical   isEqualTo []) then { _maxVertical   = [-4, 30]; };
            if (_maxHorizontal isEqualTo []) then { _maxHorizontal = [-6,  6]; };
            if (_verticalIncrement   == -1) then { _verticalIncrement   = 0.1; };
            if (_horizontalIncrement == -1) then { _horizontalIncrement = 0.1; };
        } else {
            if (_maxVertical   isEqualTo []) then { _maxVertical   = [0, 0]; };
            if (_maxHorizontal isEqualTo []) then { _maxHorizontal = [0, 0]; };
            if (_verticalIncrement   == -1) then { _verticalIncrement   = 0; };
            if (_horizontalIncrement == -1) then { _horizontalIncrement = 0; };
        };
        (GVAR(scopeAdjust) select _forEachIndex) set [0, _maxVertical];
        (GVAR(scopeAdjust) select _forEachIndex) set [1, _verticalIncrement];
        (GVAR(scopeAdjust) select _forEachIndex) set [2, _maxHorizontal];
        (GVAR(scopeAdjust) select _forEachIndex) set [3, _horizontalIncrement];
        GVAR(canAdjustElevation) set [_forEachIndex, (_verticalIncrement > 0) && !(_maxVertical isEqualTo [0, 0])];
        GVAR(canAdjustWindage) set [_forEachIndex, (_horizontalIncrement > 0) && !(_maxHorizontal isEqualTo [0, 0])];
        // Does not work reliably
        //private _hideVanillaZeroing = (getNumber(_opticConfig >> "ItemInfo" >> "opticType") == 2 && (GVAR(canAdjustElevation) select _forEachIndex)) || {isNumber (_opticConfig >> "ACE_ScopeZeroRange")};
        //private _result = ["zeroing", !_hideVanillaZeroing, false] call EFUNC(ui,setAdvancedElement);
    };
} forEach GVAR(Optics);

_adjustment = ACE_player getVariable QGVAR(Adjustment);
GVAR(Optics) = _newOptics;
