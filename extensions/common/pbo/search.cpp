#ifdef _WIN32

#include "search.hpp"
#include <sstream>
#include <iterator>
#include <algorithm>
#include <regex>

#define NT_SUCCESS(x) ((x) >= 0)
#define STATUS_INFO_LENGTH_MISMATCH 0xc0000004

#define SystemHandleInformation 16
#define ObjectBasicInformation 0
#define ObjectNameInformation 1
#define ObjectTypeInformation 2

typedef NTSTATUS(NTAPI *_NtQuerySystemInformation)(
    ULONG SystemInformationClass,
    PVOID SystemInformation,
    ULONG SystemInformationLength,
    PULONG ReturnLength
    );
typedef NTSTATUS(NTAPI *_NtDuplicateObject)(
    HANDLE SourceProcessHandle,
    HANDLE SourceHandle,
    HANDLE TargetProcessHandle,
    PHANDLE TargetHandle,
    ACCESS_MASK DesiredAccess,
    ULONG Attributes,
    ULONG Options
    );
typedef NTSTATUS(NTAPI *_NtQueryObject)(
    HANDLE ObjectHandle,
    ULONG ObjectInformationClass,
    PVOID ObjectInformation,
    ULONG ObjectInformationLength,
    PULONG ReturnLength
    );

typedef struct _UNICODE_STRING
{
    USHORT Length;
    USHORT MaximumLength;
    PWSTR Buffer;
} UNICODE_STRING, *PUNICODE_STRING;

typedef struct _SYSTEM_HANDLE
{
    ULONG ProcessId;
    BYTE ObjectTypeNumber;
    BYTE Flags;
    USHORT Handle;
    PVOID Object;
    ACCESS_MASK GrantedAccess;
} SYSTEM_HANDLE, *PSYSTEM_HANDLE;

typedef struct _SYSTEM_HANDLE_INFORMATION
{
    ULONG HandleCount;
    SYSTEM_HANDLE Handles[1];
} SYSTEM_HANDLE_INFORMATION, *PSYSTEM_HANDLE_INFORMATION;

typedef enum _POOL_TYPE
{
    NonPagedPool,
    PagedPool,
    NonPagedPoolMustSucceed,
    DontUseThisType,
    NonPagedPoolCacheAligned,
    PagedPoolCacheAligned,
    NonPagedPoolCacheAlignedMustS
} POOL_TYPE, *PPOOL_TYPE;

typedef struct _OBJECT_TYPE_INFORMATION
{
    UNICODE_STRING Name;
    ULONG TotalNumberOfObjects;
    ULONG TotalNumberOfHandles;
    ULONG TotalPagedPoolUsage;
    ULONG TotalNonPagedPoolUsage;
    ULONG TotalNamePoolUsage;
    ULONG TotalHandleTableUsage;
    ULONG HighWaterNumberOfObjects;
    ULONG HighWaterNumberOfHandles;
    ULONG HighWaterPagedPoolUsage;
    ULONG HighWaterNonPagedPoolUsage;
    ULONG HighWaterNamePoolUsage;
    ULONG HighWaterHandleTableUsage;
    ULONG InvalidAttributes;
    GENERIC_MAPPING GenericMapping;
    ULONG ValidAccess;
    BOOLEAN SecurityRequired;
    BOOLEAN MaintainHandleCount;
    USHORT MaintainTypeList;
    POOL_TYPE PoolType;
    ULONG PagedPoolUsage;
    ULONG NonPagedPoolUsage;
} OBJECT_TYPE_INFORMATION, *POBJECT_TYPE_INFORMATION;

PVOID GetLibraryProcAddress(PSTR LibraryName, PSTR ProcName)
{
    return GetProcAddress(GetModuleHandleA(LibraryName), ProcName);
}

namespace ace {
    namespace pbo {

        bool search::index_files() {
            return index_files(".*");
        }

        bool search::index_files(const std::string &filter) {
            std::ifstream pbo_stream;
            std::regex txt_regex(filter);

            if (_active_pbo_list.size() < 1)
                return false;

            for (auto & pbo_file_path : _active_pbo_list) {
                pbo_stream.open(pbo_file_path, std::ios::binary | std::ios::in);
                if (!pbo_stream.good()) {
                    LOG(ERROR) << "Cannot open file - " << pbo_file_path;
                    continue;
                }

                ace::pbo::archive _archive(pbo_stream);
                for (ace::pbo::entry_p & entry : _archive.entries) {
                    if (entry->filename != "") {
                        if (std::regex_match(entry->filename, txt_regex)) {
                            std::string full_virtual_path = _archive.info->data + "\\" + entry->filename;
                            std::transform(full_virtual_path.begin(), full_virtual_path.end(), full_virtual_path.begin(), ::tolower);
                            _file_pbo_index[full_virtual_path] = pbo_file_path;
                            //LOG(DEBUG) << full_virtual_path << " = " << pbo_file_path;
                        }
                    }
                }
                pbo_stream.close();
            }

            LOG(INFO) << "PBO Index complete";

            return true;
        }

