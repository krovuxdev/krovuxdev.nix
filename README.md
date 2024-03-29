# Getting started
> [!IMPORTANT]
You should already installed nixOS.

>  [!NOTE]
enable Flake in nixos for build with nixos-rebuild.

# how to enable flake in /nixos/configuration.nix
```nix
nix.settings.experimental-features = ["nix-command" "flakes"];
```
# And Execute You in `/nixos`
```bash
sudo nixos-rebuild switch .
```
# How to Install
## clone repos to Your Directory
```bash
cd && nix run nixpkgs#git -- clone  git@github.com:krovuxdev/krovuxdev.nix.git && cd krovuxdev.nix
```
# Exec
```bash
sudo nixos-rebuild switch --flake .
```
# OR Exec without `flake` 
```bash
sudo nixos-rebuild switch hosts/Nixos-Green/
```

# Shorcuts

| SHORCUT  | PROGRAM TO EXECUTE |
| ------------- | ------------- |
| MOD + ENTER  | terminal  |
| MOD + b  | firefox  |
| MOD + shift + S  | screenshot  |
| MOD + M  | Application launcher | 




<img src="https://github.com/krovuxdev/krovuxdev.nix/assets/62192487/f7f376fd-bc14-40d6-90af-47f68b10b82f" alt="img" align="left" width="640px">

-   **WM**: [Leftwm](https://nixos.org/)
-   **OS**: [Nixos](http://nixos.org/)
-   **Terminal**: [Alacritty](https://github.com/alacritty/alacritty)
-   **Shell**: bash
-   **Compositor**: [picom](https://github.com/yshui/picom)
-   **Browser**: [firefox](https://www.mozilla.org/en-US/firefox/)
-   **File Manager**: [thunar](https://github.com/xfce-mirror/thunar)
-   **Apps Launcher**: [rofi](https://github.com/davatorium/rofi)
<details >
<summary style="color:red;">Do you want to see more? do here click<-- </summary>
<img src="https://github.com/krovuxdev/krovuxdev.nix/assets/62192487/d6d97a13-54e7-44fa-adaa-c22a11924af1" alt="img" align="left" width="640px">
</details>
