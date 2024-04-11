
while :
 do
    clear
    echo "----------------------------------------"
    echo " Run GLM "
    echo "----------------------------------------"
    echo "[1] Run with plots.nml"
    echo "[2] Run with plots_aed.nml"
    echo "[3] Run with a custom plotting .nml file"
    echo "[4] Exit/Stop"
    echo "========================================"
    echo -n "Enter your menu choice [1-4]: "
    read yourch
    case $yourch in
      1)  ..\..\releasebinary\windows\glm+_3.3.1\glm+_3.3.1\glm+.exe --xdisp ;;
      2)  ..\..\releasebinary\windows\glm+_3.3.1\glm+_3.3.1\glm+.exe --xdisp plots_aed.nml ;;
      3) printf "Filename: "; read -r plots; ..\..\releasebinary\windows\glm+_3.3.1\glm+_3.3.1\glm+.exe --xdisp $plots ;;
      4)  exit 0 ;;
      *) echo "Invalid! Please select a choice of 1, 2, 3, or 4"; echo "Press a key. . ." ; read ;;
 esac
done