
---

# 🛠️ System Service Dashboard

A Bash script that provides a text-based, menu-driven interface using `dialog` for managing and monitoring system services and resources on Linux systems.

---

## 🚀 **About the Project**

The **System Service Dashboard** is a Bash-based service management and monitoring tool that leverages the `dialog` command to provide a user-friendly, text-based interface.  
It allows system administrators and Linux users to easily monitor system resources and manage services without the need for a graphical interface.

---

## ✅ **Features**

- Display the status of all services.
    
- Monitor CPU and RAM usage.
    
- Show disk storage information.
    
- Start, stop, and restart services.
    
- View detailed service resource usage (CPU, RAM).
    
- Display network interface information.
    
- Access `htop` for live system monitoring.
    

---

## 📦 **Requirements**

- **Linux OS** (tested on Ubuntu, Debian, CentOS)
    
- `dialog` package (`sudo apt install dialog` or `sudo yum install dialog`)
    
- `htop` (optional but recommended)
    
- Bash shell
    

---

## 🛠️ **Installation**

1. Clone the repository:
    
    ```bash
    git clone https://github.com/your-username/System-Service-Dashboard.git
    cd System-Service-Dashboard
    ```
    
2. Make the script executable:
    
    ```bash
    chmod +x service_dashboard.sh
    ```
    
3. Install required packages:
    
    ```bash
    sudo apt install dialog htop
    ```
    

---

## ▶️ **Usage**

1. Run the script:
    
    ```bash
    ./service_dashboard.sh
    ```
    
2. Use the arrow keys to navigate through the menu.
    
3. Press **Enter** to select an option.
    
4. Press **Esc** or **Cancel** to exit the current menu.
    

---

## 📋 **Menu Options**

|Option|Description|
|---|---|
|1. List Services|Displays all active services.|
|2. List Services with Resource Usage|Shows CPU and RAM usage for each service.|
|3. Show CPU and RAM Usage|Displays overall CPU and memory statistics.|
|4. Show Disk Storage Left|Displays disk usage information.|
|5. Show Service Status Summary|Provides a summary of active, inactive, and failed services.|
|6. Show Network Information|Displays network interface and IP address details.|
|7. HTOP - System Monitor|Opens the `htop` system monitor.|
|8. Start a Service|Prompts to start a specified service.|
|9. Stop a Service|Prompts to stop a specified service.|
|10. Restart a Service|Prompts to restart a specified service.|
|11. Check Service Status|Displays the status of a specified service.|
|12. Exit|Exits the dashboard.|

---

## 🛡️ **Error Handling**

- If a command fails, appropriate error messages are displayed to the user.
    
- Temporary files are securely created using `mktemp` and deleted after use to prevent data leakage.
    
- Invalid service names or unavailable services will display error messages.
    

---

## 🚀 **Improvement Suggestions**

- ✅ Implement input validation for service names to prevent command injection.
    
- ✅ Add logging to track user actions and service changes.
    
- ✅ Enhance error handling by capturing exit codes and displaying more informative messages.
    
- ✅ Add a confirmation dialog before restarting/stopping critical services.
    
- ✅ Provide a help section with command explanations and usage tips.
    
- ✅ Integrate SSH to manage services on remote servers.
    

---

## 📸 **Screenshots**

> **Main Menu:**

```
-------------------------------
|      Service Manager       |
-------------------------------
1. List Services             
2. List Services with Resource Usage  
3. Show CPU and RAM Usage    
4. Show Disk Storage Left    
...
5. Exit
```

---

> **Service Status Summary:**

```
Service Status Summary:  
Active: 20  
Inactive: 5  
Failed: 2  
```

---

## 👤 **Author**

- **Divyum Kinger** - B.E. CSE Student at Chitkara University, Punjab
    
- GitHub: [DIvyumKinger](https://github.com/DivyumKinger)
    

---
