template { 'install_dir',
    install = { dir = '/aaa' }
}

-- common require added after config-specific

package { 'common-req-added-later-req1',
    build = 'cmake'
}

package { 'common-req-added-later-req2',
    build = 'gnu'
}

package { 'common-req-added-later-main', 'host',
    template = 'install_dir',
    requires = { 'common-req-added-later-req1' }
}

package { 'common-req-added-later-main',
    requires = { 'common-req-added-later-req2' }
}

-- toolchain override

package { 'toolchain-override', 'target',
    build = { toolchain = 'toolchain-override-aaa' }
}

package { 'toolchain-override', 'target',
    build = { toolchain = 'toolchain-override-bbb' }
}
