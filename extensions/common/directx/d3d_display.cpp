#ifdef USE_DIRECTX 

#include "d3d_display.hpp"

#include <thread>

using namespace  DirectX;

namespace ace {
    namespace debug {
        d3d_display::d3d_display() {}
        d3d_display::~d3d_display() {}

        bool d3d_display::render_thread(uint32_t w, uint32_t h, bool f) {
            _render_thread = std::make_unique<d3d_display_worker>(this, d3d_display_worker_args(w, h, f) );
            return true;
        }

        void d3d_display::render_worker(d3d_display_worker_args args) {
            create(args.width, args.height, args.fullscreen);
            init();
            run();
        }

        bool d3d_display::run() {
            MSG msg = { 0 };

            while (WM_QUIT != msg.message) {
                if (PeekMessage(&msg, nullptr, 0, 0, PM_REMOVE)) {
                    TranslateMessage(&msg);
                    DispatchMessage(&msg);
                } else {
                    render();
                }
            }

            return true;
        }

        bool d3d_display::init() {
            HRESULT hr = S_OK;

            RECT rc;
            GetClientRect(_hWnd, &rc);
            UINT width = rc.right - rc.left;
            UINT height = rc.bottom - rc.top;

            UINT createDeviceFlags = 0;
#ifdef _DEBUG
            createDeviceFlags |= D3D11_CREATE_DEVICE_DEBUG;
#endif

            D3D_DRIVER_TYPE driverTypes[] =
            {
                D3D_DRIVER_TYPE_HARDWARE,
                D3D_DRIVER_TYPE_WARP,
                D3D_DRIVER_TYPE_REFERENCE,
            };
            UINT numDriverTypes = ARRAYSIZE(driverTypes);

            D3D_FEATURE_LEVEL featureLevels[] =
            {
                D3D_FEATURE_LEVEL_11_0,
                D3D_FEATURE_LEVEL_10_1,
                D3D_FEATURE_LEVEL_10_0,
            };
            UINT numFeatureLevels = ARRAYSIZE(featureLevels);

            DXGI_SWAP_CHAIN_DESC sd;
            ZeroMemory(&sd, sizeof(sd));
            sd.BufferCount = 1;
            sd.BufferDesc.Width = width;
            sd.BufferDesc.Height = height;
            sd.BufferDesc.Format = DXGI_FORMAT_R8G8B8A8_UNORM;
            sd.BufferDesc.RefreshRate.Numerator = 60;
            sd.BufferDesc.RefreshRate.Denominator = 1;
            sd.BufferUsage = DXGI_USAGE_RENDER_TARGET_OUTPUT;
            sd.OutputWindow = _hWnd;
            sd.SampleDesc.Count = 1;
            sd.SampleDesc.Quality = 0;
            sd.Windowed = TRUE;

            for (UINT driverTypeIndex = 0; driverTypeIndex < numDriverTypes; driverTypeIndex++)
            {
                _driverType = driverTypes[driverTypeIndex];
                hr = D3D11CreateDeviceAndSwapChain(nullptr, _driverType, nullptr, createDeviceFlags, featureLevels, numFeatureLevels,
                    D3D11_SDK_VERSION, &sd, &_pSwapChain, &_pd3dDevice, &_featureLevel, &_pImmediateContext);
                if (SUCCEEDED(hr))
                    break;
            }
            if (FAILED(hr))
                return false;

            // Create a render target view
            ID3D11Texture2D* pBackBuffer = nullptr;
            hr = _pSwapChain->GetBuffer(0, __uuidof(ID3D11Texture2D), (LPVOID*)&pBackBuffer);
            if (FAILED(hr))
                return false;

            hr = _pd3dDevice->CreateRenderTargetView(pBackBuffer, nullptr, &_pRenderTargetView);
            pBackBuffer->Release();
            if (FAILED(hr))
                return false;

            // Create depth stencil texture
            D3D11_TEXTURE2D_DESC descDepth;
            ZeroMemory(&descDepth, sizeof(descDepth));
            descDepth.Width = width;
            descDepth.Height = height;
            descDepth.MipLevels = 1;
            descDepth.ArraySize = 1;
            descDepth.Format = DXGI_FORMAT_D24_UNORM_S8_UINT;
            descDepth.SampleDesc.Count = 1;
            descDepth.SampleDesc.Quality = 0;
            descDepth.Usage = D3D11_USAGE_DEFAULT;
            descDepth.BindFlags = D3D11_BIND_DEPTH_STENCIL;
            descDepth.CPUAccessFlags = 0;
            descDepth.MiscFlags = 0;
            hr = _pd3dDevice->CreateTexture2D(&descDepth, nullptr, &_pDepthStencil);
            if (FAILED(hr))
                return false;

            // Create the depth stencil view
            D3D11_DEPTH_STENCIL_VIEW_DESC descDSV;
            ZeroMemory(&descDSV, sizeof(descDSV));
            descDSV.Format = descDepth.Format;
            descDSV.ViewDimension = D3D11_DSV_DIMENSION_TEXTURE2D;
            descDSV.Texture2D.MipSlice = 0;
            hr = _pd3dDevice->CreateDepthStencilView(_pDepthStencil, &descDSV, &_pDepthStencilView);
            if (FAILED(hr))
                return false;

            _pImmediateContext->OMSetRenderTargets(1, &_pRenderTargetView, _pDepthStencilView);

            // Setup the viewport
            D3D11_VIEWPORT vp;
            vp.Width = (FLOAT)width;
            vp.Height = (FLOAT)height;
            vp.MinDepth = 0.0f;
            vp.MaxDepth = 1.0f;
            vp.TopLeftX = 0;
            vp.TopLeftY = 0;
            _pImmediateContext->RSSetViewports(1, &vp);

            return true;
        }

