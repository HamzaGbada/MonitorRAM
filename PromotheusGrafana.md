Let's set up Prometheus and Grafana for monitoring on **Manjaro Linux**. Since Manjaro is based on Arch Linux, the process is quite similar, with some minor differences in package management and installation.

### 1. **Install Prometheus on Manjaro**
You can install Prometheus using `pacman` (the Arch-based package manager).

Open a terminal and run:

```bash
sudo pacman -S prometheus
```

This will install Prometheus on your system.

Once installed, start Prometheus with:

```bash
sudo systemctl start prometheus
```

Enable Prometheus to start on boot:

```bash
sudo systemctl enable prometheus
```

Check that Prometheus is running:

```bash
sudo systemctl status prometheus
```

By default, Prometheus should be accessible at `http://localhost:9090`.

---

### 2. **Install Node Exporter**

To collect system metrics like CPU, RAM, and Disk usage, you'll need **Node Exporter**.

1. **Install Node Exporter** using `pacman`:

```bash
sudo pacman -S node_exporter
```

2. **Start Node Exporter**:

```bash
sudo systemctl start node_exporter
```

3. **Enable Node Exporter to start at boot**:

```bash
sudo systemctl enable node_exporter
```

By default, Node Exporter should be available at `http://localhost:9100`.

---

### 3. **Configure Prometheus to Scrape Node Exporter Metrics**

Now that Prometheus and Node Exporter are running, you'll need to configure Prometheus to scrape the data from Node Exporter.

1. Edit the Prometheus configuration file:

```bash
sudo nano /etc/prometheus/prometheus.yml
```

2. Add the following to the `scrape_configs` section (this tells Prometheus to scrape data from Node Exporter):

```yaml
scrape_configs:
  - job_name: 'node'
    static_configs:
      - targets: ['localhost:9100']
```

3. Save the file and exit (press `CTRL + X`, then `Y`, and `Enter`).

4. Reload Prometheus to apply the configuration changes:

```bash
sudo systemctl restart prometheus
```

---

### 4. **Install Grafana on Manjaro**

Grafana is a popular tool for visualizing the metrics collected by Prometheus.

1. **Install Grafana** from the Manjaro repositories:

```bash
sudo pacman -S grafana
```

2. **Start Grafana**:

```bash
sudo systemctl start grafana-server
```

3. **Enable Grafana to start at boot**:

```bash
sudo systemctl enable grafana-server
```

Grafana will be available at `http://localhost:3000`. By default, the login is `admin` for both username and password.

---

### 5. **Connect Grafana to Prometheus**

1. Open your browser and go to `http://localhost:3000`.

2. Log in using the default credentials:  
   **Username:** `admin`  
   **Password:** `admin`

   You will be prompted to change the password after the first login.

3. After logging in, click on the **gear icon** (⚙️) on the left sidebar, and then click **Data Sources**.

4. Click **Add data source**, then select **Prometheus**.

5. Set the **URL** field to `http://localhost:9090` (this is where Prometheus is running).

6. Click **Save & Test** to make sure Grafana can communicate with Prometheus.

---

### 6. **Create Dashboards in Grafana**

You can create your own dashboards, but a simpler option is to import a pre-configured one for system monitoring.

1. Click on the **+** icon on the left sidebar and choose **Import**.

2. In the **Dashboard ID** field, enter **1860** (this is a popular Node Exporter dashboard).

3. Click **Load** and then select your Prometheus data source from the dropdown.

4. Click **Import**, and you’ll now have a fully functional system monitoring dashboard in Grafana!

---

### 7. **Exploring Metrics**

After setting everything up, you should start seeing metrics in Grafana such as:

- **CPU usage** (`node_cpu_seconds_total`)
- **Memory usage** (`node_memory_MemTotal_bytes`, `node_memory_MemFree_bytes`, etc.)
- **Disk usage** (`node_disk_bytes_read`, `node_disk_bytes_written`, etc.)
- **Network usage** (`node_network_receive_bytes_total`, `node_network_transmit_bytes_total`, etc.)

---

### 8. **Optional: Installing NVIDIA GPU Metrics (If You Have a GPU)**

If you're using an NVIDIA GPU and want to monitor it through Prometheus, you can install the **nvidia-dcgm-exporter** to collect GPU stats.

1. **Install NVIDIA drivers** (if you haven't already):

```bash
sudo pacman -S nvidia nvidia-utils
```

2. **Install NVIDIA DCGM Exporter** from [NVIDIA's GitHub repo](https://github.com/NVIDIA/dcgm-exporter).

3. Once the exporter is running, you can configure Prometheus to scrape metrics from it like any other exporter.
