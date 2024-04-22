{config, pkgs, ...}:
{
  service.mpd = {
    enable = true;
    musicDirectory = "~/.music"
    extraConfig = ''
      audio_output {
	type "pulse"
	name "PulseAudio"
      }
    '';
  };
}
