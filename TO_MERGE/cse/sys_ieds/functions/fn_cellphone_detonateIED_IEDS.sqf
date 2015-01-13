/**
 * fn_cellphone_detonateIED_IEDS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_display", "_iedInfo"];
_display = uiNamespace getVariable 'cse_ied_cellphone';


if (isnil "CSE_PLAYER_PLACED_RADIO_IEDS_IEDS") then {
	CSE_PLAYER_PLACED_RADIO_IEDS_IEDS = [];
};

if (isnil "CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS") then {
	CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS = 0;
};


if (CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS > count CSE_PLAYER_PLACED_RADIO_IEDS_IEDS) then {
	CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS = 0;
};

if (CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS < 0) then {
	CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS = (count CSE_PLAYER_PLACED_RADIO_IEDS_IEDS) - 1;
};

if !(CSE_PLAYER_PLACED_RADIO_IEDS_IEDS isEqualTo []) then {
	_iedInfo = CSE_PLAYER_PLACED_RADIO_IEDS_IEDS select CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS;
	_iedLogic = _iedInfo select 0;

	if !([_iedLogic] call cse_fnc_checkIfJammed_IEDS) then {
		if (_iedLogic distance player  < 3000) then {
			[_iedLogic] call cse_fnc_onIEDActivated_IEDS;
			CSE_PLAYER_PLACED_RADIO_IEDS_IEDS set [CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS, objNull];
			CSE_PLAYER_PLACED_RADIO_IEDS_IEDS = CSE_PLAYER_PLACED_RADIO_IEDS_IEDS - [objNull];
			CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS = CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS - 1;
		};
	};
};

[_display] call cse_fnc_onCellPhoneOpened_IEDS;