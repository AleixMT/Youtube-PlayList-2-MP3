# Install dependencies
sudo apt-get install -y python3 python3-pip curl ffmpeg git

# Install PyTube
python3 -m pip install git+https://github.com/pytube/pytube

# Use command line to scratch audio from videos in a public YouTube playlist
# This will create the folder _Music which will contain all the downloaded audio in mp4 format.
echo "Downloading all music in .mp4 format"
pytube https://www.youtube.com/playlist?list=PLsS6gopj1BA0hCo27eqw1eB6lLK6Fu-9Z -a  

echo "Transforming mp4 files to mp3"
# Transform into mp3 using ffmpeg and conserving filename (assuming that ".mp4" extension is always present).
for file_name in *; do
  ffmpeg -i "${filename}" "$(echo "${filename}" | rev | cut -d "." -f2- | rev)".mp3
done
