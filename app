#!/bin/bash
#################
##     app     ##
########################################################################
## Единая точка входа в приложение, без агрументов показывает справку ##
########################################################################
: '
 
  a. Подключить конфиг CLI-приложения
  b. Подключить алиасы проекта

  1. Если кол-во позиционных аргументов == 0, показать справку
  2. Провести валидацию 1-го аргумента
  3. Сохранить название операции, сдвинуть все аргументы влево на 1
  4. Если $operation == "aliases", выполнить скрипт aliases
  5. Если $operation == "up"
  6. Если $operation == "down"
  7. Если $operation == "update"
 
'
#########################################################################
func_wrapper_app () { 

  # a. Подключить конфиг CLI-приложения
  . other/cli/config

  # b. Подключить алиасы проекта
  . other/cli/aliases

  # c. Подключить необходимые в проекте цвета
  . other/cli/colors

  # 1. Если кол-во позиционных аргументов == 0, показать справку
  if [ $# == 0 ]; then 

    # 1.1. Выполнить help без опций
    . other/cli/help

    # 1.2. Завершить
    return

  fi

  # 2. Провести валидацию 1-го аргумента
  # - Если первый аргумент не пуст, но не является допустимым
  if [ $1 != "aliases" ] && [ $1 != "install" ] && [ $1 != "up" ] && [ $1 != "down" ] && [ $1 != "update" ]; then 

    # 2.1. Сообщить о недопустимом значении 1-го аргумента
    echo "--- app ---> Недопустимое значение 1-го аргумента"

    # 2.2. Завершить
    return

  fi

  # 3. Сохранить название операции, сдвинуть все аргументы влево на 1
  # - Название находится в 1-м аргументе
  operation=$1
  shift 1

  # 4. Если $operation == "aliases", выполнить скрипт aliases
  if [ $operation == "aliases" ]; then 

    # 4.1. Провести парсинг аргументов
    OPTIND=1
    while getopts ":h" opt; do
      case $opt in
        h)  
          # Показать справку для команды aliases
          . other/cli/help aliases  
          return
          ;;
        *) 
          # Ничего не делать
          return
          ;;
      esac
    done

    # 4.2. Выполнить скрипт aliases
    . other/cli/aliases

    # 4.3. Завершить
    return    

  fi

  # 5. Если $operation == "up"
  if [ $operation == "up" ]; then 

    # 5.1. Провести парсинг аргументов
    OPTIND=1
    while getopts ":h" opt; do
      case $opt in
        h)  
          # Показать справку для команды up
          . other/cli/help up
          return
          ;;
        *) 
          # Ничего не делать 
          return
          ;;
      esac
    done

    # 5.2. Выполнить скрипт up
    . other/cli/up

    # 5.3. Завершить
    return    

  fi

  # 6. Если $operation == "down"
  if [ $operation == "down" ]; then 

    # 6.1. Провести парсинг аргументов
    OPTIND=1
    while getopts ":h" opt; do
      case $opt in
        h)  
          # Показать справку для команды down
          . other/cli/help down  
          ;;
        *) 
          # Ничего не делать 
          ;;
      esac
    done

    # 6.2. Выполнить скрипт down
    . other/cli/down

    # 6.3. Завершить
    return    

  fi

  # 7. Если $operation == "update"
  if [ $operation == "update" ]; then 

    # 7.1. Провести парсинг аргументов
    OPTIND=1
    while getopts ":h" opt; do
      case $opt in
        h)  
          # Показать справку для команды update
          . other/cli/help update  
          ;;
        *) 
          # Ничего не делать 
          ;;
      esac
    done

    # 7.2. Выполнить скрипт update
    . other/cli/update

    # 7.3. Завершить
    return    

  fi

:;}
func_wrapper_app "$@"






