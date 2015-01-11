/*
 * Author: KoffeinFlummi
 *
 * Checks the inventory of the unit and replaces items if necessary.
 *
 * Arguments:
 * 0: Unit
 *
 * Return Value:
 * None
 */

_unit = _this select 0;

while {count (itemsWithMagazines _unit) > count (itemsWithMagazines _unit - ["FirstAidKit"])} do {
  _unit removeItem "FirstAidKit";
  _unit addItem "AGM_Bandage";
  _unit addItem "AGM_Bandage";
  _unit addItem "AGM_Morphine";
};
while {count (itemsWithMagazines _unit) > count (itemsWithMagazines _unit - ["Medikit"])} do {
  _unit removeItem "Medikit";
  _unit addItemToBackpack "AGM_Epipen";
  _unit addItemToBackpack "AGM_Epipen";
  _unit addItemToBackpack "AGM_Epipen";
  _unit addItemToBackpack "AGM_Epipen";
  _unit addItemToBackpack "AGM_Bloodbag";
  _unit addItemToBackpack "AGM_Bloodbag";
};
