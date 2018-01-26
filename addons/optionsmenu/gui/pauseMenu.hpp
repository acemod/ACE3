class RscDisplayEmpty;
class GVAR(MainMenuHelperDumpDebug): RscDisplayEmpty {
    onLoad = QUOTE(\
        [] call FUNC(debugDumpToClipboard);\
        (_this select 0) closeDisplay 0;\
    );
};
class GVAR(MainMenuHelperHeadBugFix): RscDisplayEmpty {
    onLoad = QUOTE(\
        0 spawn EFUNC(common,headBugFix);\
        (_this select 0) closeDisplay 0;\
    );
};
