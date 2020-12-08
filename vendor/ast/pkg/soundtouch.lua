return {
    source = {
        location = 'git@bitbucket.org:bazurbat/ast-soundtouch.git',
    },
    build = {
        type = 'gnu',
        options = {
            '--enable-integer-samples=yes',
            '--enable-x86-optimizations=no'
        },
        autoreconf = true,
        -- upstream default, should be safe
        cflags = '-O3'
    },
    install = {
        libs = { 'SoundTouch' }
    }
}
