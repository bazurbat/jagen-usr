return {
    source = {
        location = 'git@bitbucket.org:bazurbat/chicken-scheme.git',
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