        bool d3d_display::create(uint32_t width = 1024, uint32_t height = 768, bool fullscreen = false) {
            WNDCLASSEXW wcex;
            wcex.cbSize = sizeof(WNDCLASSEXW);
            wcex.style = CS_HREDRAW | CS_VREDRAW;
            wcex.lpfnWndProc = (WNDPROC)&ace::debug::d3d_display::wndproc;
            wcex.cbClsExtra = 0;
            wcex.cbWndExtra = 0;
            wcex.hInstance = (HINSTANCE)GetCurrentProcess();
            //wcex.hIcon = LoadIcon(hInstance, (LPCTSTR)IDI_SAMPLE1);
            //wcex.hCursor = LoadCursor(nullptr, IDC_ARROW);
            wcex.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);
            wcex.lpszMenuName = nullptr;
            wcex.lpszClassName = L"ACE3BaseDisplayClass";
            //wcex.hIconSm = LoadIcon(wcex.hInstance, (LPCTSTR)IDI_SAMPLE1);
            if (!RegisterClassExW(&wcex)) {
                return false;
            }

            // Create window
            _hInst = (HINSTANCE)GetCurrentProcess();
            RECT rc = { 0, 0, width, height };
            AdjustWindowRect(&rc, WS_OVERLAPPEDWINDOW, FALSE);
            _hWnd = CreateWindowW(L"ACE3BaseDisplayClass", L"ACE3 D3D Render", WS_OVERLAPPEDWINDOW,
                CW_USEDEFAULT, CW_USEDEFAULT, rc.right - rc.left, rc.bottom - rc.top, nullptr, nullptr, _hInst,
                nullptr);

            if (!_hWnd) {
             return false;
            }

            SetWindowLongPtr(_hWnd, GWLP_USERDATA, (LONG)this);

            ShowWindow(_hWnd, 5);

            return true;
        }

        bool d3d_display::destroy() {
            if (_pImmediateContext) _pImmediateContext->ClearState();

            if (_pBatchInputLayout) _pBatchInputLayout->Release();

            if (_pTextureRV1) _pTextureRV1->Release();
            if (_pTextureRV2) _pTextureRV2->Release();

            if (_pDepthStencilView) _pDepthStencilView->Release();
            if (_pDepthStencil) _pDepthStencil->Release();
            if (_pRenderTargetView) _pRenderTargetView->Release();
            if (_pSwapChain) _pSwapChain->Release();
            if (_pImmediateContext) _pImmediateContext->Release();
            if (_pd3dDevice) _pd3dDevice->Release();

            return true;
        }

        bool d3d_display::render() {
            // Update our time
            static float t = 0.0f;
            static float dt = 0.f;
            if (_driverType == D3D_DRIVER_TYPE_REFERENCE) {
                t += (float)XM_PI * 0.0125f;
            } else {
                static uint64_t dwTimeStart = 0;
                static uint64_t dwTimeLast = 0;
                uint64_t dwTimeCur = GetTickCount64();
                if (dwTimeStart == 0)
                    dwTimeStart = dwTimeCur;
                t = (dwTimeCur - dwTimeStart) / 1000.0f;
                dt = (dwTimeCur - dwTimeLast) / 1000.0f;
                dwTimeLast = dwTimeCur;
            }

 
            _pImmediateContext->ClearRenderTargetView(_pRenderTargetView, Colors::MidnightBlue);
            _pImmediateContext->ClearDepthStencilView(_pDepthStencilView, D3D11_CLEAR_DEPTH, 1.0f, 0);

            step();

            _pSwapChain->Present(0, 0);

            return true;
        }

        bool d3d_display::step() {
            return true;
        }

        LRESULT CALLBACK d3d_display::_wndproc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam) {
            PAINTSTRUCT ps;
            HDC hdc;

            switch (message) {
            case WM_PAINT:
                hdc = BeginPaint(hWnd, &ps);
                EndPaint(hWnd, &ps);
                break;

            case WM_DESTROY:
                PostQuitMessage(0);
                break;
            default:
                return DefWindowProc(hWnd, message, wParam, lParam);
            }

            return 0;
        }
        LRESULT CALLBACK d3d_display::wndproc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam) {
            LONG data;
            data = GetWindowLongPtr(hWnd, GWLP_USERDATA);
            if (data) {
                return ((d3d_display*)data)->_wndproc(hWnd, message, wParam, lParam);
            } else {
                return DefWindowProc(hWnd, message, wParam, lParam);
            }
        }
    };

    
};

#endif