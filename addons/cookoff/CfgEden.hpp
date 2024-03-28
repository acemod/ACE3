class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(enable) { // setting was previously GVAR(enable), so maintain for backwards compatiblity with missions
                        property = QGVAR(enable); // same as above
                        control = "Checkbox";
                        displayName = CSTRING(enableFire_name);
                        tooltip = CSTRING(enableFire_tooltip);
                        expression = QUOTE(if (!_value) then {_this setVariable [ARR_3('%s',_value,true)]});
                        typeName = "BOOL";
                        condition = "objectVehicle";
                        defaultValue = QUOTE(GETMVAR(QGVAR(enableFire),true));
                    };
                    class GVAR(enableAmmoCookoff) {
                        property = QGVAR(enableAmmoCookoff);
                        control = "Checkbox";
                        displayName = CSTRING(enableAmmoCookoff_name);
                        tooltip = CSTRING(enableAmmoCookoff_tooltip);
                        expression = QUOTE(if (!_value) then {_this setVariable [ARR_3('%s',_value,true)]});
                        typeName = "BOOL";
                        condition = "objectHasInventoryCargo";
                        defaultValue = QUOTE(if (_this isKindOf 'ReammoBox_F') then {GETMVAR(QGVAR(enableAmmobox),true)} else {GETMVAR(QGVAR(enableAmmoCookoff),true)});
                    };
                };
            };
        };
    };
};
