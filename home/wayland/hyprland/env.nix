{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    settings = {
      env = [
        "SDL_VIDEODRIVER,wayland"
        "CLUTTER_BACKENV,wayland"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME, nvidia"
        "LIBVA_DRIVER_NAME,nvidia"
        #         "WLR_DRM_NO_ATOMIC,1"
      ];
    };
  };
}
