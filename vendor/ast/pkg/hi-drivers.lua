return {
    source = {
        type     = 'git',
        location = 'git@bitbucket.org:art-system/hi-drivers.git',
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
