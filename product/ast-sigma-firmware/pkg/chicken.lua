return {
    source = {
        type     = 'git',
        location = 'git@bitbucket.org:art-system/chicken-scheme.git',
        name     = 'chicken-scheme',
        branch   = 'release-cmake'
    },
    build = {
        type = 'cmake',
        options = {
            '-DCMAKE_SYSTEM_PROCESSOR=mips32'
        }
    }
}
