return {
    -- {}
    { "mistricky/codesnap.nvim", tag = "v2.0.1",
        cmd = { "CodeSnap", "CodeSnapSave", "CodeSnapASCII", "CodeSnapHighlight", "CodeSnapSaveHighlight" },
        opts = {
            snapshot_config = {
                window = {
                    mac_window_bar = false,
                    margin = {
                        x = 35,
                        y = 35,
                    },
                },
                watermark = {
                    content = "",
                    font_family = "Pacifico",
                    color = "#ffffff",
                },
                background = "#00000000"
            },
        }
    }
}
