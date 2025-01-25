#!/bin/bash
# Maptnh@S-H4CK13
# Chameleon

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'  

OUTPUT_DIR="/tmp"
mkdir -p /tmp/opt

img2txt -c /home/chameleon.jpg
echo -e "\033[1;35m ██████╗██╗  ██╗ █████╗ ███╗   ███╗███████╗██╗     ███████╗ ██████╗ ███╗   ██╗" && \
echo -e "\033[1;36m██╔════╝██║  ██║██╔══██╗████╗ ████║██╔════╝██║     ██╔════╝██╔═══██╗████╗  ██║" && \
echo -e "\033[1;31m██║     ███████║███████║██╔████╔██║█████╗  ██║     █████╗  ██║   ██║██╔██╗ ██║" && \
echo -e "\033[1;32m██║     ██╔══██║██╔══██║██║╚██╔╝██║██╔══╝  ██║     ██╔══╝  ██║   ██║██║╚██╗██║" && \
echo -e "\033[1;33m╚██████╗██║  ██║██║  ██║██║ ╚═╝ ██║███████╗███████╗███████╗╚██████╔╝██║ ╚████║" && \
echo -e "\033[1;37m ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝" 
echo -e "\033[0m"
echo -e "${MAGENTA}Chameleon                                          V1.0${NC}"
echo -e "${YELLOW}Maptnh@S-H4CK13 ${CYAN}https://github.com/MartinxMax/Chameleon${NC}"


show_help() {
    echo -e "${GREEN}Usage:${NC}"
    echo -e "  -gcc <source_file.c>     Compile the specified GCC source file."
    echo -e "  -h                       Show this help message."
    echo -e "${CYAN}Supported target architectures:${NC}"
    echo -e "  x86_64 (Linux), i386 (Linux), ARM (Linux), Windows (x86_64), Windows (i386)"
    exit 0
}


while [[ $# -gt 0 ]]; do
    case $1 in
        -gcc)
            GCC_SRC_FILE=$2
            echo -e "${GREEN}[+] GCC source file: $GCC_SRC_FILE${NC}"
            shift 2
            ;;
        -h|--help)
            show_help
            ;;
        *)
            echo -e "${RED}[!] Unknown option: $1${NC}"
            exit 1
            ;;
    esac
done

if [ -z "$GCC_SRC_FILE" ]; then
    echo -e "${RED}[!] Missing source file.${NC}"
    exit 1
fi

GCC_SRC_FILE_O=$(basename "$GCC_SRC_FILE" .c)

echo -e "${GREEN}[*] Compiling for x86_64 (Linux)...${NC}"
gcc -o "$OUTPUT_DIR/opt/${GCC_SRC_FILE_O}_linux_x86_64" "$OUTPUT_DIR/$GCC_SRC_FILE"

echo -e "${GREEN}[*] Compiling for i386 (Linux)...${NC}"
gcc -m32 -o "$OUTPUT_DIR/opt/${GCC_SRC_FILE_O}_linux_i386" "$OUTPUT_DIR/$GCC_SRC_FILE"

echo -e "${GREEN}[*] Compiling for ARM (Linux)...${NC}"
arm-linux-gnueabihf-gcc -o "$OUTPUT_DIR/opt/${GCC_SRC_FILE_O}_linux_arm" "$OUTPUT_DIR/$GCC_SRC_FILE"

echo -e "${GREEN}[*] Compiling for Windows (x86_64)...${NC}"
x86_64-w64-mingw32-gcc -o "$OUTPUT_DIR/opt/${GCC_SRC_FILE_O}_win_x86_64.exe" "$OUTPUT_DIR/$GCC_SRC_FILE" -lws2_32

echo -e "${GREEN}[*] Compiling for Windows (i386)...${NC}"
i686-w64-mingw32-gcc -o "$OUTPUT_DIR/opt/${GCC_SRC_FILE_O}_win_i386.exe" "$OUTPUT_DIR/$GCC_SRC_FILE" -lws2_32

echo -e "${CYAN}[+] Compilation is complete, and the generated files are in the opt directory in the working directory${NC}"
