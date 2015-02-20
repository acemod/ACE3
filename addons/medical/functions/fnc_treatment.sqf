/*
 * Author: KoffeinFlummi
 * Starts the treatment process
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: The treatment type/item <STRING>
 * 3+: Additional paramters <ANY>
 *
 * Return Value:
 * nil
 *
 * Public: Yes
 */

#include "script_component.hpp"

_medic = _this select 0;
_patient = _this select 1;
_type = _this select 2;

_params = + _this;
_params deleteAt 0;
_params deleteAt 0;
_params deleteAt 0;

// @todo: animation

// @todo: remove item

// @todo: progress bar

_this call FUNC(treatmentCallback);
