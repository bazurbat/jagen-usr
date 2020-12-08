return {
    source = {
        type      = 'dist',
        location  = 'http://zlib.net/zlib-1.2.8.tar.gz',
        sha256sum = '36658cb768a54c1d4dec43c3116c27ed893e88b02ecfcb44f2166f9c0b7f2a0d'
    },
    build = {
        type = 'make',
        in_source = true,
        -- upstream default, should be safe
        cflags = '-O3'
    }
}
