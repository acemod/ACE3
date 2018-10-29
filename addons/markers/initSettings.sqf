[
    QGVAR(moveRestriction), "LIST",
    [LSTRING(MoveRestriction), LSTRING(MoveRestriction_Description)],
    format ["ACE %1", localize ELSTRING(map,Module_DisplayName)],
    [
        [
            MOVE_RESTRICTION_NOBODY,
            MOVE_RESTRICTION_ALL,
            MOVE_RESTRICTION_ADMINS,
            MOVE_RESTRICTION_GROUP_LEADERS,
            MOVE_RESTRICTION_GROUP_LEADERS_ADMINS
        ],
        [
            LSTRING(MoveRestriction_Nobody),
            LSTRING(MoveRestriction_All),
            LSTRING(MoveRestriction_Admins),
            LSTRING(MoveRestriction_GroupLeaders),
            LSTRING(MoveRestriction_GroupLeadersAndAdmins)
        ],
        1
    ]
] call cba_settings_fnc_init;
