#!/bin/bash

# Установка Ollama
curl -fsSL https://ollama.com/install.sh | sh

# Загрузка русскоязычной модели (квантованная версия)
ollama pull mistral:7b-instruct-q4_0

# Настройка сервиса
sudo tee /etc/systemd/system/ollama.service > /dev/null <<EOL
[Unit]
Description=Ollama Service
After=network-online.target

[Service]
ExecStart=/usr/bin/ollama serve
User=ollama
Group=ollama
Restart=always
RestartSec=3
Environment="OLLAMA_HOST=0.0.0.0"

[Install]
WantedBy=default.target
EOL

# Запуск службы
sudo systemctl daemon-reload
sudo systemctl enable ollama
sudo systemctl start ollama