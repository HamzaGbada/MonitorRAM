# MonitorRAM

I am a user of a PC with low RAM and well when using the OS System Monitor to see the evolution of my RAM I noticed that this last uses a significant part of the RAM; so I created this script to see the evolution of RAM only with a slight consumption of resources.

## Features

- **Real-time RAM monitoring** with live graph visualization
- **Low resource consumption** - lightweight shell scripts
- **Automatic data collection** - samples RAM usage every second
- **Live plotting** - gnuplot-based graph updates continuously
- **Auto-cleanup** - keeps only last 20 data points to maintain efficiency

## Prerequisites

This tool requires the following to be installed:

- **gnuplot** - for graphing RAM usage
- **gnome-terminal** - for launching separate monitoring windows
- **bash** - shell scripting

### Installing Dependencies

**On openSUSE/SUSE Linux:**

```bash
sudo zypper install gnuplot
```

**On Arch/Manjaro:**

```bash
sudo pacman -S gnuplot
```

**On Debian/Ubuntu:**

```bash
sudo apt-get install gnuplot
```

**On Fedora/RHEL:**

```bash
sudo dnf install gnuplot
```

## Use

First you should to clone the repository:

```
git clone https://github.com/HamzaGbada/MonitorRAM.git
cd MonitorRAM
```

Then you have to change the `main.sh` file execution rights

```
chmod +x main.sh
```

Finally, you need only to execute it:

```
./main.sh
```

## How It Works

When you run `main.sh`, two terminal windows will open:

1. **Data Collection Terminal** (background):

   - Runs `script/value.sh`
   - Collects RAM usage every second
   - Writes data to `file.dat` in "time value" format
   - Automatically resets after 20 data points

2. **Graph Display Terminal** (foreground):
   - Runs `script/graph.sh`
   - Displays live graph of RAM evolution
   - Updates every second with new data
   - Shows memory usage in MB over time

### Files

- `main.sh` - Main launcher script
- `script/value.sh` - RAM monitoring and data collection script
- `script/graph.sh` - Gnuplot visualization script
- `file.dat` - Temporary data file (auto-generated)

### Note

This tool works only on Linux systems with `/proc/meminfo` available.
