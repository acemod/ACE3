#include "handleDamage.h"
#include "OpenWound.h"
#include "DamageType.h"
#include "InjuryType.h"
#include <sstream>
#include <algorithm>

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

        std::string handleDamage::HandleDamageWounds(const std::string& selectionName, double amountOfDamage, const std::string& typeOfDamage, int woundID)
        {
            std::vector<ace::medical::injuries::OpenWound> wounds;
            int selectionN = SelectionToNumber(selectionName);
            std::stringstream stream;

            if (selectionN >= 0)
            {
                double painToAdd = 0;
                wounds = GetInjuryInfoFor(typeOfDamage, amountOfDamage, selectionN, woundID);

                stream << "[[";
                for (int i = 0; i < wounds.size(); ++i)
                {
                    stream << wounds.at(i).AsString();
                    if (i != wounds.size() - 1)
                    {
                        stream << ",";
                    }

                    painToAdd += wounds.at(i).pain;
                }
                stream << "],";

                stream << painToAdd << "]";

                return stream.str();
            }
            return stream.str();
        }

        std::vector<ace::medical::injuries::OpenWound> handleDamage::GetInjuryInfoFor(const std::string& typeOfDamage, double amountOfDamage, int selection, int woundID)
        {
            std::vector<ace::medical::injuries::OpenWound> injuriesToAdd;
            std::vector<std::shared_ptr<ace::medical::injuries::InjuryType>> information;
            std::shared_ptr<ace::medical::injuries::InjuryType> highestSpot = nullptr;

            for (auto & damageType : damageTypes)
            {
                if (damageType->typeName == typeOfDamage)
                {
                    for (auto & possibleInjury : damageType->possibleInjuries)
                    {
                        if (amountOfDamage >= possibleInjury->minDamage && (amountOfDamage <= possibleInjury->maxDamage || possibleInjury->maxDamage <= 0))
                        {
                            if (highestSpot == NULL)
                                highestSpot = possibleInjury;

                            if (possibleInjury->minDamage > highestSpot->minDamage)
                                highestSpot = possibleInjury;

                            information.push_back(possibleInjury);
                        }
                    }
                    if (highestSpot == NULL) {
                        break;
                    }

                    int c = 0;
                    for (double & threshold : damageType->minDamageThreshold)
                    {
                        if (amountOfDamage >= threshold)
                        {
                            double amountOfInjuriesOnDamage = damageType->amountOfInjuresOnDamage.at(c);
                            for (double injuryAmount = 0; injuryAmount < amountOfInjuriesOnDamage; ++injuryAmount)
                            {
                                std::shared_ptr<ace::medical::injuries::InjuryType> injuryToAdd;
                                if (rand() % 100 >= 85)
                                {
                                    injuryToAdd = highestSpot;
                                }
                                else
                                {
                                    int indexNewInjuryToAdd = rand() % information.size();
                                    injuryToAdd = information.at(indexNewInjuryToAdd);
                                }

                                int bodyPartID = selection;
                                if (!damageType->selectionSpecific)
                                {
                                    bodyPartID = rand() % 6;
                                }

                                injuries::OpenWound newWound(woundID++, injuryToAdd->ID, bodyPartID, 1, injuryToAdd->bloodLoss, injuryToAdd->pain);
                                injuriesToAdd.push_back(newWound);
                            }
                            return injuriesToAdd;
                        }
                        ++c;
                    }
                }
            }
            return injuriesToAdd;
        }

        std::string handleDamage::AddDamageType(const std::vector<std::string>& input)
        {
            if (input.size() == 5)
            {
                std::string typeName = input[0];
                double minimalLethalDamage = std::stod(input[1]);
                std::vector<double> minDamageThreshold = inputToVectorDouble(input[2]);
                std::vector<double> amountOfInjuresOnDamage = inputToVectorDouble(input[3]);
                bool selectionSpecific = std::stod(input[4]) > 0;

                std::shared_ptr<ace::medical::injuries::DamageType> type(new ace::medical::injuries::DamageType(typeName, minimalLethalDamage, minDamageThreshold, amountOfInjuresOnDamage, selectionSpecific));
                damageTypes.push_back(type);

                std::stringstream stream;

                stream << "ADDED: " << typeName << " - " << minimalLethalDamage << " - [";
                for (double & sel : minDamageThreshold)
                {
                    stream << sel << " -";
                }
                stream << "] - [";
                for (double & sel : amountOfInjuresOnDamage)
                {
                    stream << sel << " -";
                }
                stream << "] - " << selectionSpecific;
                return stream.str();
            }
            return "failed";
        }

        std::string handleDamage::AddInjuryType(const std::vector<std::string>& input)
        {
            if (input.size() == 9)
            {
                int ID = std::stod(input[0]);
                std::string className = input[1];
                std::vector<std::string> allowedSelections = inputToVector(input[2]);
                double bloodLoss = std::stod(input[3]);
                double pain = std::stod(input[4]);

                double minDamage = std::stod(input[5]);
                double maxDamage = std::stod(input[6]);
                std::vector<std::string> possibleCauses = inputToVector(input[7]);
                std::string displayName = input[8];

                std::shared_ptr<ace::medical::injuries::InjuryType> type(new ace::medical::injuries::InjuryType(ID, className, allowedSelections, bloodLoss, pain, minDamage, maxDamage, possibleCauses, displayName));
                injuryTypes.push_back(type);
                std::stringstream stream;

                stream << "ADDED: " <<  ID << " - " << className << " - [";
                for (std::string & sel : allowedSelections)
                {
                    stream << sel << " -";
                }
                stream << "] - ";
                stream << bloodLoss << " - " << pain << " - " << minDamage << " - " << maxDamage;
                for (std::string & sel : possibleCauses)
                {
                    stream << sel << " -";
                }
                stream << displayName;
                return stream.str();
            }
            return "failed";
        }

        void handleDamage::FinalizeDefinitions()
        {
            // We are finding all possible injuries for a specific damage type here, so we don't have to figure that out at a later stage.
            for (auto & damageType : damageTypes)
            {
                for (auto & injuryType : injuryTypes)
                {
                    std::vector<std::string>::iterator it = std::find(injuryType->causes.begin(), injuryType->causes.end(), damageType->typeName);
                    // outputstream << " Evaluating causes: " << (it != injuryType->causes.end()) << " ";
                    if (it != injuryType->causes.end())
                    {
                        damageType->possibleInjuries.push_back(injuryType);
                    }
                }
            }
        }

        int handleDamage::SelectionToNumber(const std::string& hitpointName)
        {
            // TODO use dynamic selections instead
            std::vector<std::string> hitpoints = { "Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg" };
            std::vector<std::string>::iterator it = find(hitpoints.begin(), hitpoints.end(), hitpointName);
            if (it != hitpoints.end())
            {
                return it - hitpoints.begin();
            }
            else
            {
                return -1; // TODO throw exception
            }
        }

        std::vector<std::string> handleDamage::inputToVector(const std::string& input)
        {
            std::istringstream ss(input);
            std::string token;

            std::vector<std::string> output;
            while (std::getline(ss, token, ':')) {
                output.push_back(token);
            }
            return output;
        }
        std::vector<double> handleDamage::inputToVectorDouble(const std::string& input)
        {
            std::istringstream ss(input);
            std::string token;

            std::vector<double> output;
            while (std::getline(ss, token, ':')) {
                output.push_back(std::stod(token));
            }
            return output;
        }
    }
}
