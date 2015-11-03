load 'RCS.rb'

if __FILE__ == $0
	#changes this to your music directory
    musicDirectory = "C:\\Users\\Christian\\Desktop\\LeagueMUSIC\\"

    #this can stay the same
    leagueDirectory = "C:\\Riot Games\\League of Legends\\RADS\\projects\\lol_air_client\\releases\\0.0.1.165\\deploy\\assets\\sounds\\ambient"

    #Load the music files and move them
    musicArray = loadMusic(musicDirectory)
    redefineChampionSelect(musicDirectory, leagueDirectory, musicArray)
end