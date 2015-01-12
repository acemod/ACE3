/**
 * fn_onCellPhoneOpened_IEDS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_display"];
_display = uiNamespace getVariable 'cse_ied_cellphone';


if (isnil "CSE_PLAYER_PLACED_RADIO_IEDS_IEDS") then {
	CSE_PLAYER_PLACED_RADIO_IEDS_IEDS = [];
};

(_display displayCtrl 10) ctrlSetText "Adres book";

if (isnil "CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS") then {
	CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS = 0;
};

if (CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS > count CSE_PLAYER_PLACED_RADIO_IEDS_IEDS) then {
	CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS = 0;
};

if (CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS < 0) then {
	CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS = (count CSE_PLAYER_PLACED_RADIO_IEDS_IEDS) - 1;
};
(_display displayCtrl 12) ctrlSetText "";
(_display displayCtrl 13) ctrlSetText "";
(_display displayCtrl 14) ctrlSetText "";

_ctrlIDC = 12;
_cellphoneBookPointer = CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS;
for [{_EHiterator=0}, {(_EHiterator< 3)}, {_EHiterator=_EHiterator+1}] do {
	if (_cellphoneBookPointer >= count CSE_PLAYER_PLACED_RADIO_IEDS_IEDS) then {
		_cellphoneBookPointer = 0;
	};
	if (_cellphoneBookPointer < 0) then {
		_cellphoneBookPointer = (count CSE_PLAYER_PLACED_RADIO_IEDS_IEDS) - 1;
	};
	if (_EHiterator < count CSE_PLAYER_PLACED_RADIO_IEDS_IEDS) then {
		(_display displayCtrl _ctrlIDC) ctrlSetText format["#%1", ((CSE_PLAYER_PLACED_RADIO_IEDS_IEDS select _cellphoneBookPointer) select 1)];
		_cellphoneBookPointer = _cellphoneBookPointer + 1;
		_ctrlIDC = _ctrlIDC + 1;
	};
};

(_display displayCtrl 12) ctrlSetbackgroundColor [0,0,0,0.1];
