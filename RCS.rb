=begin
	Required libraries for functionality
=end

require 'pathname'
require 'fileutils'

#Extends String class to be able to check if a directory is a release directory
class String
  def isInteger? 
	return self.to_i.to_s == self
  end
end

#Loads music files from a given directory
def loadMusic(directory)
	fileArray = []  #declare an empty file array

	Dir.foreach(directory) do |fileName|
		if File.extname(fileName) == ".mp3" #retrieve the music files
			fileArray.push(fileName)  #push them to back of array
		end
	end 
	return fileArray #return the array of files
end

#Randomly selects two music tracks from a given music file array
private def selectTwoTracks(musicArray)
	
	if musicArray.length == 0  #return an empty array if the array passed has no files
		return []
	end

	Random.new_seed()  #Generate a new seed

	r1 = rand(musicArray.length())	#first random index
	r2 = rand(musicArray.length())  #second random index

	while r2 == r1  #if the two random indices generated are equal
		r2 = rand(musicArray.length()) #generate a new second random index until they are not the same
	end

	twoTracks = [musicArray[r1], musicArray[r2]] #create an array that has the two randomly selected files
	return twoTracks #return that array
end
	

=begin
	The core function for this script

	Functionality:
		1: takes in two directories, a source directory and a target directory, as well as an array of music files 
		2: Determines which two songs to move and moves them
=end
def redefineChampionSelect(originalDir, newDir, musicArray) 
	if Dir.exist? originalDir and Dir.exist? newDir #make sure the directory exists
		musicFiles = selectTwoTracks(musicArray) #randomly selects two music files
		Dir.entries(newDir).each do |folderName|
			if folderName[0].isInteger?
				newDir += folderName + "\\" + "deploy\\assets\\sounds\\ambient\\"
			end
		end

		FileUtils.cd(originalDir)

		blindOrDraft = 0  #counter to decide which song goes to the League folder; 0 = draft, 1 = blind

		musicFiles.each do |musicFile|
			FileUtils.cp(originalDir + File.basename(musicFile), newDir)  #copy the music file in question
			FileUtils.cd(newDir) #move to the new directory
			if blindOrDraft == 0 #if draft pick
				if File.exist?("ChmpSlct_DraftMode.mp3") #check to see if the file exists
					File.delete("ChmpSlct_DraftMode.mp3") #if it does, delete it
				end
				File.rename((File.basename musicFile), "ChmpSlct_DraftMode.mp3") #rename the selected file to the appropriate name
			elsif blindOrDraft == 1 #If Blind pick
				if File.exist?("ChmpSlct_BlindPick.mp3") #check to see if the file exists
					File.delete("ChmpSlct_BlindPick.mp3") #if it does delete it
				end
				File.rename((File.basename musicFile), "ChmpSlct_BlindPick.mp3") #rename the selected file to the appropriate name
			end
			blindOrDraft += 1 #change to the next queue type
		end
	end
end

	


