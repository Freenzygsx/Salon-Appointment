#!/bin/bash
echo -e "\n~~~~~ Salon Appointment ~~~~~\n"
echo -e "Welcome to the Salon, how can we help you?\n"

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo "Our services: "
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
   echo "$SERVICE_ID) $NAME"
  done
  echo -e "\nType the service id that you want (type 0 to exit): "
  read SERVICE_ID_SELECTED
  
  case $SERVICE_ID_SELECTED in
    1) HAIR_CUT ;;
    2) NAIL_TREATMENT ;;
    3) SKIN_CARE ;;
    4) MASSAGE ;;
    5) TANNING ;;
    0) EXIT ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac

}

HAIR_CUT(){
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=1")
  echo "What's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo "I don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo "What time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_TIME_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 1, '$SERVICE_TIME')")
    echo "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."

  else
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo "What time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_TIME_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 1, '$SERVICE_TIME')")
    echo "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
  
}

NAIL_TREATMENT(){
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=2")
  echo "What's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo "I don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONER', '$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo "What time would you like your nail treatment, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_TIME_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 2, '$SERVICE_TIME')")
    echo "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo "What time would you like your nail treatment, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_TIME_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 2, '$SERVICE_TIME')")
    echo "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

SKIN_CARE(){
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=3")
  echo "What's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo "I don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    echo "What time would you like your skin care, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_TIME_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 3, '$SERVICE_TIME') ")
    echo "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo "What time would you like your skin care, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_TIME_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 3, '$SERVICE_TIME')")
    echo "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MASSAGE(){
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=4")
  echo "What's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo "I don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    echo "What time would you like your massage, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_TIME_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 4, '$SERVICE_TIME')")
    echo "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo "What time would you like your massage, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_TIME_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 4, '$SERVICE_TIME')")
    echo "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

TANNING(){
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=5")
  echo "What's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo "I don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo "What time would you like your tanning, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_TIME_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 5, '$SERVICE_ID')")

    echo "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo "What time would you like your tanning, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_TIME_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 5, '$SERVICE_TIME')")
    echo "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

EXIT(){
  echo "See ya later!"
}

MAIN_MENU