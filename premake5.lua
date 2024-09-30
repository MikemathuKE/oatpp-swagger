project "oatpp-swagger"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "src/oatpp-swagger/**.hpp",
        "src/oatpp-swagger/**.cpp"
    }

    includedirs {
        "src",
        "../oatpp/src"
    }

    defines {
        "OATPP_DISABLE_ENV_OBJECT_COUNTERS=ON",
        "OATPP_BUILD_TESTS=OFF",
        "_CRT_SECURE_NO_WARNINGS"
    }

    links {
        "oatpp"
    }

    filter "system:linux"
        systemversion "latest"
        
        libdirs {
            "%{prj.location}/vendor/oatpp/bin" .. outputdir .. "/oatpp"
        }

    filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"