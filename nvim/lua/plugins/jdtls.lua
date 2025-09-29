return {
    "mfussenegger/nvim-jdtls",
    opts = {
        jdtls = function(opts)
            opts.settings = {
                java = {
                    eclipse = {
                        downloadSources = true,
                    },
                    configuration = {
                        -- These are potential runtimes that the project can use. I believe for these to be used, the maven or
                        -- gradle config files need to specify that a specific runtime should be used, or you can set it with
                        -- :JdtSetRuntime.
                        runtimes = {
                            {
                                name = "Java-8",
                                path = "/usr/lib/jvm/temurin-8-jdk-amd64/",
                            },
                            {
                                name = "Java-21",
                                path = "/usr/lib/jvm/java-21-openjdk-amd64/",
                            },
                        },
                    },
                    inlayHints = {
                        parameterNames = {
                            enabled = "all",
                        },
                    },
                    maven = {
                        downloadSources = true,
                    },
                    references = {
                        includeDecompiledSources = true,
                    },
                    referencesCodeLens = {
                        enabled = true,
                    },
                },
            }
            return opts
        end,
    },
}