        search::search(const std::string & filter) {
            generate_pbo_list();
            index_files(filter);
        }

        search::search() {
            generate_pbo_list();
            index_files();
        }

        bool search::generate_pbo_list() {
            NTSTATUS status;
            PSYSTEM_HANDLE_INFORMATION handleInfo;
            ULONG handleInfoSize = 0x10000;
            ULONG pid;
            HANDLE processHandle;
            ULONG i;

            _NtQuerySystemInformation NtQuerySystemInformation =
                (_NtQuerySystemInformation)GetLibraryProcAddress("ntdll.dll", "NtQuerySystemInformation");
            _NtDuplicateObject NtDuplicateObject =
                (_NtDuplicateObject)GetLibraryProcAddress("ntdll.dll", "NtDuplicateObject");
            _NtQueryObject NtQueryObject =
                (_NtQueryObject)GetLibraryProcAddress("ntdll.dll", "NtQueryObject");

            if (!NtQuerySystemInformation || !NtDuplicateObject || !NtQueryObject)
                return false;

            pid = GetCurrentProcessId();
            processHandle = GetCurrentProcess();

            handleInfo = (PSYSTEM_HANDLE_INFORMATION)malloc(handleInfoSize);

            while ((status = NtQuerySystemInformation(
                SystemHandleInformation,
                handleInfo,
                handleInfoSize,
                NULL
                )) == STATUS_INFO_LENGTH_MISMATCH)
                handleInfo = (PSYSTEM_HANDLE_INFORMATION)realloc(handleInfo, handleInfoSize *= 2);

            /* NtQuerySystemInformation stopped giving us STATUS_INFO_LENGTH_MISMATCH. */
            if (!NT_SUCCESS(status))
            {
                LOG(ERROR) << "Error opening object for pbo search";
                free(handleInfo);
                return false;
            }

            for (i = 0; i < handleInfo->HandleCount; i++)
            {
                SYSTEM_HANDLE handle = handleInfo->Handles[i];
                HANDLE dupHandle = NULL;
                POBJECT_TYPE_INFORMATION objectTypeInfo;
                PVOID objectNameInfo;
                UNICODE_STRING objectName;
                ULONG returnLength;

                /* Check if this handle belongs to the PID the user specified. */
                if (handle.ProcessId != pid)
                    continue;

                /* Duplicate the handle so we can query it. */
                if (!NT_SUCCESS(NtDuplicateObject(
                    processHandle,
                    (HANDLE)handle.Handle,
                    GetCurrentProcess(),
                    &dupHandle,
                    0,
                    0,
                    0
                    )))
                {
                    continue;
                }

                /* Query the object type. */
                objectTypeInfo = (POBJECT_TYPE_INFORMATION)malloc(0x1000);
                if (!NT_SUCCESS(NtQueryObject(
                    dupHandle,
                    ObjectTypeInformation,
                    objectTypeInfo,
                    0x1000,
                    NULL
                    )))
                {
                    CloseHandle(dupHandle);
                    continue;
                }

                /* Query the object name (unless it has an access of
                0x0012019f, on which NtQueryObject could hang. */
                if (handle.GrantedAccess == 0x0012019f)
                {

                    free(objectTypeInfo);
                    CloseHandle(dupHandle);
                    continue;
                }

                objectNameInfo = malloc(0x1000);
                if (!NT_SUCCESS(NtQueryObject(
                    dupHandle,
                    ObjectNameInformation,
                    objectNameInfo,
                    0x1000,
                    &returnLength
                    )))
                {
                    /* Reallocate the buffer and try again. */
                    objectNameInfo = realloc(objectNameInfo, returnLength);
                    if (!NT_SUCCESS(NtQueryObject(
                        dupHandle,
                        ObjectNameInformation,
                        objectNameInfo,
                        returnLength,
                        NULL
                        )))
                    {
                        free(objectTypeInfo);
                        free(objectNameInfo);
                        CloseHandle(dupHandle);
                        continue;
                    }
                }

                /* Cast our buffer into an UNICODE_STRING. */
                objectName = *(PUNICODE_STRING)objectNameInfo;
               
                

                /* Print the information! */
                if (objectName.Length)
                {
                    std::wstring tmp_type(objectTypeInfo->Name.Buffer);
                    std::wstring tmp_name(objectName.Buffer);
                    
                    std::string object_type(tmp_type.begin(), tmp_type.end());
                    std::string object_name(tmp_name.begin(), tmp_name.end());
                    if (object_type == "File" && object_name.find(".pbo") != object_name.npos) {
                        char buffer[MAX_PATH];
                        GetFinalPathNameByHandle(dupHandle, buffer, sizeof(buffer), VOLUME_NAME_DOS);

                        LOG(DEBUG) << "Pbo: " << buffer;
                        _active_pbo_list.push_back(std::string(buffer));
                    }
                }              

                free(objectTypeInfo);
                free(objectNameInfo);
                CloseHandle(dupHandle);
            }

            free(handleInfo);

            return true;
        }
    }
}

#endif
