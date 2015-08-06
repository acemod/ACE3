/*
 * Author: Glowbal
 *
 * Check if unit has item
 *
 * Arguments:
 * 0: Unit (OBJECT)
 * 1: Item Classname (STRING)
 *
 * Return Value:
 * has Item (BOOLEAN)
 *
 * Public: yes
 */
 #include "script_component.hpp"

params ["_unit", "_item"];

// item classname in items unit
(_item in items _unit);
