#!/bin/bash

# Запуск Ollama службы
sudo systemctl start ollama

# Бесконечный цикл для поддержания работы контейнера
while true; do
    sleep 3600
done