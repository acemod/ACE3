/**
 * fn_findMagazine.sqf
 * @Descr: Find where the current magazines are. Order: uniform, vest, backpack, any.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, magazine STRING (Classname of magazine)]
 * @Return: NUMBER 0 = none, 1 = in uniform, 2 = in vest, 3 = in backpack, 4 = found outside container
 * @PublicAPI: true
 */
#include "script_component.hpp"
private ["_unit","_magazine"];
_unit = _this select 0;
_magazine = _this select 1;

if (_magazine in (getMagazineCargo uniformContainer _unit)) exitwith {1};
if (_magazine in (getMagazineCargo vestContainer _unit)) exitwith {2};
if (_magazine in (getMagazineCargo backpackContainer _unit)) exitwith {3};
if (_magazine in (magazines _unit)) exitwith {4}; // in case it cannot be found in any other container. Most likely loaded in a weapon.

// If we cannot find the item, return 0.
0;