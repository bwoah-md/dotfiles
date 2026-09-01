{ ... }:
{
  networking = {
    hostName = "nix";
    networkmanager = {
      enable = true;
      # Prevent NetworkManager DHCP from overriding static Cloudflare nameservers
      dns = "none";
    };
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
    firewall = {
      enable = true;
      # LocalSend ports (53317) are also opened via
      # programs.localsend.openFirewall in services/integrations.nix
      allowedTCPPorts = [ 53317 ];
      allowedUDPPorts = [ 53317 ];
    };
  };
  # Explicitly disable PulseAudio to prevent socket conflicts
  services.pulseaudio.enable = false;
  # Realtime scheduling support (needed by PipeWire)
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # sshfs mounting (phone via Termux over LAN)
  programs.fuse.userAllowOther = true;
}
