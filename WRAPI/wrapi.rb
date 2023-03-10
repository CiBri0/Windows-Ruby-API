module WRAPI
    require 'Win32API'
    require "down"

    class Background
        def self.replace(wallpaper_path)
            systemParametersInfo = Win32API.new('user32', 'SystemParametersInfo', ['I','I','P','I'], 'I')
            systemParametersInfo.call(20, 0, wallpaper_path, 0x1 | 0x2)
        end

        def self.replace_from_web(url, dest = ENV["TEMP"] + "/background.png" )
            download(url, dest)
            replace(dest)
        end

        def self.download(url, dest)
            Down.download(url, destination: dest)
        end
    end
end
