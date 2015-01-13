class CfgHints
{
    class Combat_Space_Enhancement
    {
        displayName = "Combat Space Enhancement";
    	class CSE_CMS_Module
    	{
		displayName = "Combat Medical System";
		displayNameShort = "Combat Medical System";
		description = "Combat Medical System is an advanced medical system for players and AI.";
        tip = "";
		arguments[] = {};
		image = "";
		noImage = true;
        };
        class Assessment
        {
            displayName = "Patient Assessment";
            displayNameShort = "Patient Assessment";
            description = "It is essential when treating a casualty that you fully assess each of the areas of the casualty to determine not only the injuries but the priority of each in severity. <br> You cna assess a patient by clicking on the Assessment ICON <br> Use Check Pulse, check Blood Pressure and Check Response to get an overview.";
            tip = "Medics will get a faster and more accurate result when assessing patients.";
            arguments[] = {};
            image = "";
            noImage = true;
       };
          
        class Bleeding
        {
            displayName = "Bandaging a wound";
            displayNameShort = "Bandaging a wound";
            description = "For casualties the first priority is to stop the bleeding. You will want to bandage the largest wounds first, before attending to the smaller ones. <br>You can apply a tourniquet on the limbs to stem the bleeding faster, but remember to remove it!";
            tip = "Select a wound in the injury list to bandage that one first!";
            arguments[] = {};
            image = "";
            noImage = true;
       };        
	};
};