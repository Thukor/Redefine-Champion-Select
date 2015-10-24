require 'pathname'
require 'fileutils'

def loadFiles(directory)
	fileArray = []
	FileUtils.cd(directory, :verbose => true)
	Dir.foreach(directory) do |fileName|
		if File.extname(fileName) == ".mp3"
			fileArray.push(fileName)
		end
	end

	return fileArray
end


directory = "C:\\Users\\Christian\\Desktop\\LeagueMUSIC"
print directory

array = loadFiles(directory)
print array.count()
