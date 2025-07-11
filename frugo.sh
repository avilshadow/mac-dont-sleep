#!/bin/bash

while true; do
  hour=$(date +%H)
  
  if [[ $hour -ge 9 && $hour -lt 20 ]]; then
    echo "[`date`] ДЕНЬ: блокуємо локскрін"
    caffeinate -d -s -t 600  # тримаємо дисплей і idle активним на 10 хв
  else
    echo "[`date`] НІЧ: дозволяємо локскрін, блокуємо logout"
    caffeinate -i -s -t 600  # тримаємо систему активною, але не дисплей
  fi

  sleep 1  # невелика пауза між циклами (caffeinate сам чекає в цей час)
done