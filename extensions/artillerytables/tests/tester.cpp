#include <iostream>
#include <chrono>
#include "gtest/gtest.h"
#include "../artillerytables.hpp"


extern "C" {
    __declspec(dllexport) void __stdcall RVExtension(char* output, int outputSize, const char* function);
    __declspec(dllexport) int __stdcall RVExtensionArgs(char* output, int outputSize, const char* function, const char** argv, int argc);
    __declspec(dllexport) void __stdcall RVExtensionVersion(char* output, int outputSize);
}

namespace test_ace_artillerytables {
    TEST(Extension, VersionOld) {
        char output[256];
        char function[] = "version";
        RVExtension(output, 256, function);
        std::cout << "VersionOld: " << output << "\n";
        ASSERT_STREQ(output, ACE_FULL_VERSION_STR);
    }
    TEST(Extension, VersionRVExtensionVersion) {
        char output[256];
        RVExtensionVersion(output, 256);
        std::cout << "VersionExtension: " << output << "\n";
        ASSERT_STREQ(output, ACE_FULL_VERSION_STR);
    }
    TEST(Extension, VersionArray) {
        char output[256];
        char function[] = "version";
        int extReturn = RVExtensionArgs(output, 256, function, NULL, 0);
        std::cout << "VersionNew: " << output << "\n";
        ASSERT_EQ(extReturn, 0);
        ASSERT_STREQ(output, ACE_FULL_VERSION_STR);
    }
    TEST(Extension, InvalidFuncOld) {
        char output[256];
        char function[] = "blah";
        RVExtension(output, 256, function);
        ASSERT_STREQ(output, "error - use args version of callExtension");
    }
    TEST(Extension, InvalidFuncArray) {
        char output[256];
        char function[] = "blah";
        int extReturn = RVExtensionArgs(output, 256, function, nullptr, 0);
        std::cout << "InvalidFunc: " << output << "\n";
        ASSERT_EQ(extReturn, RETURN_INVALID_FUNCTION);
        ASSERT_STREQ(output, "error - invalid function");
    }


    TEST(Extension, TestRun) {
        // very basic test that it runs the correct number of lines
        char output[256];

        // Start:
        char function1[] = "start";
        const char* args1[] = { "400", "-0.00005", "-5", "80", "true" };
        auto t1 = std::chrono::high_resolution_clock::now();
        int ret1 = RVExtensionArgs(output, 256, function1, args1, 5);
        auto t2 = std::chrono::high_resolution_clock::now();
        std::printf("ret: %d - %s\n", ret1, output);
        std::printf("func %s: %1.1f ms\n", function1, std::chrono::duration<double, std::milli>(t2 - t1).count());
        ASSERT_STREQ(output, "[10391.8,103]");
        ASSERT_EQ(ret1, 0);

        int lines = 0;
        auto t3 = std::chrono::high_resolution_clock::now();
        char function2[] = "getline";
        int ret2 = 0;
        while (ret2 != 3) { // dumb spin
            ret2 = RVExtensionArgs(output, 256, function2, NULL, 0);
            if (ret2 == 1) {
                lines++;
                // std::printf("ret: %d - %s\n", ret2, output);
            }
        }
        auto t4 = std::chrono::high_resolution_clock::now();
        std::printf("func %s: %1.1f ms with %d lines\n", function2, std::chrono::duration<double, std::milli>(t3 - t2).count(), lines);

        std::printf("callExtensions finished in %1.1f ms\n", std::chrono::duration<double, std::milli>(t4 - t1).count());

        ASSERT_EQ(lines, 69);
    }
}


int main(int argc, char** argv) {
    // Misc Testing code
    // Determine realistic air firiction values
    //double mv = 241;
    //std::printf(" %f m/s\n", mv);
    //double range;
    //for (double ar = 0; ar > -0.00015; ar -= 0.00001) {
    //    std::tie(std::ignore, range) = findMaxAngle(mv, ar);
    //    printf("[%f] = %f\n", ar, range);
    //}
    ::testing::InitGoogleTest(&argc, argv);
    std::cout << "Starting tests!\n";
    return RUN_ALL_TESTS();
}
