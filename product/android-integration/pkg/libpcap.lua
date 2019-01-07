return {
    source = {
        type     = 'dist',
        location = 'https://github.com/the-tcpdump-group/libpcap/archive/libpcap-1.8.1.tar.gz',
        basename = 'libpcap-libpcap-1.8.1',
        sha1sum  = '98f6bd71a6dd18bd9a5cb3dd641c9f454727ceec'
    },
    patches = {
        'libpcap-1.8.1-cross-compile.patch',
        'libpcap-1.8.1-disable-remote.patch',
        'libpcap-1.8.1-libnl.patch',
        'libpcap-1.8.1-usbmon.patch',
        'libpcap-9999-parallel.patch',
    },
    build = {
        type = 'gnu',
        options = {
            -- it fails to compile with different errors if with/without-sita
            -- option is specified explicitly
            '--enable-ipv6',
            '--disable-protochain',
            '--disable-optimizer-dbg',
            '--disable-yydebug',
            '--disable-universal',
            '--disable-shared',
            '--disable-usb',
            '--disable-bluetooth',
            '--disable-dbus',
            '--disable-packet-ring',
            '--without-libnl',
            '--with-pcap=linux',
            '--with-dag=no',
            '--with-septel=no',
            '--with-snf=no',
            '--with-turbocap=no',
        }
    }
}
