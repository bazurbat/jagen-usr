template { 'android_cmake',
    build = {
        cmake_executable = '$android_sdk_tools_dir/../cmake/3.6.4111459/bin/cmake'
    },
    requires = { 'android-sdk-tools:host' },
    uses = { 'android-sdk-tools:host' }
}

package { 'prebuiltlib',
    source = {
        location = 'gdrive_document_id',
        filename = 'prebuiltlib.so'
    }
}

package { 'android-ndk',
    export = {
        cmake_options = {
            '-DANDROID_PLATFORM=android-27'
        }
    }
}

package { 'android-standalone-arm',
    build = {
        android_api = 27
    }
}

package { 'vendorpkg',
    source = {
        location = 'git@bitbucket.org:vendor/vendorpkg.git',
        branch = 'android',
        force_update = true,
        shallow = false
    },
    build = {
        type = 'make',
        dir = '${pkg_source_dir}/platforms',
        in_source = 'multi',
    },
    install = false,
    requires = 'libpcap'
}

package { 'vendorpkg', 'host',
    build = {
        options = { 'TARGET=linux', 'core' },
        clean = '${pkg_source_dir}/build/linux',
    },
}

package { 'vendorpkg', 'target',
    build = {
        options = { 'TARGET=android', 'core' },
        clean = '${pkg_source_dir}/build/android',
    },
    env = {
        CPP = 'arm-linux-androideabi-clang++',
        GCC = 'arm-linux-androideabi-clang',
        AR  = 'arm-linux-androideabi-ar',
        CPPFLAGS='-I${jagen_target_dir}/include',
    }
}

package { 'integration',
    template = 'android_cmake',
    source = {
        location = 'git@bitbucket.org:vendor/integration.git',
        shallow = false
    },
    build = 'cmake',
    requires = {
        'capnproto',
        'libpcap',
        'vendorpkg',
        'zeromq',
    },
    uses = { 'vendorpkg' }
}

package { 'integration', 'host',
    build = {
        options = {
            '-DCMAKE_PREFIX_PATH=$jagen_host_dir',
            '-DINTEGRATION_VERSION=`git -C "${pkg_source_dir}" describe --tags --dirty`',
            '-DBUILD_DATE_ENV=`LC_TIME=C date --rfc-3339=seconds`'
        }
    },
    requires = { 'googletest' }
}

package { 'integration', 'target',
    template = 'android_cmake',
    build = {
        toolchain = 'android-ndk',
        options = {
            '-DCMAKE_FIND_ROOT_PATH=$jagen_target_dir',
            '-DCAPNP_EXECUTABLE:FILEPATH=${jagen_host_dir}/bin/capnp',
            '-DCAPNPC_CXX_EXECUTABLE:FILEPATH=${jagen_host_dir}/bin/capnpc-c++',
            '-DINTEGRATION_VERSION=`git -C "${pkg_source_dir}" describe --tags --dirty`',
            '-DBUILD_DATE_ENV=`LC_TIME=C date --rfc-3339=seconds`'
        }
    },
    requires = { 'capnproto:host', 'prebuiltlib' }
}

package { 'capnproto', 'target',
    build = { toolchain = 'android-ndk' }
}

package { 'agent',
    source = {
        location = 'git@bitbucket.org:vendor/agent.git'
    },
    build = 'android-gradle'
}
