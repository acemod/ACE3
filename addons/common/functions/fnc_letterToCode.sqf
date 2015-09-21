/*
 * Author: commy2
 * Converts some Arma Dik Codes to a key.
 *
 * Arguments:
 * 0: Dik Code <NUMBER>
 *
 * Return Value:
 * Key <STRING>
 *
 * Public: Yes
 *
 * Deprecated
 */
#include "script_component.hpp"

ACE_WARNINGFORMAT_3("%1 is deprecated. Support will be dropped in version %2. Replaced by %3","ace_common_fnc_letterToCode","1.5","-");

[-1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 30, 48, 46, 32, 18, 33, 34, 35, 23, 36, 37, 38, 50, 49, 24, 25, 16, 19, 31, 20, 22, 47, 17, 45, 44, 21] select (["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"] find toUpper (_this select 0)) + 1
