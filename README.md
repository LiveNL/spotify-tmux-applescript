To show the artist and name of the current playing track on Spotify in your [tmux](https://github.com/tmux/tmux) status bar.

Not the first tmux/spotify code. But an attempt to be as simple as possible.

### Requirements

- macOS (as we use applescript)
- Spotify

### Installation

1. Clone this repository
2. `cd` into the root of repository-folder
3. Run the install script:

> The install script will add the code that acutally adds the output of the spotify-script to your status-bar.

```bash
./bin/install.sh
```

4. When you start playing a song on spotify, it should now show in tmux!

### (Install) options

`--filename`: Use parameter to specify the name of the file the code should be added to. Default ~/.tmux.conf."
`--with-datetime`: Add datetime info to your statusbar. Default false"

### Customization

If you want to change the code related that generates the name of the track and artist, please alter `bin/spotify_artist_and_track.applescript`

More spotify commands can be found here: `/Applications/Spotify.app/Contents/Resources/Spotify.sdef`

#### Applescript syntax highlightin in nvim

To get syntax highlighting for applescript (in nvim + lua):

1. Download the syntax file for applescript here: https://www.vim.org/scripts/script.php?script_id=1736
2. Add it to the syntax folder for your nvim runtime. You can find the location by executing the following command in nvim.

```
:echo $VIMRUNTIME . '/syntax'
```

3. Make sure nvim recognises the filetype by adding the following to a lua script file that is used (for example `init.lua`)

```lua
vim.filetype.add({
	extension = {
		applescript = "applescript",
	},
})
```
