// execVM "z\ace\addons\grenades\dev\dev_testFlares.sqf";

removeAllWeapons player;

player addMagazine "UGL_FlareWhite_F";
player addMagazine "UGL_FlareWhite_F";
player addMagazine "ACE_40mm_Flare_white";
player addMagazine "ACE_40mm_Flare_white";
player addMagazine "ACE_40mm_Flare_green";
player addMagazine "ACE_40mm_Flare_red";
player addMagazine "ACE_40mm_Flare_ir";
player linkItem "NVGoggles";
skipTime 12;

player addWeapon "arifle_MX_GL_ACO_F";

["ace_firedPlayer", {
    params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
    systemChat str _magazine;
    [{
        params ["_args", "_pfid"];
        _args params ["_projectile", "_launchHeight", "_shotTime", "_deployedTime"];
        if (!alive _projectile) exitWith {[_pfid] call CBA_fnc_removePerFrameHandler;};

        private _out = format ["Flight time: %1\n", (time - _shotTime) toFixed 1];
        if (_deployedTime < 0) then {
            if ((vectorMagnitude velocity _projectile) < 10) then {
                _args set [3, time];
            };
        } else {
            _out = _out + format ["Deployed time: %1\n", (time - _deployedTime) toFixed 1];
        };
        _out = _out + format ["Height Above Launch: %1\n", (((getPosASL _projectile) select 2) - _launchHeight) toFixed 1];
        _out = _out + format ["Height Above Terrain: %1\n", ((getPosATL _projectile) select 2) toFixed 1];
        _out = _out + format ["Speed: %1\nVelocity:\n%2\n", (vectorMagnitude velocity _projectile) toFixed 1, (velocity _projectile) apply {_x toFixed 1}];

        hintSilent _out;
    }, 0.1, [_projectile, (getPosASL _unit) select 2, time, -1]] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_addEventHandler;
