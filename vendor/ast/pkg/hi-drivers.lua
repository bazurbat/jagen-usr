return {
    source = {
        location = 'git@bitbucket.org:bazurbat/hi-drivers.git',
    },
    build = {
        type = 'linux-module',
        in_source = true
    },
    uses = 'kernel',
    -- hardcodes paths to SDK include dirs in Makefile
    { 'compile',
        { 'hi-sdk', 'unpack' }
    }
}
