#!/bin/bash
# system-check.sh
# Author: Joe-707
# Purpose: Verify key configurations from the Server Administration labs
#          (Users/Groups, Permissions, LAMP Stack)

echo "========================================"
echo " System Check Report"
echo " Generated: $(date)"
echo " Hostname:  $(hostname)"
echo " User:      $(whoami)"
echo "========================================"

echo ""
echo "[1] Department Directories"
for dir in /CNS_A /CNS_B /CNS_C /CNS_D /CNS_E; do
    if [ -d "$dir" ]; then
        echo "  OK    $dir exists"
        ls -ld "$dir"
    else
        echo "  MISSING  $dir"
    fi
done

echo ""
echo "[2] Department Groups"
for grp in CNS_A CNS_B CNS_C CNS_D CNS_E; do
    if getent group "$grp" > /dev/null; then
        echo "  OK    Group $grp exists"
    else
        echo "  MISSING  Group $grp"
    fi
done

echo ""
echo "[3] LAMP Stack Status"
for svc in apache2 mysql; do
    if systemctl is-active --quiet "$svc"; then
        echo "  OK    $svc is running"
    else
        echo "  DOWN  $svc is not running"
    fi
done

echo ""
echo "[4] PHP Version"
php -v | head -n 1

echo ""
echo "[5] Apache Listening Ports"
sudo ss -tlnp | grep -E ':80|:443' || echo "  No HTTP/HTTPS listener found"

echo ""
echo "========================================"
echo " End of Report"
echo "========================================"
