#include <iostream>
#include "gtest/gtest.h"
#include "shared.hpp"
#include "../ace_break_line.hpp"
#include "../ace_parse_imagepath.hpp"


extern "C" {
    __declspec(dllexport) void __stdcall RVExtension(char* output, int outputSize, const char* function);
    __declspec(dllexport) int __stdcall RVExtensionArgs(char* output, int outputSize, const char* function, const char** argv, int argc);
    __declspec(dllexport) void __stdcall RVExtensionVersion(char* output, int outputSize);
}

namespace test_ace_strings {
    TEST(Extension, VersionOld) {
        char output[256];
        char function[] = "version";
        RVExtension(output, 256, function);
        std::cout << "VersionOld: " << output << "\n";
        ASSERT_STREQ(output, ACE_FULL_VERSION_STR);
    }
    TEST(Extension, VersionRVExtensionVersion) {
        char output[256];
        char function[] = "version";
        RVExtensionVersion(output, 256);
        std::cout << "VersionExtension: " << output << "\n";
        ASSERT_STREQ(output, ACE_FULL_VERSION_STR);
    }
    TEST(Extension, VersionNew) {
        char output[256];
        char function[] = "version";
        int extReturn = RVExtensionArgs(output, 256, function, NULL, 0);
        std::cout << "VersionNew: " << output << "\n";
        ASSERT_EQ(extReturn, 0);
        ASSERT_STREQ(output, ACE_FULL_VERSION_STR);
    }
    TEST(Extension, InvalidFunc) {
        char output[256];
        char function[] = "blah";
        int extReturn = RVExtensionArgs(output, 256, function, nullptr, 0);
        std::cout << "InvalidFunc: " << output << "\n";
        ASSERT_EQ(extReturn, RETURN_INVALID_FUNCTION);
        ASSERT_STREQ(output, "invalid function");
    }

    // getImagePath
    TEST(getImagePath, function_1) {
        std::string funcReturn = getImagePathFromStructuredText("<img image='\\A3\\Ui_f\\data\\IGUI\\Cfg\\Actions\\open_door_ca.paa' size='2.5' />");
        EXPECT_EQ(funcReturn, "\\A3\\Ui_f\\data\\IGUI\\Cfg\\Actions\\open_door_ca.paa");
    }
    TEST(getImagePath, extension_valid) {
        char output[256];
        char function[] = "getImagePath";
        const char* args[] = { "\"<img image='\\A3\\Ui_f\\data\\IGUI\\Cfg\\Actions\\open_door_ca.paa' size='2.5' />\"" };
        int extReturn = RVExtensionArgs(output, 256, function, args, 1);
        std::cout << "extension_valid: " << output << "\n";
        ASSERT_STREQ(output, "\\A3\\Ui_f\\data\\IGUI\\Cfg\\Actions\\open_door_ca.paa");
        ASSERT_EQ(extReturn, 0);
    }
    TEST(getImagePath, extension_wrongArgCount) {
        char output[256];
        char function[] = "getImagePath";
        int extReturn = RVExtensionArgs(output, 256, function, nullptr, 0);
        std::cout << "extension_wrongArgCount: " << output << "\n";
        ASSERT_EQ(extReturn, RETURN_WRONG_ARG_COUNT);
    }
    // breakLine

    TEST(breakLine, function_1) {
        std::string funcReturn = getImagePathFromStructuredText("<img image='\\A3\\Ui_f\\data\\IGUI\\Cfg\\Actions\\open_door_ca.paa' size='2.5' />");
        EXPECT_EQ(funcReturn, "\\A3\\Ui_f\\data\\IGUI\\Cfg\\Actions\\open_door_ca.paa");
    }
    TEST(breakLine, extension_validShort) {
        char output[256];
        char function[] = "breakLine";
        const char* args[] = { "\"aaa\"" };
        int extReturn = RVExtensionArgs(output, 256, function, args, 1);
        std::cout << "extension_validShort: " << output << "\n";
        ASSERT_STREQ(output, "aaa");
        ASSERT_EQ(extReturn, 0);
    }
    TEST(breakLine, extension_validLong) {
        char output[256];
        char function[] = "breakLine";
        const char* args[] = { "\"Takes a string and insert as many line breaks as needed so it fits a given width\"" };
        int extReturn = RVExtensionArgs(output, 256, function, args, 1);
        std::cout << "extension_validLong: " << output << "\n";
        ASSERT_STREQ(output, "Takes a string<br/>and insert as<br/>many line<br/>breaks as<br/>needed so it<br/>fits a given<br/>width");
        ASSERT_EQ(extReturn, 0);
    }
    TEST(breakLine, extension_wrongArgCount) {
        char output[256];
        char function[] = "breakLine";
        int extReturn = RVExtensionArgs(output, 256, function, nullptr, 0);
        std::cout << "extension_wrongArgCount: " << output << "\n";
        ASSERT_EQ(extReturn, RETURN_WRONG_ARG_COUNT);
    }
 }


int main(int argc, char** argv) {
    ::testing::InitGoogleTest(&argc, argv);
    std::cout << "Starting tests!\n";
    return RUN_ALL_TESTS();
}
