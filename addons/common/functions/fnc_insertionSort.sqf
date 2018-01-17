/*
 * Author: Ruthberg
 * Sorts an array of numbers
 *
 * Arguments:
 * 0: array <ARRAY>
 * 1: ascending (optional) <BOOL>
 *
 * Return Value:
 * sortedArray (ARRAY)
 *
 * Public: No
 */
#include "script_component.hpp"

ACE_DEPRECATED(QFUNC(insertionSort),"3.8.0","sort");

params [["_list", [], [[]]], ["_ascending", true, [false]]];

_list = + _list; // copy array to not alter the original one
_list sort _ascending;
_list
