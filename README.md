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

## Usage with yazi
Hover over a file or press `space` to select several files, then press `;` to run a shell command.
<img width="1062" height="145" alt="image" src="https://github.com/user-attachments/assets/b4dca80f-4887-4939-8a70-80672b734e0e" />

The `"$@"` is equivalent to passing the files as arguments.

## Dependencies

- ffmpeg
