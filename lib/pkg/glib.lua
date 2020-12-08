return {
    source = {
        type      = 'dist',
        location  = 'https://download.gnome.org/sources/glib/2.40/glib-2.40.2.tar.xz',
        sha256sum = 'e8ff8af2950897e805408480c454c415d1eade4e670ec5fb507f5e5853726c7a'
    },
    build = {
        type = 'gnu',
        options = {
            '--disable-maintainer-mode',
            '--enable-debug=no',
            '--disable-gc-friendly',
            '--disable-mem-pools',
            '--disable-rebuilds',
            '--disable-installed-tests',
            '--disable-always-build-tests',
            '--enable-largefile',
            '--disable-static',
            '--enable-shared',
            '--disable-selinux',
            '--disable-fam',
            '--disable-xattr',
            '--disable-libelf',
            '--disable-gtk-doc',
            '--disable-gtk-doc-html',
            '--disable-gtk-doc-pdf',
            '--disable-man',
            '--disable-dtrace',
            '--disable-systemtap',
            '--disable-coverage',
            '--disable-Bsymbolic',
            '--disable-znodelete',
            '--with-pcre=internal',
        },
        autoreconf = true
    },
    install = {
        libs = { 'glib-2.0', 'gthread-2.0', 'gobject-2.0', 'gmodule-2.0', 'gio-2.0' }
    },
    requires = { 'libffi', 'zlib' }
}
