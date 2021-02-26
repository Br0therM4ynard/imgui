project "ImGui"
    kind "StaticLib"
    language "C++"

    targetdir (bindir .. "/%{prj.name}")
    objdir (objectdir .. "/%{prj.name}")

    files
    {
        "imconfig.h",
        "imgui.h",
        "imgui.cpp",
        "imgui_draw.cpp",
        "imgui_internal.h",
        "imgui_widgets.cpp",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",
        "imgui_demo.cpp"
    }


    filter { "action:xcode*" }
        XCodeBuildSettings =
        {
        }
        merge(XCodeBuildSettings, OS.XCodeBuildSettings)
        xcodebuildsettings (XCodeBuildSettings)

    filter "system:windows"
        systemversion "latest"
        cppdialect "C++17"
        staticruntime "On"

    filter "system:linux"
        pic "On"
        systemversion "latest"
        cppdialect "C++17"
        staticruntime "On"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
