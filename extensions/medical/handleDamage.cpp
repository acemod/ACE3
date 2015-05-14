#include "handleDamage.h"
#include "OpenWound.h"
#include "DamageType.h"
#include "InjuryType.h"
#include <sstream>

namespace ace {
    namespace medical {

        handleDamage::handleDamage()
        {
        }


        handleDamage& handleDamage::GetInstance()
        {
            static handleDamage instance;
            return instance;
        }

        handleDamage::~handleDamage()
        {
        }

        /* static */ std::vector<ace::medical::injuries::OpenWound> handleDamage::HandleDamageWounds(const std::string& selectionName, double amountOfDamage, const std::string& typeOfDamage)
        {
            std::vector<ace::medical::injuries::OpenWound> wounds;
            int selectionN = SelectionToNumber(selectionName);
            if (selectionN >= 0)
            {
                wounds = GetInjuryInfoFor(typeOfDamage, amountOfDamage, selectionN);
            }
            return wounds;
        }

        std::vector<ace::medical::injuries::OpenWound> handleDamage::GetInjuryInfoFor(const std::string& typeOfDamage, double amountOfDamage, int selection)
        {
            std::vector<ace::medical::injuries::OpenWound> injuriesToAdd;
            std::vector<std::shared_ptr<ace::medical::injuries::InjuryType>> information;
            std::shared_ptr<ace::medical::injuries::InjuryType> highestSpot;

            for each (std::shared_ptr<ace::medical::injuries::DamageType> damageType in damageTypes)
            {
                if (damageType->typeName == typeOfDamage)
                {
                    for each (std::shared_ptr<ace::medical::injuries::InjuryType> possibleInjury in damageType->possibleInjuries)
                    {
                        if (amountOfDamage >= possibleInjury->minDamage && (amountOfDamage <= possibleInjury->maxDamage || possibleInjury->maxDamage == 0))
                        {
                            if (highestSpot == NULL)
                                highestSpot = possibleInjury;

                            if (possibleInjury->minDamage > highestSpot->minDamage)
                                highestSpot = possibleInjury;

                            information.push_back(possibleInjury);
                        }
                    }

                    int c = 0;
                    for each (double threshold in damageType->minDamageThreshold)
                    {
                        if (threshold >= amountOfDamage)
                        {
                            double amountOfInjuriesOnDamage = damageType->amountOfInjuresOnDamage.at(c);
                            for (double injuryAmount = 0; injuryAmount < amountOfInjuriesOnDamage; ++injuryAmount)
                            {
                                std::shared_ptr<ace::medical::injuries::InjuryType> injuryToAdd;
                                if (rand() % 1 >= 0.85)
                                {
                                    injuryToAdd = highestSpot;
                                }
                                else 
                                { 
                                    injuryToAdd = information.at(0); 
                                }

                                int bodyPartID = selection;
                                if (!damageType->selectionSpecific)
                                {
                                    bodyPartID = rand() % 6;
                                }
                                
                                injuries::OpenWound newWound(injuryToAdd->ID, bodyPartID, 1, injuryToAdd->bloodLoss, injuryToAdd->pain);
                                injuriesToAdd.push_back(newWound);
                            }
                        }
                        ++c;
                    }
                    return injuriesToAdd;
                }
            }
            return injuriesToAdd;
        }

        /* static */ void handleDamage::AddDamageType(const std::vector<std::string>& input)
        {
            if (input.size() == 5)
            {
                std::string typeName = input[0];
                double minimalLethalDamage = std::stod(input[1]);
                std::vector<double> minDamageThreshold;// = std::stod(input[2]);
                std::vector<double> amountOfInjuresOnDamage; //= std::stod(input[3]);
                bool selectionSpecific = std::stod(input[4]) > 0;

                std::shared_ptr<ace::medical::injuries::DamageType> type(new ace::medical::injuries::DamageType(typeName, minimalLethalDamage, minDamageThreshold, amountOfInjuresOnDamage, selectionSpecific));
                damageTypes.push_back(type);
            }
        }

        void handleDamage::AddInjuryType(const std::vector<std::string>& input)
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

                std::shared_ptr<ace::medical::injuries::InjuryType> type(new ace::medical::injuries::InjuryType(ID, className, allowedSelections, bloodLoss, pain, minDamage, maxDamage, possibleCauses, displayName));
                injuryTypes.push_back(type);
            }
        }

        void handleDamage::FinalizeDefinitions()
        {
            // We are finding all possible injuries for a specific damage type here, so we don't have to figure that out at a later stage.
            for each (std::shared_ptr<ace::medical::injuries::DamageType> damageType in damageTypes)
            {
                for each (std::shared_ptr<ace::medical::injuries::InjuryType> injuryType in injuryTypes)
                {
                    if (find(injuryType->causes.begin(), injuryType->causes.end(), damageType->typeName) != injuryType->causes.end())
                    {
                        damageType->possibleInjuries.push_back(injuryType);
                    }
                }
            }
        }

        int handleDamage::SelectionToNumber(const std::string& selectionName)
        {
            // TODO use dynamic selections instead
            std::vector<std::string> selections = { "head", "body", "hand_l", "hand_r", "leg_l", "leg_r" };
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
    }
}
