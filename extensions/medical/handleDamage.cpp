#include "handleDamage.h"
#include "OpenWound.h"
#include "DamageType.h"
#include "InjuryType.h"
#include <sstream>

using namespace ace::medical;

handleDamage::handleDamage()
{
}


handleDamage::~handleDamage()
{
}

/* static */ std::vector<injuries::OpenWound> handleDamage::HandleDamageWounds(const std::string& selectionName, double amountOfDamage, const std::string& typeOfDamage)
{
    std::vector<injuries::OpenWound> wounds;
    int selectionN = SelectionToNumber(selectionName);
    if (selectionN >= 0) 
    {
        std::vector<std::shared_ptr<injuries::InjuryType>> injuryTypeInfo = GetInjuryInfoFor(typeOfDamage);
    }

    return wounds;
}

/* static */ void handleDamage::AddDamageType(const std::vector<std::string>& input)
{
    if (input.size() == 4)
    {
        std::string typeName = input[0];
		double minimalLethalDamage = std::stod(input[1]);
        double minDamageThreshold = std::stod(input[2]);
		double maxDamageThreshold = std::stod(input[3]);

        std::shared_ptr<injuries::DamageType> type(new injuries::DamageType(typeName, minimalLethalDamage, minDamageThreshold, maxDamageThreshold));
        damageTypes.push_back(type);
    }
}

/* static */ void handleDamage::AddInjuryType(const std::vector<std::string>& input)
{
    if (input.size() == 9)
    {
        // TODO parse arrays from string input

        int ID = std::stod(input[0]);
        std::string className = input[1];
        std::vector<std::string> allowedSelections; // input[2];
		double bloodLoss = std::stod(input[3]);
		double pain = std::stod(input[4]);

		double minDamage = std::stod(input[5]);
		double maxDamage = std::stod(input[6]);
        std::vector<std::string> possibleCauses; // input[7];
        std::string displayName = input[8];

        std::shared_ptr<injuries::InjuryType> type(new injuries::InjuryType(ID, className, allowedSelections, bloodLoss, pain, minDamage, maxDamage, possibleCauses, displayName));
        injuryTypes.push_back(type);
    }
}

/* static */ void handleDamage::FinalizeDefinitions()
{
    // We are finding all possible injuries for a specific damage type here, so we don't have to figure that out at a later stage.
    for each (std::shared_ptr<injuries::DamageType> damageType in damageTypes)
    {
        for each (std::shared_ptr<injuries::InjuryType> injuryType in injuryTypes)
        {
            if (find(injuryType->causes.begin(), injuryType->causes.end(), damageType->typeName) != injuryType->causes.end())
            {
                damageType->possibleInjuries.push_back(injuryType);
            }
        }
    }
}

/* static */ int SelectionToNumber(const std::string& selectionName) 
{
    // TODO use dynamic selections instead
    std::vector<std::string> selections = {"head", "body", "hand_l", "hand_r", "leg_l", "leg_r"};
    std::vector<std::string>::iterator it = find(selections.begin(), selections.end(), selectionName);
    if (it != selections.end())
    {
        return it - selections.begin();
    }
    else 
    {
        return -1; // TODO throw exception
    }
}
