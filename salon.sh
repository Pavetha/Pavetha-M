#! /bin/bash

# Connect to the salon database and define helper function
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

# Display services menu
display_services() 
{
  echo -e "\nWelcome to the Salon! Here are our services:"
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICES" | while IFS=\| read SERVICE_ID SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
}

# Main script logic
book_appointment() {
  display_services

  # Prompt for service selection
  echo -e "\nPlease select a service by entering the service number:"
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  # If invalid service, show the menu again
  if [[ -z $SERVICE_NAME ]]; 
  then
    echo -e "\nInvalid service selection. Please try again."
    book_appointment
    return
  fi

  # Prompt for customer phone number
  echo -e "\nPlease enter your phone number:"
  read CUSTOMER_PHONE

  # Check if customer exists
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # If customer does not exist, prompt for name and add to database
  if [[ -z $CUSTOMER_NAME ]];
   then
    echo -e "\nYou are not in our system. Please enter your name:"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi

  # Get customer ID
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # Prompt for appointment time
  echo -e "\nPlease enter your preferred time for the $SERVICE_NAME:"
  read SERVICE_TIME

  # Insert the appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  # Confirm the booking
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}
# Start the script
book_appointment
