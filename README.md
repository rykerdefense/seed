## SEED (Self-contained Emergency Education Database)
### Ryker Defense


## Installation (macos/linux)

1. Open Terminal application and navigate to desired folder for installation location.
2. Clone repository (ssh preferred)
3. Change into base project directory and type `make build`


**From terminal:**

```bash
mkdir -p ~/Documents/projects
cd ~/Documents/projects
git clone git@github.com:rykerdefense/seed.git
cd seed
make build
```
*Note: for the initial installation, you will be prompted to enter the administrator password to modify the hosts/network configuration. This is only required once and will never be necessary again in the future.*

## General usage
#### The `make` command
This is the command and control center for the project with a robust and intuitive feature set and documentation to allow a high level of granular control over running, debugging, using, learning, and troubleshooting for both developers and first-timers using the command-line alike.

##### To see a list of available commands and their descriptions, simply type:
```bash
make
``` 
and press \<Enter\>.

##### To run a command, type:
```
make <subcommand>
```
and press \<Enter\>.

![make command example](./docs/assets/images/make-command.png)

### TO-DO:
- lots
- 