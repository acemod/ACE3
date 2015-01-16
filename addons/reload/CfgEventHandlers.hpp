
class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_Take_EventHandlers {
    class CAManBase {
        class ACE_AmmoIndicatorReload {
			clientTake = QUOTE(if (_this select 0 == ACE_player && {(_this select 1) in [ARR_3(uniformContainer (_this select 0), vestContainer (_this select 0), backpackContainer (_this select 0))]} && {_this select 2 == currentMagazine (_this select 0)}) then {[ARR_3(_this select 0, vehicle (_this select 0), true)] call FUNC(checkAmmo)};);
        };
    };
};
