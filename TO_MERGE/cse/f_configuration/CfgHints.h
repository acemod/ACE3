class CfgHints
{
    class Combat_Space_Enhancement
    {
        displayName = "Combat Space Enhancement";
        class Cse_configure {
    		displayName = "Configuration";
    		displayNameShort = "Configuration";
    		description = "You can configure CSE keybindings and settings through the configuration menu.";
            tip = "Keybindings and settings are stored in your profile.";
    		arguments[] = {};
    		image = "";
    		noImage = true;
        };
        class menuKeyBindings_subHint
        {
            displayName = "Menu Keybindings";
            displayNameShort = "Menu Keybindings";
            description = "Menu %11 will when their key is pressed open a menu.";
            tip = "You can hold down the key for a longer period and when released, the menu will close.";
            arguments[] = {
                 {"Keybindings"}
            };
            image = "";
            noImage = true;
       };
        class actionKeyBindings_subHint
        {
            displayName = "Action Keybindings";
            displayNameShort = "Action Keybindings";
            description = "Action %11 are used for specific actions performed by the player character.";
            tip = "Use Ctrl, Alt or Shift combinations to increase the amount of actions you can bind.";
            arguments[] = {
                 {"Keybindings"}
            };
            image = "";
            noImage = true;
       };
        class clientSettings
        {
            displayName = "Client Settings";
            displayNameShort = "Client Settings";
            description = "Client settings do not affect MP gameplay but allows players to customize their gameplay to their likings.";
            tip = "If you are having low frames, try turning off some client settings..";
            arguments[] = {};
            image = "";
            noImage = true;
       };
	};

};