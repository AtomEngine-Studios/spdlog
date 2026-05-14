project "spdlog"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "include/**.h",
        "src/**.cpp"
    }

    includedirs {
        "include"
    }

	defines {
		"_CRT_SECURE_NO_WARNINGS",
        "SPDLOG_COMPILED_LIB",
		"SPDLOG_USE_STD_FORMAT"
	}

	filter "system:windows"
        systemversion "latest"
        buildoptions { "/utf-8" }

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

    filter "configurations:Release"
		runtime "Release"
		optimize "on"
