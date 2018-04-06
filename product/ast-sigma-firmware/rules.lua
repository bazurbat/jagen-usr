-- Sigma rules

-- base

package { 'ast-files' }

package { 'cmake-modules' }

package { 'linux' }

package { 'xsdk' }

package { 'ucode', 'target',
    { 'install' }
}

package { 'rootfs', 'target' }

package { 'ezboot', 'target' }

-- host

package { 'utils', 'host' }

package { 'karaoke-player', 'host',
    requires = {
        'chicken-eggs',
        'ffmpeg',
        'libuv',
    },
    { 'configure',
        { 'astindex', 'unpack' },
    }
}

package { 'astindex',
    { 'unpack', { 'karaoke-player', 'unpack' } }
}

-- kernel

package { 'kernel', 'target',
    { 'configure',
        { 'linux', 'unpack' },
    },
    { 'compile',
        { 'rootfs', 'compile', 'target' }
    },
    { 'image',
        requires = {
            'loop-aes',
            'ralink',
            'rootfs',
        }
    }
}

package { 'loop-aes',
    uses = { 'kernel', 'rootfs' },
    env = {
        INSTALL_MOD_PATH = '$rootfs_root'
    },
}

-- rootfs

local rootfs_template = {
    config = 'target',
    { 'install',
        { 'rootfs', 'compile', 'target' }
    }
}

package { 'rootfs', 'target',
    { 'configure',
        { 'ast-files', 'unpack' },
        { 'xsdk',      'unpack' },
    },
    { 'install',
        requires = {
            template = rootfs_template,
            'busybox',
            'gnupg',
            'loop-aes',
            'mrua',
            'ntpclient',
            'ralink',
            'util-linux',
            'utils',
        }
    }
}

package { 'busybox', 'target',
    uses = 'rootfs',
    install = {
        root = '$rootfs_root',
        prefix = ''
    },
    { 'patch', { 'ast-files', 'unpack' } }
}

package { 'utils', 'target',
    template = rootfs_template,
    requires = { 'gpgme' },
    { 'configure',
        { 'dbus', 'install', 'target' }
    }
}

package { 'ezboot', 'target',
    requires = { 'rootfs' }
}

-- firmware

local firmware_rule_template = {
    config = 'target',
    install = {
        prefix = '/firmware'
    },
    { 'install', { 'firmware', 'unpack' } }
}

package { 'firmware', 'target',
    uses = 'mrua',
    requires = {
        template = firmware_rule_template,
        'ezboot',
        'karaoke-player',
        'mrua',
        'rsync',
        'ucode',
        'wpa_supplicant',
    },
    install = {
        prefix = '/firmware'
    },
    { 'compile' },
    { 'install',
        { 'kernel', 'image', 'target' }
    }
}

package { 'karaoke-player',
    template = firmware_rule_template,
    requires = {
        'chicken-eggs',
        'connman',
        'dbus',
        'ffmpeg',
        'freetype',
        'libass',
        'libpng',
        'libuv',
        'mrua',
        'soundtouch',
        'sqlite',
    },
    { 'configure',
        { 'astindex', 'unpack' },
        { 'chicken-eggs', 'install', 'host' }
    },
    uses = { 'mrua', 'rootfs' }
}

package { 'chicken', 'host' }

package { 'chicken-eggs', 'host' }

package { 'chicken', 'target',
    { 'configure', { 'chicken', 'install', 'host' } }
}

package { 'chicken-eggs', 'target',
    template = firmware_rule_template,
    requires = {
        'dbus',
        'sqlite',
    },
    { 'configure',
        { 'chicken-eggs', 'install', 'host' }
    }
}
