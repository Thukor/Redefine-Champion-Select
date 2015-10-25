load 'RCS.rb'

if __FILE__ == $0
    musicDirectory = "C:\\Users\\Christian\\Desktop\\LeagueMUSIC\\"
    leagueDirectory = "C:\\Riot Games\\League of Legends\\RADS\\projects\\lol_air_client\\releases\\0.0.1.164\\deploy\\assets\\sounds\\ambient"


    musicArray = loadMusic(musicDirectory)
    redefineChampionSelect(musicDirectory, leagueDirectory, musicArray)
end