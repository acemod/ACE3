[["ACE3 Equipment",LLSTRING(tacphoneCategory)], QGVAR(openPhoneKey), LLSTRING(openPhoneKey),
{
    if ("ACE_Tacphone" in items ace_player) then {
        call FUNC(loadphone)
    };
},
{false},
[0, [false, false, false]], false, 0] call CBA_fnc_addKeybind; // (empty default key)