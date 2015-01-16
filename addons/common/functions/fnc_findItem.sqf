/**
 * fn_findItem.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */
#include "script_component.hpp"
private ["_unit","_magazine","_return"];
_unit = _this select 0;
_item = _this select 1;

if (_item in (uniformItems _unit)) exitwith {1};
if (_item in (vestItems _unit)) exitwith {2};
if (_item in (backpackItems _unit)) exitwith {3};
if (_item in (assignedItems _unit)) exitwith {4};
if (_item in (primaryWeaponItems _unit)) exitwith {5};
if (_item in (secondaryWeaponItems _unit)) exitwith {6};
if (_item in (handgunItems _unit)) exitwith {7};
if (_item in (items _unit)) exitwith {8}; // in case it is in items but cannot be found in any other container (should never reach this)

// If we cannot find the item, return 0.
0;