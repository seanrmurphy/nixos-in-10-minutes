{ modulesPath, config, lib, pkgs, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
  ];
  boot.loader.grub = {
    # no need to set devices, disko will add all devices that have a EF02 partition to the list already
    # devices = [ ];
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  networking = {
    hostName = "nixos"; # Define your hostname.
    firewall.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Zurich";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # UNCOMMENT this to enable docker
  # virtualisation.docker.enable = true;

  programs.fish.enable = true;

  security.sudo.wheelNeedsPassword = false;

  services = {
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
    };

    # UNCOMMENT this to enable headscale
    # headscale.enable = true;

    # UNCOMMENT this to enable a prometheus node exporter
    # prometheus.exporters.node.enable = true;
    
    # UNCOMMENT this to enable homeassistant-satellite - it's prob necessary to add more configuration here
    # homeassistant-satellite.enable = true;
  };

  environment.systemPackages = map lib.lowPrio [
    pkgs.curl
    pkgs.gitMinimal

    # UNCOMMENT the following to install these packages systemwide
    # pkgs.jq
    # pkgs.neovim
    # pkgs.fzf
  ];

  users.users = {

    root = {
      # change this to your ssh key
      openssh.authorizedKeys.keys = [
        "CHANGE"
      ];
    };

    # UNCOMMENT the following to enable the nixos user
    # nixos = {
    #   isNormalUser = true; 
    #   shell = pkgs.fish; 
    #   description = "nixos user"; 
    #   extraGroups = [ 
    #     "networkmanager" 
    #     "wheel" 
    #     "docker"
    #   ]; 
    #   openssh.authorizedKeys.keys = [
    #     "CHANGE"
    #   ];
    # };

  };

  system.stateVersion = "23.11";
}
