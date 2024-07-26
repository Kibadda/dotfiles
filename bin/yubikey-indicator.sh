socket="$XDG_RUNTIME_DIR/yubikey-touch-detector.socket"

while true; do
  if [ ! -e "$socket" ]; then
    echo "Waiting for Yubikey socket\n"
    while [ ! -e "$socket" ]; do sleep 1; done
  fi

  echo ""

  nc -U "$socket" | while read -n5 cmd; do
    if [ $(echo $cmd | cut -d'_' -f2) = "1" ]; then
      echo "🔑 Yubikey 🔑"
    else
      echo ""
    fi
  done

  sleep 1
done
