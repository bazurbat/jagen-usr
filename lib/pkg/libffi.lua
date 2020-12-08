return {
    source = {
        type      = 'dist',
        location  = 'ftp://sourceware.org/pub/libffi/libffi-3.1.tar.gz',
        sha512sum = '8994973d75facf5ad928c270e17b1a56e24d1543af75b93731a0048e747df27e4190a736b6dc2dca7d43de1d7e88891220304802c10fcccdcebee9c9ffd3d1b9'
    },
    build = {
        type    = 'gnu',
        options = { '--disable-builddir' },
        libs    = { 'ffi' },
        autoreconf = true,
        -- upstream default
        cflags = '-O3 -fomit-frame-pointer -fstrict-aliasing -ffast-math'
    }
}
