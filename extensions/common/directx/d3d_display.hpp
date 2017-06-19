#pragma once

#ifdef USE_DIRECTX

#include <windows.h>
#include <d3d11_1.h>
#include <directxcolors.h>
#include <DirectXMath.h>

#include <thread>
#include <memory>
#include <mutex>

#include "singleton.hpp"
#include "vector.hpp"

#define IDI_ACE_DEBUG 666

namespace ace {
    namespace debug {

        __declspec(align(16))
        struct camera_movement {
            camera_movement() {
                XMStoreFloat4(&DefaultForward, DirectX::XMVectorSet(0.0f, 0.0f, 1.0f, 0.0f));
                XMStoreFloat4(&DefaultRight, DirectX::XMVectorSet(1.0f, 0.0f, 0.0f, 0.0f));
                XMStoreFloat4(&camForward, DirectX::XMVectorSet(0.0f, 0.0f, 1.0f, 0.0f));
                XMStoreFloat4(&camRight, DirectX::XMVectorSet(1.0f, 0.0f, 0.0f, 0.0f));

                camYaw = 0.0f;
                camPitch = 0.0f;

                moveLeftRight = 0.0f;
                moveBackForward = 0.0f;

                XMStoreFloat4(&camPosition, DirectX::XMVectorSet(0.0f, 12.0f, 6.0f, 0.0f));
                XMStoreFloat4(&camTarget, DirectX::XMVectorSet(0.0f, 0.0f, 0.0f, 0.0f));
                XMStoreFloat4(&camUp, DirectX::XMVectorSet(0.0f, 1.0f, 0.0f, 0.0f));
            }

            DirectX::XMFLOAT4 DefaultForward;
            DirectX::XMFLOAT4 DefaultRight;
            DirectX::XMFLOAT4 camForward;
            DirectX::XMFLOAT4 camRight;

            DirectX::XMFLOAT4X4  camRotationMatrix;
            DirectX::XMFLOAT4X4  groundWorld;

            float moveLeftRight;
            float moveBackForward;

            float camYaw;
            float camPitch;

            DirectX::XMFLOAT4 camPosition;
            DirectX::XMFLOAT4 camTarget;
            DirectX::XMFLOAT4 camUp;
        };

        struct d3d_display_worker;
        struct d3d_display_worker_args;
        __declspec(align(16))
        class d3d_display {
        public:
            d3d_display();
            ~d3d_display();

            virtual bool run();
            virtual bool render();
            virtual bool render_thread(uint32_t, uint32_t, bool);

            virtual void update_camera();
            virtual bool step();

            virtual bool create(uint32_t, uint32_t, bool);
            virtual bool init();
            virtual bool init_input();

            virtual bool destroy();

            void render_worker(d3d_display_worker_args);

            static LRESULT CALLBACK wndproc(HWND, UINT, WPARAM, LPARAM);
            LRESULT CALLBACK _wndproc(HWND, UINT, WPARAM, LPARAM);
        protected:
            void                                _move_camera(ace::vector3<float>);
            void                                _rotate_camera(ace::vector3<float>);

            std::unique_ptr<d3d_display_worker> _render_thread;
            std::mutex                            _render_lock;

            bool                                _fullscreen;
            HINSTANCE                           _hInst = nullptr;
            HWND                                _hWnd = nullptr;
            D3D_DRIVER_TYPE                     _driverType = D3D_DRIVER_TYPE_NULL;
            D3D_FEATURE_LEVEL                   _featureLevel = D3D_FEATURE_LEVEL_11_0;
            ID3D11Device*                       _pd3dDevice = nullptr;
            ID3D11DeviceContext*                _pImmediateContext = nullptr;
            IDXGISwapChain*                     _pSwapChain = nullptr;
            ID3D11RenderTargetView*             _pRenderTargetView = nullptr;
            ID3D11Texture2D*                    _pDepthStencil = nullptr;
            ID3D11DepthStencilView*             _pDepthStencilView = nullptr;

            ID3D11ShaderResourceView*           _pTextureRV1 = nullptr;
            ID3D11ShaderResourceView*           _pTextureRV2 = nullptr;
            ID3D11InputLayout*                  _pBatchInputLayout = nullptr;

            DirectX::XMFLOAT4X4                 _World;
            DirectX::XMFLOAT4X4                 _View;
            DirectX::XMFLOAT4X4                 _Projection;

            RAWMOUSE                            _last_mouse_state;
            camera_movement                     _camera;

        };
        struct d3d_display_worker_args {
            d3d_display_worker_args(uint32_t w, uint32_t h, bool f) : width(w), height(h), fullscreen(f) {}
            uint32_t width;
            uint32_t height;
            bool     fullscreen;
        };
        struct d3d_display_worker {
            d3d_display_worker(d3d_display * obj, d3d_display_worker_args args) : thread(&ace::debug::d3d_display::render_worker, obj, args) {}
            ~d3d_display_worker() { thread.join(); }
            std::thread thread;
        };
    };
};

#endif