require 'pathname'
require 'fileutils'

def loadMusic(directory)
	fileArray = []

	Dir.foreach(directory) do |fileName|
		if File.extname(fileName) == ".mp3"
			fileArray.push(fileName)
		end
	end 
	return fileArray
end

def selectTwoTracks(musicArray)
	
	if musicArray.length == 0
		return []
	end

	Random.new_seed()

	r1 = rand(musicArray.length())
	r2 = rand(musicArray.length())
	while r2 == r1
		r2 = rand(musicArray.length())
	end

	twoTracks = [musicArray[r1], musicArray[r2]]
	return twoTracks
end
	
 
def redefineChampionSelect(originalDir, newDir, musicArray) 
	if Dir.exist? originalDir and Dir.exist? newDir
		FileUtils.cd(originalDir, :verbose => true)
		FileUtils.cp(originalDir + File.basename(musicFile), newDir)
		FileUtils.cd(newDir, :verbose => true)
		if File.exist?("ChmpSlct_DraftMode.mp3")
			File.delete("ChmpSlct_DraftMode.mp3")
		end
		File.rename((File.basename musicFile), "ChmpSlct_DraftMode.mp3")
	end
end

	


