
class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ACE_LockBackpack {
                    displayName = "$STR_ACE_LockBackpacks_LockBackpack";
                    condition = QUOTE([backpackContainer _player] call FUNC(isBackpack) && {!((backpackContainer _player) getVariable [ARR_2('ACE_LockedInventory', false)])});
                    statement = QUOTE((backpackContainer _player) setVariable [ARR_3('ACE_LockedInventory', true, true)];);
                    showDisabled = 0;
                    priority = 2.5;
                    icon = "";  // @todo
                    hotkey = "L";
                    enableInside = 1;
                };

                class ACE_UnlockBackpack {
                    displayName = "$STR_ACE_LockBackpacks_UnlockBackpack";
                    condition = QUOTE([backpackContainer _player] call FUNC(isBackpack) && {(backpackContainer _player) getVariable [ARR_2('ACE_LockedInventory', false)]});
                    statement = QUOTE((backpackContainer _player) setVariable [ARR_3('ACE_LockedInventory', false, true)];);
                    showDisabled = 0;
                    priority = 2.5;
                    icon = "";  // @todo
                    hotkey = "L";
                    enableInside = 1;
                };
            };
        };
    };
};
