return {
    source = {
        type      = 'dist',
        location  = 'https://dbus.freedesktop.org/releases/dbus/dbus-1.10.14.tar.gz',
        sha256sum = '23238f70353e38ce5ca183ebc9525c0d97ac00ef640ad29cf794782af6e6a083'
    },
    patches = {
        'capi-dbus-1-pc.patch',
        'capi-dbus-add-send-with-reply-set-notify.patch',
        'capi-dbus-add-support-for-custom-marshalling.patch',
        'capi-dbus-block-acquire-io-path-on-send.patch',
        'capi-dbus-correct-dbus-connection-block-pending-call.patch',
        'capi-dbus-send-with-reply-and-block-delete-reply-on-error.patch',
    },
    build  = {
        type = 'gnu',
        -- fails to find lexpat on target otherwise
        configure_needs_install_dir = true,
        options = {
            '--enable-shared',
            '--disable-static',
            '--disable-compiler-coverage',
            '--disable-xml-docs',
            '--disable-doxygen-docs',
            '--disable-ducktype-docs',
            '--enable-abstract-sockets',
            '--disable-selinux',
            '--disable-apparmor',
            '--disable-libaudit',
            '--enable-inotify',
            '--disable-kqueue',
            '--disable-console-owner-file',
            '--disable-launchd',
            '--disable-systemd',
            '--disable-embedded-tests',
            '--disable-modular-tests',
            '--disable-tests',
            '--disable-installed-tests',
            '--enable-epoll',
            '--disable-x11-autolaunch',
            '--disable-Werror',
            '--disable-stats',
            '--without-x',
        }
    },
    install = {
        libs = { 'dbus-1' }
    },
    requires = { 'expat' },
}
