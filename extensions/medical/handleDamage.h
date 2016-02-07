#pragma once

#include <string>
#include <vector>
#include <memory>

namespace ace {
    namespace medical {

        namespace injuries {
            class DamageType;
            class InjuryType;
            class OpenWound;
        }

        class handleDamage
        {
        public:
            /**
            *
            */
            static handleDamage& GetInstance();

            ~handleDamage();

            /**
            * Find new open wounds from advanced medical based upon the received damage.
            *
            * @param selectionName A string representation of the bodypart (for example: leg_r)
            * @param amountOfDamage The damage received
            * @param typeOfDamage The type of the damage received
            * @param woundID latest wound ID
            * @return SQF string containing _woundsCreated and _painAdded.
            */
            std::string HandleDamageWounds(const std::string& selectionName, double amountOfDamage, const std::string& typeOfDamage, int woundID);

            /**
            * Find new open wounds from advanced medical based upon the received damage.
            *
            * @param typeOfDamage The type of the damage received
            * @param amountOfDamage The damage received
            * @param selection A number representation of the bodypart. Number from 0 to 6.
            * @param woundID latest wound ID
            * @return New open wounds.
            */
            std::vector<ace::medical::injuries::OpenWound> GetInjuryInfoFor(const std::string& typeOfDamage, double amountOfDamage, int selection, int woundID);

            /**
            * Add a new damage type from extension input parameters
            * 
            * @param sqfDamageTypeDefinition 
            * @return String with result of addition: ADDED [parameters] or FAILED
            */
            std::string AddDamageType(const std::vector<std::string>& sqfDamageTypeDefinition);

            /**
            * Add a new injury type from extension input parameters
            *
            * @param sqfDamageTypeDefinition
            * @return String with result of addition: ADDED [parameters] or FAILED
            */
            std::string AddInjuryType(const std::vector<std::string>& sqfInjuryDefinition);

            /**
            * Convert a selectionName to a number
            *
            * @param selectionName
            * @return number of selection
            */
            int SelectionToNumber(const std::string& selectionName);

            /**
            * Lets the system know that all data has been added
            */
            void FinalizeDefinitions();

        private:
            handleDamage();
            
            handleDamage(handleDamage const&) = delete;
            void operator=(handleDamage const&) = delete;

            std::vector<std::string> inputToVector(const std::string& input);
            std::vector<double> inputToVectorDouble(const std::string& input);

            std::vector<std::shared_ptr<ace::medical::injuries::DamageType>> damageTypes;
            std::vector<std::shared_ptr<ace::medical::injuries::InjuryType>> injuryTypes;
            std::vector<std::string> selections;
            std::vector<std::string> hitPoints;
        };
    }
}
