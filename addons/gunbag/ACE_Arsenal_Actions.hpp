class EGVAR(arsenal,actions) {
    class ADDON {
        displayName = CSTRING(DisplayName);
        condition = QUOTE(call FUNC(hasGunbag));
        scopeEditor = 0; // variables are reset between 3DEN and mission start
        tabs[] = {0,5};
        class GVAR(status) {
            textStatement = QUOTE([_this select 0] call FUNC(weaponName));
        };
        class GVAR(store) {
            label = CSTRING(ToGunbag);
            condition = QUOTE([ARR_2(_this select 0,_this select 0)] call FUNC(canInteract) == 0);
            statement = QUOTE([ARR_2(_this select 0,_this select 0)] call FUNC(toGunbagCallback));
        };
        class GVAR(retrieve) {
            label = CSTRING(OffGunbag);
            condition = QUOTE([ARR_2(_this select 0,_this select 0)] call FUNC(canInteract) == 1);
            statement = QUOTE([ARR_2(_this select 0,_this select 0)] call FUNC(offGunbagCallback));
        };
        class GVAR(swap) {
            label = CSTRING(SwapGunbag);
            condition = QUOTE([ARR_2(_this select 0,_this select 0)] call FUNC(canInteract) == 2);
            statement = QUOTE([ARR_2(_this select 0,_this select 0)] call FUNC(swapGunbagCallback));
        };
    };
};
