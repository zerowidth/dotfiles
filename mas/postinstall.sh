[ -n "$LINUX" ] && return

echo "Installing apps from the app store..."
list=$(cat << EOF
409183694 Keynote (9.2.1)
1091189122 Bear (1.7.8)
775737590 iA Writer (5.4.3)
419330170 Moom (3.2.17)
1265895169 Calendar 366 II (2.7.3)
411643860 DaisyDisk (4.8)
EOF
)

echo "$list" | awk '{print $1}' | xargs -t mas install
