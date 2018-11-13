#!/usr/bin/env bash

RED='\033[0;31m'
LIGHTRED='\033[1;31m'
NC='\033[0m'
GREEN='\033[0;32m'
CURRENTUSER=$USER;
PURPLE='\033[0;35m'
BLUE='\033[0;34m'

printf "${RED}WARNING!${NC} ${LIGHTRED}Running this script will remove all your installed plugin!${NC}\n"
read -r -p  "Do you want to proceed? [y/N]: " response

if [[ "$response" =~ ^(yes|y)$ ]]
 then
   # Check if user exists.
   if id -u openideal_user >/dev/null 2>&1; then
     # Delete User.
     printf "${RED}Deleting user openideal_user...${NC}\n"
     sudo userdel -r openideal_user
     printf "${GREEN}openideal_user has been succesfully deleted!${NC}\n"
   else 
    printf "${LIGHTRED}Nothing to remove user ${BLUE}openideal_user${NC} ${LIGHTRED}is not existing.${NC}\n" 
   fi
   # Check if httpd is installed.
   if yum list installed "httpd" >/dev/null 2>&1; then
     printf "${RED}Removing httpd...${NC}\n"
     # Remove httpd plugin.
     sudo yum remove httpd -y
     printf "${GREEN}httpd has been succesfully removed!${NC}\n"
   else 
     printf "${LIGHTRED}Nothing to remove ${BLUE}httpd${NC} ${LIGHTRED}is not installed.${NC}\n"
   fi
   # End httpd
   # Check if php and php-pear are installed.
   if yum list installed  "php-pear" >/dev/null 2>&1; then
     printf "${RED}Removing  php-pear...${NC}\n"
     # Remove php-pear plugin.
     sudo yum remove php-pear -y
     printf "${GREEN}php-pear has been succesfully removed!${NC}\n"
   else 
     printf "${LIGHTRED}Nothing to remove ${BLUE}php-pear${NC} ${LIGHTRED}is not installed.${NC}\n"
   fi
   # End php and php-pear
   # Check if php-mysql is installed.
   if yum list installed "php-mysql" >/dev/null 2>&1; then
     printf "${RED}Removing php-mysql...${NC}\n"
     # Remove php-mysql plugin.
     sudo yum remove php-mysql -y
     printf "${GREEN}php-mysql has been successfully removed!${NC}\n"
   else
     printf "${LIGHTRED}Nothing to remove ${BLUE}php-mysql${NC} ${LIGHTRED}is not installed.${NC}\n"
   fi
   # End php-mysql
   # Check if drush is installed.
   if yum list installed "drush" >/dev/null 2>&1; then
     printf "${RED}Removing drush...${NC}\n"
     # Remove drush plugin.
     sudo yum remove drush -y
     printf "${GREEN}drush has been successfully removed!${NC}\n"
    else
     printf "${LIGHTRED}Nothing to remove ${BLUE}drush${NC} ${LIGHTRED}is not installed.${NC}\n"
    fi
    # End drush
    # Check if mysql-community-server is installed.
   if yum list installed "mysql-community-server" >/dev/null 2>&1; then
     printf "${RED}Removing mysql-community-server...${NC}\n"
     # Remove mysql-community-server plugin.
     sudo yum remove mysql-community-server -y
     printf "${GREEN}mysql-community-server has been successfully removed!${NC}\n"
    else
     printf "${LIGHTRED}Nothing to remove ${BLUE}mysql-community-server${NC} ${LIGHTRED}is not installed.${NC}\n"
    fi
    # End mysql-community-server
else
  printf  "${RED}You canceled it ${GREEN}${CURRENTUSER}!${NC}\n"
fi

