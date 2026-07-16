# Change Audio Metadata through the command line

## Usage

Download the script from this repository.<br>
```sh
curl -fsSL https://raw.githubusercontent.com/DantorKing/audio-metadata-cli/refs/heads/main/tag -o tag
```
<br>

`chmod +x tag`

### Flags

`-t` — Title<br>
`-al` — Album<br>
`-ar` — Artist<br>


`./tag -t "Title" -al "Album" -ar "Artist" file.mp3`

## Dependencies

- ffmpeg
